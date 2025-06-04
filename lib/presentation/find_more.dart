import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FindMore extends StatelessWidget {
  const FindMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: Text(
            'Discover people',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  "assets/2021_05_15_16_22_IMG_2450.JPG",
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                )),
                          ),
                        ),
                        Text('Name'.tr()),
                        Container(
                            height: 30,
                            width: 70,
                            decoration: const BoxDecoration(color: Colors.blue),
                            child: Center(child: Text('Folow'.tr()))),
                        const Icon(Icons.cancel_rounded)
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
