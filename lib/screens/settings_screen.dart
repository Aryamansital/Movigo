import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  int screen_index = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Text("This is Settings Screen"),
        ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            screen_index = index;
          });
        },
        currentIndex: screen_index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: "Recommender"),
          BottomNavigationBarItem(icon: Icon(Icons.library_add), label: "Watchlist"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_rounded), label: "Settings"),
        ],
        backgroundColor: const Color(0xFF09090F),
        selectedItemColor: Color(0xFF00B5F3),
        unselectedItemColor: Colors.white,
        // type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
