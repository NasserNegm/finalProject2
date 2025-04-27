import 'package:flutter/material.dart';

class CreateReel extends StatelessWidget {
  const CreateReel({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Share a moment with \n     the world ',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Choose your first Reel',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    ));
  }
}
