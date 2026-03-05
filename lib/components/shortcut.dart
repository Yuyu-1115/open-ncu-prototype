import 'package:flutter/material.dart';

class ShortcutCircular extends StatelessWidget {
  const ShortcutCircular({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    this.onPressed, 
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // define isDark to determine the current theme mode
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed ?? () {}, // provide a default empty callback to avoid null issues
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
            // maintain the same color but adjust opacity based on the theme mode
            backgroundColor: color.withValues(alpha: isDark ? 0.24 : 0.12),
            foregroundColor: color,
            elevation: 0,
            minimumSize: const Size.fromRadius(32),
          ),
          child: Icon(icon, size: 28.0, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}