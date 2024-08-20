import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talas_app/Utils/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    check();
  }
  void check() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('started', false);
    prefs.setBool('createdAvatar', false);
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blue,
      ),
      body: Container(),
    );
  }
}