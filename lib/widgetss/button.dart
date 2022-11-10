import 'package:flutter/material.dart';

import '../global.dart';


class butoon extends StatefulWidget {
 String? hint;


butoon(this.hint);

  @override
  State<butoon> createState() => _butoonState();
}

class _butoonState extends State<butoon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text('${widget.hint}',style: lognbtnstyle,)),
    );
  }
}
