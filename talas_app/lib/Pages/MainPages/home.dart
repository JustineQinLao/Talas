import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talas_app/Pages/MainPages/kaalaman.dart';
import 'package:talas_app/Pages/QuizPages/quiz_page.dart';
import 'package:talas_app/Utils/style.dart';

class HomeTab extends StatefulWidget {
  final TabController controllerTab;
  const HomeTab({super.key, required this.controllerTab});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final _nameController = TextEditingController();
  final _avatarController = TextEditingController();


  final List<Map<String, String>> items = [
    {'image': 'assets/images/home_cat1.png', 'text': 'Kaalaman sa \nAklat at Limbag'},
    {'image': 'assets/images/home_cat2.png', 'text': 'Kamalayang \nPonolohiya'},
    {'image': 'assets/images/home_cat3.png', 'text': 'Mga Titik \nat Alpabeto'},
    {'image': 'assets/images/home_cat4.png', 'text': 'Talasalitaan'},
  ];

  void initState() {
    getUserInfo();
    super.initState();
    
  }

  void getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _avatarController.text = prefs.getString('avatar') ?? '';
    });
  }

  void dispose() {
    _nameController.dispose();
    _avatarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.03),
      child: Column(children: [
        SizedBox(height: height * 0.03),

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi ${_nameController.text.trim()}!',
                  style: CustomFonts.iniText(
                      fontsize: width * 0.07,
                      color: CustomColors.darkbrown,
                      fontWeight: FontWeight.w500)),
              Text('Today is a good day \n to learn something new!',
                  style: CustomFonts.iniText(
                      fontsize: width * 0.03, color: CustomColors.darkbrown)),
            ],
          ),
          GestureDetector(
            onTap: () {
              // _showAvatarSelection(context);
              widget.controllerTab.animateTo(3);
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
                            child: Text('1', style: CustomFonts.iniText(fontsize: width * 0.04, color: CustomColors.darkbrown, fontWeight: FontWeight.bold)),
                            // Icon(
                            //   Icons.camera_alt,
                            //   size: width * 0.04,
                            //   color: CustomColors.darkbrown,
                            // ),
                          ),
                        ),
                        radius: width * 0.1,
                        backgroundImage: AssetImage(_avatarController.text),
                        // AssetImage('assets/images/avatar.png'),
                      ),
                    ),
                  )),
            ),
          ),
        ]),

          SizedBox(height: height * 0.05,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("KATEGORYA", style: CustomFonts.iniText(fontsize: width * 0.08, color: CustomColors.darkbrown, fontWeight: FontWeight.w500)),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => QuizHomePage()));
              },
              style: CustomButtons.buttonStyle(textColor: CustomColors.cream, width: width * 0.25, height: height * 0.055),
              child: Text('Pagsasanay', style: CustomFonts.buttonText(fontsize: width * 0.04, fontWeight: FontWeight.w800)),
              
              )
          ]
          ),

          SizedBox(height: height * 0.02,),

           Expanded(
             child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
               child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: width * 0.04, // Space between columns
                  mainAxisSpacing: width * 0.04, // Space between rows
                  childAspectRatio: .8, // Aspect ratio of each item
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      try {
                        if(index == 0) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Category1()));
                        }else if(index == 1) {
                          
                        }
                        else if(index == 2) {
                          
                        }
                        else if(index == 3) {
                          
                        }

                      }
                      catch(e) {
                        print(e);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: width * 0.04),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(item['image']!),
                          fit: BoxFit.cover
                        ),
                        color: CustomColors.cream
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image.asset(
                          //   'assets/images/background.png',
                          //   // Adjust height as needed
                          //   height: width * 0.2,
                          //   width: width * 0.2,  // Adjust width as needed
                          // ),
                          SizedBox(height: 8),
                    
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(item['text']!,
                                  style: CustomFonts.iniText(fontsize: width * 0.04, color: CustomColors.darkbrown, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                         ),
             ),
           )

      ]),
    );
  }
}
