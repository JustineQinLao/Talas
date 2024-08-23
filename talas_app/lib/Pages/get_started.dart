import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talas_app/Utils/style.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
            Flexible(
                flex: 7,
                child: Container(
                   decoration: const BoxDecoration(
                     color: CustomColors.brown,
                    //  borderRadius: BorderRadius.only(
                    //    bottomRight: Radius.circular(40.0),
                    //  ),
                     image: DecorationImage(
                       image: AssetImage('assets/images/init.png'),
                       fit: BoxFit.fill
                     )
                   )
                )),
            Flexible(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Matuto at Tuklasin',
                        style: CustomFonts.iniText(fontsize: 35),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Pag-aralan ang Alpabetong Pilipino at Palawakin ang Iyong Bokabularyo!',
                      textAlign: TextAlign.center,
                      style: CustomFonts.iniText(fontsize: 12),
                      )
                    ]
                  ),
                )),
            Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('started', true);
                          
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        style: CustomButtons.buttonStyle(),
                        child: Text('Get Started'
                        , style: CustomFonts.buttonText(fontsize: 20),),

                                      ),
                    ],
                  )
              ))
        ])));
  }

  
}