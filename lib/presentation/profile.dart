import 'dart:math';

import 'package:final_project/presentation/home_page.dart';
import 'package:final_project/presentation/edit_profile.dart';
import 'package:final_project/presentation/create_reel.dart';
import 'package:final_project/presentation/post.dart';
import 'package:final_project/presentation/reels.dart';
import 'package:final_project/presentation/search.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: NavigationBar(
        //     selectedIndex: index,
        //     onDestinationSelected: (index) => setState(
        //           () => this.index = index,
        //         ),
        //     height: 60,
        //     destinations: [
        //       NavigationDestination(
        //         icon: const Icon(
        //           Icons.home,
        //         ),
        //         label: '',
        //         selectedIcon: InkWell(
        //           onTap: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const HomePage()));
        //           },
        //           child: const Icon(
        //             Icons.home,
        //             color: Colors.blue,
        //           ),
        //         ),
        //       ),
        //       NavigationDestination(
        //         icon: Icon(Icons.search),
        //         label: '',
        //         selectedIcon: InkWell(
        //           onTap: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const Search()));
        //           },
        //           child: Icon(Icons.search,
        //               color: Color.fromARGB(255, 47, 139, 214)),
        //         ),
        //       ),
        //       NavigationDestination(
        //         icon: Icon(Icons.add_box_outlined),
        //         label: '',
        //         selectedIcon: InkWell(
        //             onTap: () {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => const Post()));
        //             },
        //             child: Icon(Icons.add_box_outlined, color: Colors.blue)),
        //       ),
        //       NavigationDestination(
        //         icon: Icon(Icons.video_collection_sharp),
        //         label: '',
        //         selectedIcon: InkWell(
        //             onTap: () {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => const Reels()));
        //             },
        //             child:
        //                 Icon(Icons.video_collection_sharp, color: Colors.blue)),
        //       ),
        //       InkWell(
        //         onTap: () {},
        //         child: InkWell(
        //           onTap: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const Profile()));
        //           },
        //           child: Container(
        //             margin: const EdgeInsets.only(
        //                 left: 20, right: 20, top: 5, bottom: 20),
        //             // padding: EdgeInsets.all(1),
        //             height: 40,
        //             // width: 40,
        //             decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 border: Border.all(color: Colors.amber, width: 3)),
        //             child: ClipRRect(
        //                 borderRadius: BorderRadius.circular(40),
        //                 child: Image.asset(
        //                   "assets/2021_05_15_16_22_IMG_2450.JPG",
        //                   fit: BoxFit.cover,
        //                   // height: 40,
        //                   // width: 20,
        //                 )),
        //           ),
        //         ),
        //       ),
        //     ]),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SvgPicture.asset('assets/@.svg'),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.add_box_outlined)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Container(
                        height: 80,
                        // width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.amber, width: 3)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.asset(
                              "assets/2021_05_15_16_22_IMG_2450.JPG",
                              fit: BoxFit.cover,
                              height: 80,
                              width: 80,
                            )),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 4),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Center(
                                child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )),
                          )),
                    ],
                  ),
                ),
                const Text(
                  'post',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const Text(
                  'followers',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const Text(
                  'following',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfileScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 35,
                      width: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(child: Text('Edit profile')),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 35,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(child: Text('Share profile')),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 35,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Icon(
                      Icons.person_add,
                    ))),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Discover people',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 80,
                      // width: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.amber, width: 3)),
                      child: ClipRRect(
                          // borderRadius: BorderRadius.circular(80),
                          child: Image.asset(
                        "assets/2021_05_15_16_22_IMG_2450.JPG",
                        fit: BoxFit.cover,
                        height: 200,
                        width: 100,
                      )),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.menu))),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateReel()));
                    },
                    icon: const Icon(Icons.video_collection_sharp)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person_pin_rounded)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Complete your profile',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '3 of 4',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'complete',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                        border: Border.all(width: sqrt1_2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset('assets/message.svg')),
                        const Text(
                          'Add a bio',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        const Text(
                          'Tell ypur followers a little bit about yourself',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50),
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Add bio',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                        border: Border.all(width: sqrt1_2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                shape: BoxShape.circle),
                            child: const Icon(Icons.people_outline)),
                        const Text(
                          'Find people to follow',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Follow 5 or more accounts',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 75),
                          height: 30,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Find more',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                        border: Border.all(width: sqrt1_2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                shape: BoxShape.circle),
                            child: Icon(Icons.person_outline)),
                        const Text(
                          'Add your name',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Add your full name so your friends know its you',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 55),
                          height: 30,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Edit name',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                        border: Border.all(width: sqrt1_2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                shape: BoxShape.circle),
                            child: const Icon(Icons.person_pin)),
                        const Text(
                          'Add a profile photo',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Choose a photo to represent yourself on instagram.',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 35),
                          height: 30,
                          width: 140,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Change photo',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
