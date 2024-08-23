import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomColors {
  static const Color blue = Color.fromARGB(255, 143, 169, 192); // Purple

  static const Color darkbrown = Color.fromARGB(255, 120, 49, 44);

  static const Color brown = Color.fromARGB(255, 192, 109, 74);
  static const Color cream = Color.fromARGB(255, 243, 220, 196);
  static const Color lightcream = Color.fromARGB(255, 230, 220, 196);
  static const Color darkcream = Color.fromARGB(255, 250,184,133);

  static const Color green = Color.fromARGB(255, 0, 128, 0);

  static const Color orange = Color.fromARGB(255, 253, 128, 51);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  //yellow
  static const Color yellow = Color.fromARGB(255, 255, 255, 0);
  static const Color black = Color.fromARGB(255, 0, 0, 0);

}


class CustomFonts {
  static TextStyle iniText(
    {
      double fontsize = 20,
      FontWeight fontWeight = FontWeight.w400,
      Color color = Colors.black
    }
  ) {
    return GoogleFonts.cuprum(
      fontSize: fontsize,
      fontWeight: fontWeight,
      color: color
    );
  }

  static TextStyle quizText(
    {
      double fontsize = 20,
      FontWeight fontWeight = FontWeight.w400,
      Color color = Colors.black
    }
  ) {
    return GoogleFonts.permanentMarker(
      fontSize: fontsize,
      fontWeight: fontWeight,
      color: color
    );
  }

  static TextStyle errorText(
    {
      double fontsize = 12,
      FontWeight fontWeight = FontWeight.w400,
      Color color = Colors.red
    } 
  ) {
      return GoogleFonts.cuprum(
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: color
      );
    }
  
  static TextStyle categoryText(
    {
      double fontsize = 20,
      FontWeight fontWeight = FontWeight.w400,
      Color color = Colors.black,
      height = 1.1

    }
  ) {
    return GoogleFonts.cuprum(
      fontSize: fontsize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      shadows: [
        Shadow(
          offset: Offset(6.0,6.0), // Offset of the shadow
          blurRadius: 2.0, // Blur radius of the shadow
          color: CustomColors.darkbrown, // Color of the shadow
        ),
      ],
    );
  }

  static TextStyle buttonText(
    {
      double fontsize = 20,
      FontWeight fontWeight = FontWeight.w400,
      Color color = Colors.white
    }
  ) {
    return GoogleFonts.cuprum(
      fontSize: fontsize,
      fontWeight: fontWeight,
      color: color
    );
  }
}

class CustomButtons {
  static ButtonStyle buttonStyle(
    {
      Color backgroundColor = CustomColors.darkbrown,
      Color textColor = Colors.white,
      double fontsize = 17,
      FontWeight fontWeight = FontWeight.w400,
      double elevation = 0,
      double width = 170,
      double height = 50,
      double borderRadius = 30.0
    }
  ){
    return ElevatedButton.styleFrom(
      elevation: elevation,
      minimumSize: Size(width, height),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      backgroundColor: backgroundColor,
      textStyle: CustomFonts.buttonText(
        fontsize: fontsize,
        fontWeight: fontWeight
      )
    );
  }

}


class CustomIcons {
  static Icon styledIcon(
    {
      required IconData icon,
      Color color = CustomColors.white,
      double size = 30,
      double borderRadius = 0.0
    }
  ){
    return Icon(
      icon,
      color: color,
      size: size,

    );
  }

}