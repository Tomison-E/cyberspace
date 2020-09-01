import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  final String name;
  final String time;
  final String amount;

  Users({this.name,this.amount,this.time});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:Card(elevation: 5.0,shadowColor: Color.fromRGBO(0, 0, 0, 0.15),
        child: Row(
          children: [
            Container(
              height:50.0,
              color: Colors.green,
              width: 3,
            ),
            SizedBox(width: 10.0),
            CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.person)),
            Column(
              children: [
                Text(name, style: TextStyle(color: Color.fromRGBO(66, 66, 66, 1.0),fontSize: 10)),
                Text(time, style: TextStyle(color: Color.fromRGBO(187, 187, 187, 1.0),fontSize: 8)),
              ],
            ),
            Spacer(),
            Text(amount,style: TextStyle(color:Color.fromRGBO(50, 39, 166, 1.0),fontSize: 10))
          ],
        ),
      ),
      height: 50,
    );
  }

}

class UsersData{
  final String name;
  final String time;
  final String amount;

  UsersData({this.name,this.amount,this.time});
}