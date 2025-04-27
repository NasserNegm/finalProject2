import 'package:final_project/presentation/home_page.dart';
import 'package:final_project/presentation/post.dart';
import 'package:final_project/presentation/profile.dart';
import 'package:final_project/presentation/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Reels extends StatefulWidget {
  const Reels({super.key});

  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
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
          //         icon: Icon(
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
          //           child: Icon(
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
          //       const NavigationDestination(
          //         icon: Icon(Icons.video_collection_sharp),
          //         label: '',
          //         selectedIcon:
          //             Icon(Icons.video_collection_sharp, color: Colors.blue),
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
          body: Column(
        children: [
          Row(
            children: [
              Text(
                'Reels',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
            ],
          ),
          Expanded(
            child: SizedBox(
              // height: double.infinity,
              // width: double.infinity,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/2021_05_15_16_22_IMG_2450.JPG',
                          ),
                          Positioned(
                            right: 20,
                            bottom: 200,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                )),
                          ),
                          Positioned(
                              right: 20,
                              bottom: 150,
                              child: SvgPicture.asset(
                                'assets/message.svg',
                                color: Colors.white,
                              )),
                          Positioned(
                              right: 20,
                              bottom: 100,
                              child: SvgPicture.asset(
                                'assets/send.svg',
                                color: Colors.white,
                              )),
                          Positioned(
                            bottom: 60,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, top: 5, bottom: 20),
                                  // padding: EdgeInsets.all(1),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 1)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.asset(
                                        "assets/2021_05_15_16_22_IMG_2450.JPG",
                                        fit: BoxFit.cover,
                                        // height: 40,
                                        // width: 20,
                                      )),
                                ),
                                Text(
                                  'user',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 20,
                            bottom: 30,
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            bottom: 30,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.my_library_music_outlined,
                                  color: Colors.blue,
                                )),
                          ),
                          Positioned(
                            bottom: 50,
                            right: 0,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_horiz_rounded,
                                  color: Colors.white,
                                  size: 40,
                                )),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
