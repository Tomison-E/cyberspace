import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Box extends StatelessWidget{

  final IconData icon;
  final String name;

  Box({this.name,this.icon});


  @override
  Widget build(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(3.0)
    ),
    height: 72,
    child: Row(
      children: [
        SizedBox(width: 10.0),
        CircleAvatar(backgroundColor: Color.fromRGBO(217, 244, 244, 1.0)),
        SizedBox(width: 10.0),
        Text("New Loan Request",style: TextStyle(color: Color.fromRGBO(64, 56, 150, 1.0),fontSize: 10.0,fontWeight: FontWeight.w500),)
      ],mainAxisAlignment: MainAxisAlignment.start,
    ),
    margin: EdgeInsets.only(top: 20,left: 20,right: 20),
  );
  }

}

class BoxData{
  final IconData icon;
  final String name;

  BoxData({this.name,this.icon});
}