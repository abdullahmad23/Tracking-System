import 'package:auto_mobile_tracker/components.dart';
import 'package:auto_mobile_tracker/create_car.dart';
import 'package:auto_mobile_tracker/login.dart';
import 'package:auto_mobile_tracker/notifcation.dart';
import 'package:auto_mobile_tracker/user_home.dart';
import 'package:auto_mobile_tracker/user_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const UserHome(),
    const CreateCar(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> logout(BuildContext context) async {
      const CircularProgressIndicator();
      await FirebaseAuth.instance.signOut();
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu),
        //   color: Colors.black,
        // ),
        centerTitle: true,
        title: const Consttext(
            ctext: "Auto Tracking System",
            kfontw: FontWeight.w500,
            kfonts: 20.0,
            kcolor: kcolor),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserSetting(),
                ),
              );
            },
            icon: const Icon(Icons.person),
            // iconSize: 10,
            color: Colors.black,
          )
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0x7f00ABE7),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_rental),
              label: 'Add Car',
              backgroundColor: Color(0x7f00ABE7),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.request_page),
            //   label: 'Request',
            //   backgroundColor: Colors.yellowAccent,
            // ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 20,
          onTap: onItemTapped,
          elevation: 0),
    );
  }
}
