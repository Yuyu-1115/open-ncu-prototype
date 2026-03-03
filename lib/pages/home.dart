import 'package:flutter/material.dart';
import 'package:prototype/components/announcement_card.dart';
import 'package:prototype/components/course_card.dart';
import 'package:prototype/components/quick_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 0),
            child: Row(
              children: [
                Text(
                  '接下來的課程',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                IconButton(
                  onPressed: () => print('查看課表'),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) => CourseCard(
                courseName: '計算機概論 I',
                courseTime: '週四 13:00-16:00',
                courseLocation: '工程五館 A207',
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '快速功能表',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    QuickButton(
                      icon: Icons.book,
                      label: "成績查詢",
                      onPressed: () {
                        print('成績查詢');
                      },
                    ),
                    SizedBox(width: 10.0),
                    QuickButton(
                      icon: Icons.explore,
                      label: "選課系統",
                      onPressed: () {
                        print('選課系統');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    QuickButton(
                      icon: Icons.book,
                      label: "成績查詢",
                      onPressed: () {
                        print('成績查詢');
                      },
                    ),
                    SizedBox(width: 10.0),
                    QuickButton(
                      icon: Icons.explore,
                      label: "選課系統",
                      onPressed: () {
                        print('選課系統');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    QuickButton(
                      icon: Icons.book,
                      label: "成績查詢",
                      onPressed: () {
                        print('成績查詢');
                      },
                    ),
                    SizedBox(width: 10.0),
                    QuickButton(
                      icon: Icons.explore,
                      label: "選課系統",
                      onPressed: () {
                        print('選課系統');
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 0),
            child: Row(
              children: [
                Text(
                  '校務公告',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                IconButton(
                  onPressed: () => print('查看課表'),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return AnnouncementCard(label: '公告', title: '維護公告');
              },
              separatorBuilder: (context, index) => SizedBox(height: 8.0),
              itemCount: 3,
            ),
          ),
        ),
      ],
    );
  }
}
