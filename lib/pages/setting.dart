import 'package:flutter/material.dart';
import 'package:prototype/main.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('設定')),
      body: ListView(
        children: [
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, mode, _) => SwitchListTile(
              title: const Text('深色模式'),
              subtitle: Text(mode == ThemeMode.dark ? '開啟' : '關閉'),
              secondary: Icon(
                mode == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              value: mode == ThemeMode.dark,
              onChanged: (_) => themeNotifier.toggle(),
            ),
          ),
        ],
      ),
    );
  }
}
