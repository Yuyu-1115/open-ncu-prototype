import 'package:flutter/material.dart';
import 'package:prototype/components/label.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key, required this.label, required this.title});

  final String label;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Label(text: label, color: Colors.blueAccent),
              SizedBox(width: 8.0),
              Text(
                title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
