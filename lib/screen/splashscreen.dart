import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pr_6_galaxy_planets/screen/homescreen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, 'home');
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 90, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Space',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
                Text(
                  'Exploration',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'View More',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img/bg.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
