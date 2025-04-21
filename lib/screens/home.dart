import 'package:demo_app_v1_1/widgets/card.dart';
import 'package:demo_app_v1_1/widgets/posts_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: MyCard(title: 'Get Posts', description: "This is GET Posts API"),
    );
  }
}
