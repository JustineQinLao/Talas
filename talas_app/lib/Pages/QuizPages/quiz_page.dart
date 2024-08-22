import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talas_app/Utils/style.dart';

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage> {
  final _avatarController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _avatarController.text = prefs.getString('avatar') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final List<Map<String, String>> items = [
      {'image': 'assets/images/home_cat1.png', 'text': 'Kaalaman sa \nAklat at Limbag'},
      {'image': 'assets/images/home_cat2.png', 'text': 'Kamalayang \nPonolohiya'},
      {'image': 'assets/images/home_cat3.png', 'text': 'Mga Titik \nat Alpabeto'},
      {'image': 'assets/images/home_cat4.png', 'text': 'Talasalitaan'},
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.darkbrown,
          iconTheme: IconThemeData(
            color: CustomColors.white,
          ),
          leadingWidth: width * 0.31,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.01),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: CustomButtons.buttonStyle(
                backgroundColor: CustomColors.cream,
                textColor: CustomColors.white,
              ),
              child: Text(
                'Bumalik',
                style: CustomFonts.iniText(fontsize: width * 0.045, color: CustomColors.darkbrown),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: CustomColors.darkbrown,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Rocket.png', // Replace with your background image
              fit: BoxFit.cover,
            ),
          ),
          // Foreground Content
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pagbutihin mo ${_nameController.text.trim()}!',
                            style: CustomFonts.iniText(
                              fontsize: width * 0.05,
                              color: CustomColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // _showAvatarSelection(context);
                          // widget.controllerTab.animateTo(3);
                        },
                        child: Container(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              child: CircleAvatar(
                                radius: width * 0.1,
                                backgroundColor: Colors.transparent,
                                child: CircleAvatar(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      backgroundColor: CustomColors.cream,
                                      radius: width * 0.04,
                                      child: Text(
                                        '1',
                                        style: CustomFonts.iniText(
                                          fontsize: width * 0.04,
                                          color: CustomColors.darkbrown,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  radius: width * 0.1,
                                  backgroundImage: AssetImage(_avatarController.text),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    SizedBox(width: width * 0.03),
                    Text(
                      "Mga Kategoriya ng Pagsasanay",
                      style: CustomFonts.iniText(
                        fontsize: width * 0.065,
                        color: CustomColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: height * 0.65,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.035),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: width * 0.02,
                      crossAxisSpacing: width * 0.04,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return GestureDetector(
                        onTap: () {
                          _showDialog();
                        },
                        child: Stack(
                          children: [
                            Transform(
                              transform: Matrix4.skewY(-0.17),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  CustomColors.white,
                                  BlendMode.modulate,
                                ),
                                child: Container(
                                  width: width * 0.5,
                                  margin: EdgeInsets.symmetric(vertical: height * 0.05),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: CustomColors.white,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: height * 0.135,
                              left: width * 0.045,
                              child: Text(
                                item['text'] ?? '',
                                style: CustomFonts.quizText(
                                  fontsize: width * 0.04,
                                  color: CustomColors.darkbrown,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: height * 0.165,
                              left: width * 0.09,
                              child: Image(
                                image: AssetImage(item['image']!),
                                height: width * 0.4,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String? selectedDifficulty;
  _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
      title: Text(
        'Select Difficulty',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: Text('Easy'),
              value: 'Easy',
              groupValue: selectedDifficulty,
              onChanged: (value) {
                setState(() {
                  selectedDifficulty = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Medium'),
              value: 'Medium',
              groupValue: selectedDifficulty,
              onChanged: (value) {
                setState(() {
                  selectedDifficulty = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Hard'),
              value: 'Hard',
              groupValue: selectedDifficulty,
              onChanged: (value) {
                setState(() {
                  selectedDifficulty = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.red),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(selectedDifficulty); // Return selected difficulty
          },
          child: Text('OK'),
        ),
      ],
    );
      });
  }
}
