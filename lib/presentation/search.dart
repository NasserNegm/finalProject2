import 'package:final_project/presentation/home_page.dart';
import 'package:final_project/presentation/post.dart';
import 'package:final_project/presentation/profile.dart';
import 'package:final_project/presentation/reels.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => const Search()));
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
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) => const Post()));
      //             },
      //             child: Icon(Icons.add_box_outlined, color: Colors.blue)),
      //       ),
      //       NavigationDestination(
      //         icon: const Icon(Icons.video_collection_sharp),
      //         label: '',
      //         selectedIcon: InkWell(
      //             onTap: () {
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) => const Reels()));
      //             },
      //             child: const Icon(Icons.video_collection_sharp,
      //                 color: Colors.blue)),
      //       ),
      //       InkWell(
      //         onTap: () {},
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => const Profile()));
      //           },
      //           child: Container(
      //             margin: const EdgeInsets.only(
      //                 left: 20, right: 20, top: 5, bottom: 20),
      //             // padding: EdgeInsets.all(1),
      //             height: 40,
      //             // width: 40,
      //             decoration: BoxDecoration(
      //                 shape: BoxShape.circle,
      //                 border: Border.all(color: Colors.white, width: 1)),
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
          Container(
            margin:
                const EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
            padding: const EdgeInsets.only(left: 10),
            height: 48,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: TextFormField(
              ////I create variable from controller type to call in logbutton.
              // controller: emailController,

              textInputAction: TextInputAction.next,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,

              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                border: InputBorder.none,
              ),
            ),
          ),
          Wrap(
            children: [
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 155,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
              Container(
                height: 150,
                width: 131,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.asset(
                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                  fit: BoxFit.cover,
                  height: 150,
                  width: 131,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
