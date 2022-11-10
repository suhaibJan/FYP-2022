import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fypeasy/screen/login.dart';

import '../widgetss/button.dart';
import '../widgetss/textform.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String dropdownValue = 'Users';
  TextEditingController Name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Pass = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController Contact = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int count = 0;
  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value == null) {
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
        count=1;

      return null;
    }
  }

  String? validatePasswordLength(String value) {
    if (value.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password can't be empty"),
        ),
      );
      //   return "Password can't be empty";
    } else if (value.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be longer than 10 characters"),
        ),
      );
      //  return "Password must be longer than 10 characters";
    } else {
      count=2;
    }

    return null;
  }

  String? validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Name is Required"),
        ),
      );
      // return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Name must be a-z and A-Z"),
        ),
      );
      // return "Name must be a-z and A-Z";
    }else {
      count=3;
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Address is Required"),
        ),
      );
      // return "Name is Required";
    }else{
      count=3;
    }
    return null;
  }

  String? validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mobile is Required"),
        ),
      );
      //   return "Mobile is Required";
    } else if (value.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mobile number must 10 digits"),
        ),
      );
      //   return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mobile Number must be digits"),
        ),
      );
      //return "Mobile Number must be digits";
    } else {
      count=4;
    }
    return null;
  }

  SignupFunc() {
    validateName(Name.text);
    validateEmail(email.text);
    validatePasswordLength(Pass.text);
    validateAddress(Address.text);
    validateMobile(Contact.text);
    if (_formKey.currentState!.validate()) {
      print(count);
      if(count == 4){
        Signup(dropdownValue, Name.text, email.text, Pass.text, Address.text, Contact.text);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Processing Data'),
          ),
        );
      }
    }
  }
  void Signup(_Nodename,_name ,_email , _Password, _Address , _Contact){
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    print(date);
    DatabaseReference DB = FirebaseDatabase.instance.reference();
    DB.child(_Nodename).set({
      "Name": _name.toString(),
      "email": _email.toString(),
      "password": _Password.toString(),
      "Address": _Address.toString(),
      "Contact": _Contact.toString(),
      "date" : date.toString(),

    });
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
                    textform('Name', Name),
                    SizedBox(
                      height: 10,
                    ),
                    textform('Email', email),
                    SizedBox(
                      height: 10,
                    ),
                    textform('Password', Pass),
                    SizedBox(
                      height: 10,
                    ),
                    textform('Address', Address),
                    SizedBox(
                      height: 10,
                    ),
                    textform('Contact', Contact),
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 100.w,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
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

                        // Text('Forget password ?'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Textform(),
                    InkWell(
                        onTap: (){
                             // Signup
                             SignupFunc();
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => const Login()),
                              // );
                            },
                        child: Container(child: butoon('Signup'))),
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
