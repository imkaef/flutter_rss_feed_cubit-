import 'package:flutter/material.dart';
import 'package:rss_cubit/pages/news24_page/news24_page.dart';

import 'last_new_page/last_news_page.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  var _selectedTab = 0;

  void _onSelectTab(int index) {
    if (index != _selectedTab) {
      _selectedTab = index;
    }
    setState(() {});
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
   // _selectedTab = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sports.ru Feeds'),
      ),
      body: IndexedStack(
        children: const [
          LastNewsPage(),
          News24(),
        ],
        index: _selectedTab,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onSelectTab,
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bubble_chart_outlined), label: 'footbal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.next_week_outlined), label: 'allnews'),
        ],
      ),
    );
  }
}
