import 'package:flutter/material.dart';

import '../lib/riana/ChatTampilan.dart';
import '../lib/riana/ProfilAdmin.dart';

void main() {
  runApp(const KostRadarPreview());
}

class KostRadarPreview extends StatefulWidget {
  const KostRadarPreview({super.key});

  @override
  State<KostRadarPreview> createState() =>
      _KostRadarPreviewState();
}

class _KostRadarPreviewState
    extends State<KostRadarPreview> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    ChatTampilan(),
    ProfilAdmin(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KostRadar Admin',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1976D2),
        ),
      ),
      home: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.chat_bubble_outline,
              ),
              selectedIcon: Icon(
                Icons.chat_bubble,
              ),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_outline,
              ),
              selectedIcon: Icon(
                Icons.person,
              ),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}