import 'package:cybespace/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoanPage();
  }
}
  class _LoanPage extends State<LoanPage>{
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     key: _scaffoldKey,
      appBar:  AppBar(
        leading: Icon(Icons.person),
        title: Text("LOAN APPLICATION",style: TextStyle(color: Color.fromRGBO(61, 54, 142, 1.0),fontSize: 15)),
        centerTitle: true,
        actions: [
          Text("step 1/5",style: TextStyle(color: Colors.black45,fontSize: 13)),
          SizedBox(width: 35),
        ],
        elevation:0,
        backgroundColor: Color.fromRGBO(217, 244, 244, 1.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Card(margin: EdgeInsets.only(left:20,right: 20,top:30), child: Padding(padding: EdgeInsets.all(15),child:Column(children:[
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cursus lectus magna imperdiet commodo. Eu dolor consectetur morbi ullamcorper cursus. Cursus non gravida integer purus neque feugiat justo cras",style:
              TextStyle(fontSize: 12,color: Colors.black45)),
              SizedBox(height: 20),
              Text("Calculate your Loan",style: TextStyle(color: Color.fromRGBO(27, 20, 100, 1.0),fontSize: 18)),
              SizedBox(height: 40),
              RegisterForm(_scaffoldKey),
              ],crossAxisAlignment: CrossAxisAlignment.start,))),
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                Expanded(child: RaisedButton(onPressed: ()=>{},child: Text("Next",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),color:Color.fromRGBO(61, 54, 142, 1.0),highlightColor: Colors.white,hoverColor: Colors.black,textColor: Colors.black87,padding: EdgeInsets.only(left: 60.0,right: 60.0))),
                SizedBox(width: 20),
              ],mainAxisAlignment: MainAxisAlignment.center,
            ),
          ]
        ),
      )
    );
  }
    
  }

class RegisterForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;
  const RegisterForm(this._scaffoldKey,{Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _formWasEdited = false;
  Validators validate;
  TextEditingController txt;
  bool p1 =true; bool p2 =true;
  String firstName,lastName,email,phoneNumber,password;


  @override
  void initState() {
    validate = Validators(_formWasEdited);
    txt=  TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    txt.dispose();
    super.dispose();
  }

  void showInSnackBar(String value) {
    widget._scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(value)
    ));
  }



  Future<void> _handleSubmitted() async{
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidate = true; // Start validating on every change.
      showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      try {
        _showDialog(context);
        bool test = false;
        if(test){
          Navigator.pop(context);
          _autoValidate = false;
          _reset(form);
         // Navigator.pushNamed(context, UIData.authRoute);
        }
        else {
          Navigator.pop(context);
          showInSnackBar('Registeration Unsuccessful');
        }
      }
      catch(exception){
        print(exception);
        showInSnackBar(exception);
      }

    }
  }

  void _reset(FormState form){
    form.reset();
    txt.text="";
  }

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || !_formWasEdited || form.validate())
      return true;

    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: const Text('This form has errors'),
          content: const Text('Really leave this form?'),
          actions: <Widget> [
            new FlatButton(
              child: const Text('YES'),
              onPressed: () { Navigator.of(context).pop(true); },
            ),
            new FlatButton(
              child: const Text('NO'),
              onPressed: () { Navigator.of(context).pop(false); },
            ),
          ],
        );
      },
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      autovalidate: _autoValidate,
      onWillPop: _warnUserAboutInvalidData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Payment Plan',style: TextStyle(fontSize: 13,color: Colors.black45)),
          SizedBox(height: 10),
          TextFormField(
                decoration:  InputDecoration(
                    hintText: "30,000", suffixIcon: Icon(Icons.search),
                    focusColor: Colors.black45,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1.0)),labelStyle: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),
                    focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1.0))
                ),textInputAction: TextInputAction.done,onSaved: (String name)=>firstName=name, validator: (String name)=>validate.validateName(name),
              ),
          SizedBox(height: 20.0),
          Text('Loan Duration',style: TextStyle(fontSize: 13,color: Colors.black45)),
          SizedBox(height: 10),
          TextFormField(
            decoration:  InputDecoration(
                hintText: "select your duration", suffixIcon: Icon(Icons.search),
                focusColor: Colors.black45,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1.0)),labelStyle: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),
                focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1.0))
            ),textInputAction: TextInputAction.done,onSaved: (String name)=>firstName=name, validator: (String name)=>validate.validateName(name),
          ),
          SizedBox(height: 20.0),
          Text('Upfront Payment',style: TextStyle(fontSize: 13,color: Colors.black45)),
          SizedBox(height: 10),
          TextFormField(
            decoration:  InputDecoration(
                hintText: "30,000", suffixIcon: Icon(Icons.search),
                focusColor: Colors.black45,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1.0)),labelStyle: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),
                focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1.0))
            ),textInputAction: TextInputAction.done,onSaved: (String name)=>firstName=name, validator: (String name)=>validate.validateName(name),
          ),
          SizedBox(height: 20.0),
          Text('Refund',style: TextStyle(fontSize: 13,color: Colors.black45)),
          SizedBox(height: 10),
          TextFormField(
            decoration:  InputDecoration(
                hintText: "2,400", suffixIcon: Icon(Icons.search),
                focusColor: Colors.black45,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1.0)),labelStyle: TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500),
                focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.black45,width: 1.0))
            ),textInputAction: TextInputAction.done,onSaved: (String name)=>firstName=name, validator: (String name)=>validate.validateName(name),
          ),
          SizedBox(height: 20.0),
        ],mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return CupertinoAlertDialog(
          title: Text("Creating Account"),
          content: Column(
              children:[
                SizedBox(height: 20.0),
                CupertinoActivityIndicator()
              ]),
        );
      },
    );
  }

}
