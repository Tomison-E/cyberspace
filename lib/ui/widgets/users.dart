import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  final String name;
  final String time;
  final String amount;
  final String url;
  Users({this.name,this.amount,this.time,this.url});
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
            CircleAvatar(backgroundImage: NetworkImage(url),backgroundColor: Colors.black45,),
            SizedBox(width: 20.0),
            Column(
              children: [
                Text(name, style: TextStyle(color: Color.fromRGBO(66, 66, 66, 1.0),fontSize: 10)),
                Text(time, style: TextStyle(color: Color.fromRGBO(187, 187, 187, 1.0),fontSize: 8)),
              ],
            ),
            Spacer(),
            Text(amount,style: TextStyle(color:Color.fromRGBO(50, 39, 166, 1.0),fontSize: 10)),
            SizedBox(width: 20.0),
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