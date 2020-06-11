import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ItemBranchJob extends StatelessWidget {
  final String title;

  ItemBranchJob({this.title});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 30,
      margin: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: Colors.white,
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(0, 153, 153, 1),
            fontWeight: FontWeight.bold
          ),
        ),
      ),

    );
  }
}
