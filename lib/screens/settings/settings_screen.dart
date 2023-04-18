import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int screen_index = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        backgroundColor: const Color(0xFF09090F),
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleLarge!.color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF043E4F),
                    borderRadius: BorderRadius.circular(10)),
                height: 100,
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 28,
                      child: Text("N"),
                    ),
                    SizedBox(
                      height: 60,
                      width: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Naman Jain",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "namanviber@gmail.com",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //#1
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/profile_edit');
                },
                child: SizedBox(
                  height: 70,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.account_circle_outlined,
                        size: 34,
                        color: Color(0xFF2196F3),
                      ),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      SizedBox(
                        height: 60,
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "My Account",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Make changes to your account",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/general_setting');
                },
                child: SizedBox(
                  height: 70,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.settings_outlined,
                        size: 34,
                        color: Color(0xFF2196F3),
                      ),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      SizedBox(
                        height: 60,
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "General Settings",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Maknage your General Settings",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, '/Set Your Preferences');
                },
                child: SizedBox(
                  height: 70,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.room_preferences,
                        size: 34,
                        color: Color(0xFF2196F3),
                      ),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      SizedBox(
                        height: 60,
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Set Your Preferences",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Setup your preferences again",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, '/check');
                },
                child: SizedBox(
                  height: 70,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.exit_to_app_outlined,
                        size: 34,
                        color: Color(0xFF2196F3),
                      ),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      SizedBox(
                        height: 60,
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign Out",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Sign Out from your account",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/about_us');
                },
                child: SizedBox(
                  height: 70,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.help_outline_outlined,
                        size: 34,
                        color: Color(0xFF2196F3),
                      ),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      SizedBox(
                        height: 60,
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "About Us",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/privacy_policy');
                },
                child: SizedBox(
                  height: 70,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.shield_outlined,
                        size: 34,
                        color: Color(0xFF2196F3),
                      ),
                      // const SizedBox(
                      //   width: 20,
                      // ),
                      SizedBox(
                        height: 60,
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        screen_index: 3,
      ),
    );
  }
}
