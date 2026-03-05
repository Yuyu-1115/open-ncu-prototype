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
          title: const Text(
            '訊息',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: _tabs.map((t) => Tab(text: t)).toList(),
          ),
        ),
        body: TabBarView(
          children: _tabs.map((tab) => _NewsTabContent(category: tab)).toList(),
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
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            itemCount: isAll ? 20 : 10,
            separatorBuilder: (_, _) => const SizedBox(height: 8.0),
            itemBuilder: (_, index) {
              final label = isAll
                  ? _allCategories[index % _allCategories.length]
                  : category;
              return AnnouncementCard(
                label: label,
                title: '$label消息 #${index + 1}',
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Divider(color: Theme.of(context).dividerColor, thickness: 1.0),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.arrow_back_ios, size: 16),
                    ),
                    Expanded(
                      child: Text(
                        '今日',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}
