import 'package:flutter/material.dart';
import 'package:untitled1/components/my_drawer_tile.dart';
import 'package:untitled1/services/auth/auth_service.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      child: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme
                  .of(context)
                  .colorScheme
                  .inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme
                  .of(context)
                  .colorScheme
                  .secondary,
            ),
          ),

          //anasyafa
          MyDrawerTile(
            text: "A N A S A Y F A",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          //ayarlar
          MyDrawerTile(
            text: "A Y A R L A R",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          const Spacer(),

          //cıkıs için
          MyDrawerTile(
            text: "Ç I K I Ş Y A P",
            icon: Icons.logout,
            onTap: () {
              logout();
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 25),


        ],
      ),
    );
  }
}
