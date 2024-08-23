import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talas_app/Utils/style.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {


  void initState() {
    super.initState();
    checkStatus();

  }

  void checkStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final started = prefs.getBool('started') ?? false;
    final createdAvatar = prefs.getBool('createdAvatar') ?? false;

    if(started && !createdAvatar) {
      Navigator.of(context).pushReplacementNamed('/create_avatar');
    }
    else if (started && createdAvatar) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
    // else if (started && !createdAvatar) {
    //   Navigator.of(context).pushReplacementNamed('/create_avatar');
    // }
    else {
      Navigator.of(context).pushReplacementNamed('/get_started');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: width * 0.2,
          height: width * 0.2,
          child: CircularProgressIndicator()),
      ],
    );
  }
}
