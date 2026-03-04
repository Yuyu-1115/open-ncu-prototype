import 'package:flutter/material.dart';
import 'package:prototype/components/label.dart';

class CourseCard extends StatelessWidget {
  final String courseName;
  final String courseTime;
  final String courseLocation;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.courseTime,
    required this.courseLocation,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final subtextColor = colorScheme.onSurfaceVariant;

    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outlineVariant, width: 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.15),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Label(text: '必修', color: Colors.red),
                SizedBox(width: 5),
                Text(
                  courseName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.schedule, size: 14, color: subtextColor),
                SizedBox(width: 5),
                Text(
                  courseTime,
                  style: TextStyle(fontSize: 14, color: subtextColor),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on, size: 14, color: subtextColor),
                Text(
                  courseLocation,
                  style: TextStyle(fontSize: 14, color: subtextColor),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
