import 'package:flutter/material.dart';
import 'package:prototype/components/label.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key, required this.label, required this.title});

  final String label;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(text: label, color: Colors.blueAccent),
            const SizedBox(width: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
