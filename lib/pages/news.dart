import 'package:flutter/material.dart';
import 'package:prototype/components/announcement_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  static const _tabs = ['全部', '獎學金', '工讀職缺', '校務公告', '活動'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('訊息'),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: _tabs.map((t) => Tab(text: t)).toList(),
          ),
        ),
        body: TabBarView(
          children: _tabs
              .map((tab) => _NewsTabContent(category: tab))
              .toList(),
        ),
      ),
    );
  }
}

class _NewsTabContent extends StatelessWidget {
  const _NewsTabContent({required this.category});

  final String category;

  static const _allCategories = ['獎學金', '工讀職缺', '校務公告', '活動'];

  @override
  Widget build(BuildContext context) {
    final isAll = category == '全部';
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      itemCount: isAll ? 20 : 10,
      separatorBuilder: (_, __) => const SizedBox(height: 8.0),
      itemBuilder: (_, index) {
        final label = isAll ? _allCategories[index % _allCategories.length] : category;
        return AnnouncementCard(
          label: label,
          title: '$label消息 #${index + 1}',
        );
      },
    );
  }
}
