import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    {'image': 'assets/images/avatar.png', 'text': 'Item 1'},
    {'image': 'assets/images/avatar.png', 'text': 'Item 1'},
    {'image': 'assets/images/avatar.png', 'text': 'Item 1'},
    {'image': 'assets/images/avatar.png', 'text': 'Item 1'},
  ];

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
                            child: Icon(
                              Icons.camera_alt,
                              size: width * 0.04,
                              color: CustomColors.darkbrown,
                            ),
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
            children: [
            Text("KATEGORYA", style: CustomFonts.iniText(fontsize: width * 0.08, color: CustomColors.darkbrown, fontWeight: FontWeight.w500)),
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
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: width * 0.04),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColors.cream
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          item['image']!,
                          height: 80, // Adjust height as needed
                          width: 80,  // Adjust width as needed
                        ),
                        SizedBox(height: 8),
                        Text(item['text']!),
                      ],
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
