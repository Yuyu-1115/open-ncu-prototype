import 'package:flutter/material.dart';
import 'package:prototype/pages/home.dart';
import 'package:prototype/pages/setting.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('神奇松果')),
        body: <Widget>[
          HomePage(),
          SettingPage(),
          SettingPage(),
          SettingPage(),
        ][currentIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedIndex: currentIndex,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: '首頁'),
            NavigationDestination(icon: Icon(Icons.school), label: '校務系統'),
            NavigationDestination(icon: Icon(Icons.message), label: '聊天機器人'),
            NavigationDestination(icon: Icon(Icons.settings), label: '設定'),
          ],
        ),
      ),
    );
  }
}
