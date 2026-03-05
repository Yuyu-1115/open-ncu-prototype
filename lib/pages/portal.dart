import 'package:flutter/material.dart';

class PortalPage extends StatelessWidget {
  const PortalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('校務系統', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(child: Text('Welcome to the Portal Page!')),
    );
  }
}
