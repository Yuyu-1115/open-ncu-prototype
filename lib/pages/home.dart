import 'package:flutter/material.dart';
import 'package:prototype/components/announcement_card.dart';
import 'package:prototype/components/course_card.dart';
import 'package:prototype/components/quick_button.dart';
import 'package:prototype/components/shortcut.dart';
import 'package:prototype/pages/curriculum.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _horizontalPadding = 16.0;
  static const _sectionSpacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('神奇松果')),
      body: CustomScrollView(
        slivers: [
          _buildCourseSection(context),
          _buildShortcutSection(context),
          _buildQuickActionSection(),
          _buildAnnouncementSection(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    String title, {
    VoidCallback? onTap,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          _horizontalPadding, _sectionSpacing, _horizontalPadding, 0,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (onTap != null)
              IconButton(
                onPressed: onTap,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseSection(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        _buildSectionHeader(
          '接下來的課程',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CurriculumPage()),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
                vertical: 4.0,
              ),
              itemCount: 3,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: 10),
              itemBuilder: (context, index) => CourseCard(
                courseName: '計算機概論 I',
                courseTime: '週四 13:00-16:00',
                courseLocation: '工程五館 A207',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShortcutSection(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        _buildSectionHeader(
          '捷徑',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CurriculumPage()),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: _horizontalPadding,
            vertical: 4.0,
          ),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: ShortcutCircular(
                      icon: Icons.school,
                      label: '校務系統',
                      color: Color(0xFF4A90D9),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ShortcutCircular(
                      icon: Icons.calendar_today,
                      label: '行事曆',
                      color: Color(0xFFE57373),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ShortcutCircular(
                      icon: Icons.mail_outline,
                      label: '信箱',
                      color: Color(0xFF66BB6A),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ShortcutCircular(
                      icon: Icons.library_books,
                      label: '圖書館',
                      color: Color(0xFFFF9800),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickButtonRow(List<({IconData icon, String label})> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: items
            .expand((item) => [
                  if (items.indexOf(item) > 0) const SizedBox(width: 10.0),
                  QuickButton(
                    icon: item.icon,
                    label: item.label,
                    onPressed: () => print(item.label),
                  ),
                ])
            .toList(),
      ),
    );
  }

  Widget _buildQuickActionSection() {
    return SliverMainAxisGroup(
      slivers: [
        _buildSectionHeader('快速功能表'),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: _horizontalPadding,
            vertical: 4.0,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildQuickButtonRow([
                (icon: Icons.book, label: '成績查詢'),
                (icon: Icons.explore, label: '選課系統'),
              ]),
              _buildQuickButtonRow([
                (icon: Icons.book, label: '成績查詢'),
                (icon: Icons.explore, label: '選課系統'),
              ]),
              _buildQuickButtonRow([
                (icon: Icons.book, label: '成績查詢'),
                (icon: Icons.explore, label: '選課系統'),
              ]),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildAnnouncementSection() {
    return SliverMainAxisGroup(
      slivers: [
        _buildSectionHeader(
          '校務公告',
          onTap: () => print('查看課表'),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 8.0),
              itemBuilder: (context, index) {
                return AnnouncementCard(label: '公告', title: '維護公告');
              },
              itemCount: 3,
            ),
          ),
        ),
      ],
    );
  }
}
