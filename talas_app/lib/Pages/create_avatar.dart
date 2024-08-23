import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talas_app/Utils/style.dart';

class CreateAvatar extends StatefulWidget {
  const CreateAvatar({super.key});

  @override
  State<CreateAvatar> createState() => _CreateAvatarState();
}

class _CreateAvatarState extends State<CreateAvatar> {
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    // final prefs = await SharedPreferences.getInstance();
    // prefs.setBool('started', false);
    // prefs.setBool('createdAvatar', false);
  }


  String _selectedAvatar = 'assets/images/avatar1.png';
  final _nameController = TextEditingController();
  var nameError = false;

  final List<String> _avatarList = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: CustomColors.lightcream,
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(children: [
                Container(
                  height: height * 0.28,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    SizedBox(
                      height: height * 0.10,
                    ),
                    Text(
                      'TALAS APP',
                      style: CustomFonts.iniText(fontsize: width * 0.15, color: CustomColors.darkbrown, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Pumili ng avatar at ilagay ang iyong pangalan sa Talas app",
                      style: CustomFonts.iniText(fontsize: 15, color: CustomColors.darkbrown),
                      textAlign: TextAlign.center,
                    )
                  ],),
                ),
                Container(
                  height: height * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(children: [
                        GestureDetector(
                          onTap: () {
                            _showAvatarSelection(context);
                          },
                          child: Container(
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: SizedBox(
                                  child: CircleAvatar(
                                    radius: 140.0,
                                    backgroundColor: Colors.transparent,
                                    child: CircleAvatar(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: CircleAvatar(
                                          backgroundColor: CustomColors.cream,
                                          radius: 30.0,
                                          child: Icon(
                                            Icons.camera_alt,
                                            size: 35.0,
                                            color: CustomColors.darkbrown,
                                          ),
                                        ),
                                      ),
                                      radius: 140.0,
                                      backgroundImage:
                                          AssetImage(_selectedAvatar),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ]),
                      SizedBox(height: height * 0.02),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 70),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _nameController,
                              style: CustomFonts.iniText(fontsize: 20, color: CustomColors.darkbrown),
                            
                              decoration:
                                  InputDecoration(
                                    labelText: 'Enter your name',
                                    labelStyle: CustomFonts.iniText(fontsize: 15, color: CustomColors.darkbrown),
                                    
                                    ),
                            ),

                            SizedBox(height: height * 0.005),
                            
                            Text( nameError ? "Hindi maaaring walang pangalan" :
                              "",
                              style: CustomFonts.errorText(fontsize: width * 0.02),
                              textAlign: TextAlign.left,
                            )
                            
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: height * 0.08,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            if(_nameController.text.isEmpty){ 
                              setState(() {
                                nameError = true;
                              });
                            }else{
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setBool('createdAvatar', true);
                              await prefs.setString('name', _nameController.text);
                              await prefs.setString('avatar', _selectedAvatar);

                              Navigator.of(context).pushReplacementNamed('/');
                            }

                            
                          },
                          style: CustomButtons.buttonStyle(),
                          child: Text(
                            'Save',
                            style: CustomFonts.buttonText(fontsize: 20),
                          ),
                        ),
                      ],
                    ))
              ]),
            ),
          ),
        ));
  }

  void _showAvatarSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: CustomColors.cream,
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            shrinkWrap: true,
            itemCount: _avatarList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedAvatar = _avatarList[index];
                  });
                  Navigator.of(context).pop();
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(_avatarList[index])),
              );
            },
          ),
        );
      },
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Introduction Screen'),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Form(
  //         key: _formKey,
  //         child: Column(
  //           children: [
  //             // Name Input
  //             TextFormField(
  //               decoration: InputDecoration(labelText: 'Enter your name'),
  //               onSaved: (value) {
  //                 setState(() {
  //                   _name = value!;
  //                 });
  //               },
  //               validator: (value) {
  //                 if (value == null || value.isEmpty) {
  //                   return 'Please enter your name';
  //                 }
  //                 return null;
  //               },
  //             ),

  //             SizedBox(height: 20),

  //             // Avatar Display
  //             GestureDetector(
  //               onTap: () => _showAvatarSelection(context),
  //               child: CircleAvatar(
  //                 radius: 40,
  //                 backgroundImage: AssetImage(_selectedAvatar),
  //               ),
  //             ),
  //             SizedBox(height: 10),
  //             Text('Tap the avatar to select an image'),

  //             SizedBox(height: 20),

  //             // Submit Button
  //             ElevatedButton(
  //               onPressed: () {
  //                 if (_formKey.currentState!.validate()) {
  //                   _formKey.currentState!.save();
  //                   // Handle form submission (e.g., save data, navigate to another screen)
  //                   print('Name: $_name');
  //                   print('Selected Avatar: $_selectedAvatar');
  //                 }
  //               },
  //               child: Text('Submit'),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // void _showAvatarSelection(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Dialog(
  //         child: GridView.builder(
  //           padding: const EdgeInsets.all(16.0),
  //           shrinkWrap: true,
  //           itemCount: _avatarList.length,
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             mainAxisSpacing: 10,
  //             crossAxisSpacing: 10,
  //           ),
  //           itemBuilder: (context, index) {
  //             return GestureDetector(
  //               onTap: () {
  //                 setState(() {
  //                   _selectedAvatar = _avatarList[index];
  //                 });
  //                 Navigator.of(context).pop();
  //               },
  //               child: Image.asset(_avatarList[index]),
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
}
