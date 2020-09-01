

import 'package:cybespace/core/viewModels/userVM.dart';
import 'package:cybespace/ui/screens/loanPage.dart';
import 'package:cybespace/ui/widgets/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cybespace/ui/widgets/box.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin{
  final List<BoxData> boxData = [
    BoxData(name: "Active Loan", icon: Icons.person),
    BoxData(name: "Cash Remitted", icon: Icons.person),
    BoxData(name: "Daily Income", icon: Icons.person),
    BoxData(name: "Customer Record", icon: Icons.person),
  ];

  final List<UsersData> _userData = [
    UsersData(name: "Adeboye",time: "31 july", amount: "N50,000"),
    UsersData(name: "Adeboye",time: "31 july", amount: "N50,000"),
    UsersData(name: "Adeboye",time: "31 july", amount: "N50,000"),
    UsersData(name: "Adeboye",time: "31 july", amount: "N50,000"),UsersData(name: "Adeboye",time: "31 july", amount: "N50,000"),
    UsersData(name: "Adeboye",time: "31 july", amount: "N50,000"),
    UsersData(name: "Adeboye",time: "31 july", amount: "N50,000"),
    UsersData(name: "Adeboye",time: "31 july", amount: "N50,000"),
    UsersData(name: "Adeboye",time: "31 july", amount: "N50,000"),
    UsersData(name: "Adeboye",time: "31 july", amount: "N50,000"),
  ];
  TabController _tc;
  UserVM _userVm;

  @override
  void initState() {
    _tc = TabController(length: 2, vsync: this);
    _userVm = UserVM();
    getUsers();
    super.initState();
  }


  void getUsers()async{
    await _userVm.sortUsers();
    print (_userVm.approvedUser[0].avatar);
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return _userVm.approvedUser.length ==0?
    Container(color:Colors.white,child:
    CupertinoActivityIndicator()):Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Agent Dashboard",style: TextStyle(color: Color.fromRGBO(61, 54, 142, 1.0),fontSize: 14)),
        centerTitle: true,
        actions: [
          SizedBox(width: 15),
          CircleAvatar(backgroundColor: Colors.transparent,child: Icon(Icons.person,size: 35,))
        ],
        elevation: 0,
        backgroundColor: Color.fromRGBO(217, 244, 244, 1.0),
      ),
      body: Column(
          children:[
            Container(
              child: Row(
                children: [
                  Text("Approved \n 15", style: TextStyle(color: Colors.white,fontSize: 15,)),
                  Text("|",style: TextStyle(fontSize: 50)),
                  Text("Pending \n 32", style: TextStyle(color: Colors.white,fontSize: 15,)),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              ),
              decoration: BoxDecoration(color: Color.fromRGBO(61, 54, 142, 1.0),borderRadius: BorderRadius.circular(3)),
              margin: EdgeInsets.all(20),
            ),

            Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color:Colors.white),
                margin: EdgeInsets.only(left: 30.0,right: 30.0),
                child: Row(
                  children: [
                    SizedBox(width: 10.0),
                    CircleAvatar(backgroundColor: Color.fromRGBO(217, 244, 244, 1.0)),
                    SizedBox(width: 10.0),
                    Text("New Loan Request",style: TextStyle(color: Color.fromRGBO(64, 56, 150, 1.0),fontSize: 10.0,fontWeight: FontWeight.w500),)
                  ],mainAxisAlignment: MainAxisAlignment.start,
                )
            ),
            GridView.count(crossAxisCount: 2,children: boxData.map((e) => Box(name: e.name,icon: e.icon)).toList(),shrinkWrap: true,childAspectRatio: 1.7,),
            Expanded(child:Container(child: Column(
                children:[
                  TabBar(tabs: <Widget>[
                    Text("Approved",style: TextStyle(color: Color.fromRGBO(27, 20, 100, 1.0),fontSize: 12)),
                    Text("Pending",style: TextStyle(color: Color.fromRGBO(97, 97, 97, 1.0),fontSize: 12)),
                  ],indicatorColor:  Color.fromRGBO(27, 20, 100, 1.0),labelColor: Color.fromRGBO(27, 20, 100, 1.0),labelStyle: TextStyle(color: Color.fromRGBO(27, 20, 100, 1.0),fontSize: 12),controller: _tc,labelPadding: EdgeInsets.all(20),),
             Expanded(child: TabBarView(children: [
                    ListView(
                      children: _userVm.approvedUser.map((e) => Users(name: e.firstName,time: e.time,amount: e.amount,url: e.avatar,)).toList(),shrinkWrap: true,
                    ),
               ListView(
                 children: _userVm.pendingUsers.map((e) => Users(name: e.firstName,time: e.time,amount: e.amount,url: e.avatar)).toList(),shrinkWrap: true,
               )
                  ],controller: _tc,))

                ])))
          ]
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon:Icon(Icons.settings,color: Colors.black45,),backgroundColor: Colors.white,title: Text("")),
        BottomNavigationBarItem(icon:Icon(Icons.security,color: Colors.black45,),backgroundColor: Colors.white,title: Text("")),
        BottomNavigationBarItem(icon:Icon(Icons.person,color: Colors.black45,),backgroundColor: Colors.white,title: Text("")),
        BottomNavigationBarItem(icon:Icon(Icons.payment,color: Colors.black45,),backgroundColor: Colors.white,title: Text("")),
        BottomNavigationBarItem(icon:Icon(Icons.print,color: Colors.black45,),backgroundColor: Colors.white,title: Text(""))
      ],backgroundColor: Color.fromRGBO(74, 63, 177, 1.0),onTap: (a)=> Navigator.push(context, CupertinoPageRoute(builder: (context) => LoanPage()))),

    )
    ;
  }

}