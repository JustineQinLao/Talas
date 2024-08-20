import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talas_app/Pages/create_avatar.dart';
import 'package:talas_app/Pages/get_started.dart';
import 'package:talas_app/Pages/home_page.dart';
import 'package:talas_app/Pages/initial_screen.dart';
import 'package:talas_app/Utils/style.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue,
      systemNavigationBarColor: CustomColors.blue
    )
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => InitialScreen(),
        '/get_started': (context) => GetStarted(),
        '/home': (context) => HomePage(),
        '/create_avatar': (context) => CreateAvatar(),
        // '/secretkey': (context) => Secretkey(),
        // '/pin': (context) => PinScreen(),
        // '/login': (context) => Login(),
        // '/signup': (context) => Signup(),
        // '/home': (context) => HomePage(), 
      },
    );
  }
}
class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _selectedAvatar = 'assets/avatar1.png';

  final List<String> _avatarList = [
    'assets/avatar1.png',
    'assets/avatar2.png',
    'assets/avatar3.png',
    'assets/avatar4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name Input
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your name'),
                onSaved: (value) {
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              // Avatar Display
              GestureDetector(
                onTap: () => _showAvatarSelection(context),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(_selectedAvatar),
                ),
              ),
              SizedBox(height: 10),
              Text('Tap the avatar to select an image'),

              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle form submission (e.g., save data, navigate to another screen)
                    print('Name: $_name');
                    print('Selected Avatar: $_selectedAvatar');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAvatarSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
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
                child: Image.asset(_avatarList[index]),
              );
            },
          ),
        );
      },
    );
  }
}
