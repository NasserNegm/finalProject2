import 'package:final_project/presentation/home_page.dart';
import 'package:final_project/presentation/post.dart';
import 'package:final_project/presentation/profile.dart';
import 'package:final_project/presentation/reels.dart';
import 'package:final_project/presentation/search.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomNav> {
  int myindex = 0;

  List<Widget> widgetList = [HomePage(), Search(), Post(), Reels(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.amber,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              myindex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, color: Colors.black),
                label: '',
                activeIcon: Icon(
                  Icons.home_filled,
                  color: Colors.black,
                )),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                )),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_collection_sharp,
                  color: Colors.black,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.video_collection_sharp,
                  color: Colors.black,
                )),
            BottomNavigationBarItem(
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/2021_05_15_16_22_IMG_2450.JPG",
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                ),
                label: '',
                activeIcon: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/2021_05_15_16_22_IMG_2450.JPG",
                    fit: BoxFit.cover,
                    height: 40,
                    width: 40,
                  ),
                )),
          ]),
      body: Center(
        child: widgetList[myindex],
      ),
    );
  }
}
