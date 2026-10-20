import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = const [
      ('Sales', '1 250', Icons.attach_money),
      ('Orders', '48', Icons.shopping_cart_outlined),
      ('Customers', '312', Icons.people_outline),
      ('Rooms', '24', Icons.bed_outlined),
    ];
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        for (final s in stats)
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(s.$3, size: 36),
                const SizedBox(height: 8),
                Text(s.$2,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Text(s.$1),
              ],
            ),
          ),
      ],
    );
  }
}

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 10,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, i) => ListTile(
        leading: CircleAvatar(child: Text('${i + 1}')),
        title: Text('Order #${1000 + i}'),
        subtitle: Text('Table ${i + 1} • ${(i + 1) * 12}.500 DT'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        Center(child: CircleAvatar(radius: 48, child: Icon(Icons.person, size: 48))),
        SizedBox(height: 16),
        Center(child: Text('Static User', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
        SizedBox(height: 24),
        ListTile(leading: Icon(Icons.phone_outlined), title: Text('+216 00 000 000')),
        ListTile(leading: Icon(Icons.location_on_outlined), title: Text('Tunis, Tunisia')),
        ListTile(leading: Icon(Icons.badge_outlined), title: Text('Role: Administrator')),
      ],
    );
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SwitchListTile(value: true, onChanged: null, title: Text('Notifications')),
        SwitchListTile(value: false, onChanged: null, title: Text('Dark mode')),
        ListTile(leading: Icon(Icons.language), title: Text('Language'), subtitle: Text('English')),
        ListTile(leading: Icon(Icons.info_outline), title: Text('Version'), subtitle: Text('1.0.0')),
      ],
    );
  }
}
