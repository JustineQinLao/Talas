import 'dart:async';
import 'package:flutter/material.dart';
import 'package:talas_app/Utils/data.dart';
import 'package:talas_app/Utils/style.dart';

class Category1 extends StatefulWidget {
  const Category1({super.key});

  @override
  State<Category1> createState() => _Category1State();
}

class _Category1State extends State<Category1> {
  int? selectedIndex;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel(); // Cancel any active timer when the widget is disposed
    super.dispose();
  }

  void _onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Cancel the previous timer if it's still active
    _timer?.cancel();

    // Start a new timer
    _timer = Timer(Duration(milliseconds: 2000), () {
      setState(() {
        selectedIndex = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.darkbrown,
          iconTheme: IconThemeData(
            color: CustomColors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.045),
              child: Wrap(
                spacing: width * 0.02,
                runSpacing: width * 0.02,
                children: alphabets.map((letter) {
                  final currentIndex = alphabets.indexOf(letter);
                  return ElevatedButton(
                    onPressed: () => _onButtonPressed(currentIndex),
                    style: CustomButtons.buttonStyle(
                      backgroundColor: selectedIndex == currentIndex
                          ? CustomColors.darkbrown
                          : CustomColors.brown,
                      borderRadius: width * 0.02,
                      width: width * 0.21,
                    ),
                    child: Text(
                      letter,
                      style: CustomFonts.buttonText(
                        fontsize: width * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
