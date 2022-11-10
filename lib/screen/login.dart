import 'dart:math';

import 'package:fypeasy/screen/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgetss/button.dart';
import '../widgetss/textform.dart';
import '../widgetss/validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String dropdownValue = 'Users';
  TextEditingController email = new TextEditingController();
  TextEditingController Pass = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value ==  null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email is Required"),
        ),
      );
      //return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Email"),
        ),
      );
    //  return "Invalid Email";
    } else {
      return null;
    }
  }
  String? validatePasswordLength(String value){
    if(value.length==0){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password can't be empty"),
        ),
      );
   //   return "Password can't be empty";
    } else if (value.length < 10){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be longer than 10 characters"),
        ),
      );
    //  return "Password must be longer than 10 characters";
    }
    return null;
  }
    //return null;
  loginFunc() {
    validateEmail(email.text);
    validatePasswordLength(Pass.text);
    // if (_formKey.currentState!.validate()) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Processing Data'),
    //     ),
    //   );
    // }else{
    //   print(email.toString());
    //   print(Pass.toString().toString());
    // }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.network('https://easysalon.in/img/logo.png'),
                ),

                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    textform('Email',email),
                    SizedBox(
                      height: 10,
                    ),
                    textform('Password',Pass),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100.w,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white))),
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['Users', 'Parlor', 'Salone']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                       // Spacer(),

                        InkWell(
                            onTap: (){
                             // Signup
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const Signup()),
                              );
                            },
                            child:  Text('Signup ?')),
                      ],
                    ),
                     SizedBox(
                      height: 10,
                    ),
                    // Textform(),
                    InkWell(
                        onTap: (){
                          loginFunc();
                        },
                        child: Container(child: butoon('Login'))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
