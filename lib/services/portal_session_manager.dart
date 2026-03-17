import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

enum PortalSessionStatus { unknown, checking, authenticated, expired, error }

class PortalSessionManager extends ChangeNotifier {
  PortalSessionManager({
    CookieManager? cookieManager,
    Set<String> authHosts = const {'portal.ncu.edu.tw'},
  }) : _cookieManager = cookieManager ?? CookieManager.instance(),
       _authHosts = authHosts;

  final CookieManager _cookieManager;
  final Set<String> _authHosts;

  PortalSessionStatus _status = PortalSessionStatus.unknown;
  DateTime? _lastCheckedAt;
  Object? _lastError;
  String? _jsToken;
  String? _jsTokenSource;
  Future<void>? _activeCheck;

  PortalSessionStatus get status => _status;
  DateTime? get lastCheckedAt => _lastCheckedAt;
  Object? get lastError => _lastError;
  String? get jsToken => _jsToken;
  String? get jsTokenSource => _jsTokenSource;
  bool get hasJsToken => _jsToken != null && _jsToken!.isNotEmpty;

  bool get isAuthenticated => _status == PortalSessionStatus.authenticated;
  bool get isChecking => _status == PortalSessionStatus.checking;
  bool get isExpired => _status == PortalSessionStatus.expired;

  Future<void> refreshSessionStatus({Set<String>? probeHosts}) {
    if (_activeCheck != null) return _activeCheck!;

    final hosts = <String>{..._authHosts, ...?probeHosts};
    _activeCheck = _refresh(hosts).whenComplete(() => _activeCheck = null);
    return _activeCheck!;
  }

  void markExpired() {
    _jsToken = null;
    _jsTokenSource = null;
    _setStatus(PortalSessionStatus.expired);
  }

  void updateFromJsProbe({
    required String? token,
    String? source,
    Object? error,
  }) {
    _lastCheckedAt = DateTime.now();
    if (error != null) {
      _lastError = error;
      _setStatus(PortalSessionStatus.error);
      return;
    }

    final normalized = token?.trim();
    if (normalized != null && normalized.isNotEmpty) {
      _lastError = null;
      _jsToken = normalized;
      _jsTokenSource = source;
      _setStatus(PortalSessionStatus.authenticated);
      return;
    }

    _jsToken = null;
    _jsTokenSource = null;
    _setStatus(PortalSessionStatus.expired);
  }

  Future<Map<String, List<Cookie>>> snapshotCookiesForHosts(
    Set<String> hosts,
  ) async {
    final snapshots = <String, List<Cookie>>{};
    for (final host in hosts) {
      snapshots[host] = await _cookieManager.getCookies(
        url: WebUri.uri(Uri(scheme: 'https', host: host)),
      );
    }
    return snapshots;
  }

  Future<void> _refresh(Set<String> hosts) async {
    _setStatus(PortalSessionStatus.checking);
    _lastError = null;

    try {
      final nowMs = DateTime.now().millisecondsSinceEpoch;
      var hasValidCookie = false;
      for (final host in hosts) {
        final cookies = await _cookieManager.getCookies(
          url: WebUri.uri(Uri(scheme: 'https', host: host)),
        );

        final hostHasValid = cookies.any(
          (cookie) => cookie.expiresDate == null || cookie.expiresDate! > nowMs,
        );
        if (hostHasValid) {
          hasValidCookie = true;
          break;
        }
      }

      _lastCheckedAt = DateTime.now();
      final isAuthenticated = hasValidCookie || hasJsToken;
      _setStatus(
        isAuthenticated
            ? PortalSessionStatus.authenticated
            : PortalSessionStatus.expired,
      );
    } catch (error) {
      _lastCheckedAt = DateTime.now();
      _lastError = error;
      _setStatus(PortalSessionStatus.error);
    }
  }

  void _setStatus(PortalSessionStatus newStatus) {
    if (_status == newStatus) return;
    _status = newStatus;
    notifyListeners();
  }
}
