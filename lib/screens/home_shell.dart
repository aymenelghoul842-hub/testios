import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'tabs.dart';

class _TabItem {
  final String title;
  final IconData icon;
  final Widget page;
  const _TabItem(this.title, this.icon, this.page);
}

class HomeShell extends StatefulWidget {
  final String email;
  const HomeShell({super.key, required this.email});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  static const List<_TabItem> _tabs = [
    _TabItem('Home', Icons.home_outlined, HomeTab()),
    _TabItem('Orders', Icons.receipt_long_outlined, OrdersTab()),
    _TabItem('Profile', Icons.person_outline, ProfileTab()),
    _TabItem('Settings', Icons.settings_outlined, SettingsTab()),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_tabController.index].title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            for (final t in _tabs) Tab(icon: Icon(t.icon), text: t.title),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Static User'),
              accountEmail: Text(widget.email),
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person, size: 36),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  for (var i = 0; i < _tabs.length; i++)
                    ListTile(
                      leading: Icon(_tabs[i].icon),
                      title: Text(_tabs[i].title),
                      selected: _tabController.index == i,
                      onTap: () {
                        _tabController.animateTo(i);
                        Navigator.of(context).pop();
                      },
                    ),
                ],
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: _logout,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [for (final t in _tabs) t.page],
      ),
    );
  }
}
