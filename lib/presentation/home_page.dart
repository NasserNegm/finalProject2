import 'package:final_project/presentation/post.dart';
import 'package:final_project/presentation/profile.dart';
import 'package:final_project/presentation/reels.dart';
import 'package:final_project/presentation/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Instagram',
            style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'myfont'),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border)),
            SvgPicture.asset('assets/message.svg'),
          ],
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Story',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              'assets/2021_05_15_16_22_IMG_2450.JPG',
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: -2,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border:
                                  Border.all(width: 1.5, color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.pink, width: 2)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/m1.JPG",
                            fit: BoxFit.cover,
                            height: 65,
                            width: 65,
                          )),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.pink, width: 2)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/m2.JPG",
                            fit: BoxFit.cover,
                            height: 65,
                            width: 65,
                          )),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.pink, width: 2)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/m3.JPG",
                            fit: BoxFit.cover,
                            height: 65,
                            width: 65,
                          )),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.pink, width: 2)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/m4.JPG",
                            fit: BoxFit.cover,
                            height: 65,
                            width: 65,
                          )),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.pink, width: 2)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/m5.JPG",
                            fit: BoxFit.cover,
                            height: 65,
                            width: 65,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Your story',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Ruffles',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded))
            ],
          ),
          SizedBox(
              height: 600,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "assets/2021_05_15_16_22_IMG_2450.JPG",
                            height: 400,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black54),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 380),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 40),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite_border),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: SvgPicture.asset('assets/message.svg'),
                          ),
                          SvgPicture.asset('assets/send.svg'),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.bookmark_outline_sharp,
                            ),
                            selectedIcon: const Icon(
                              Icons.bookmark_border,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            '100',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Likes',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Text(
                              'Username',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            'nasserNegm',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ))
        ]));
  }
}
