// lib/pages/course_selection.dart
import 'package:flutter/material.dart';

class CourseSelectionPage extends StatelessWidget {
  const CourseSelectionPage({super.key});

  // 定義節次標籤
  static const List<String> periods = [
    '1',
    '2',
    '3',
    '4',
    'Z',
    '5',
    '6',
    '7',
    '8',
    '9',
    'A',
    'B',
    'C',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('聊天機器人')),
      body: Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            '2026 春季選課 (週一至週日 / 12節次)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        // 課表主體
        Expanded(
          child: Row(
            children: [
              // Y軸
              Column(
                children: [
                  const SizedBox(height: 30, width: 40),
                  ...periods.map(
                    (p) => Container(
                      height: 50,
                      width: 40,
                      alignment: Alignment.center,
                      child: Text(
                        p,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              // 7 x 13
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildWeekHeader(),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              mainAxisExtent: 50,
                            ),
                        itemCount: 84, // 7 * 13
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => _showSearchModal(context, index),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              child: const Center(child: Text('')),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  // 星期標籤
  Widget _buildWeekHeader() {
    const weekDays = ['一', '二', '三', '四', '五', '六', '日'];
    return Row(
      children: weekDays
          .map(
            (day) => Expanded(
              child: Container(
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  day,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  // 選課搜尋彈窗
  void _showSearchModal(BuildContext context, int index) {
    int day = (index % 7) + 1;
    String period = periods[index ~/ 7];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF252525),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              '新增課程 (週$day 第$period 節)',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                hintText: '輸入課程名稱或代碼搜尋...',
                prefixIcon: const Icon(Icons.search, color: Colors.cyan),
                filled: true,
                fillColor: Colors.black26,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const Expanded(child: Center(child: Text('請輸入關鍵字搜尋 NCU 課程資料'))),
          ],
        ),
      ),
    );
  }
}
