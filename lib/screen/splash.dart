
import 'package:fypeasy/screen/login.dart';
import 'package:flutter/material.dart';

import 'Homescreen.dart';



class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  naigate(){
    Future.delayed(Duration(seconds: 5), () {
      // 5s over, navigate to a new page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    naigate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.network('https://easysalon.in/img/logo.png'),
      ),
    );
  }
}
