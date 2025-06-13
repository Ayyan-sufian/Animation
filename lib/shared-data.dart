import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class shareDataPg extends StatefulWidget{
  const shareDataPg({super.key});

  @override
  State<shareDataPg> createState() => _shareDataPgState();
}

class _shareDataPgState extends State<shareDataPg> {
  var saveDate = TextEditingController();

   static const String KEYNAME = "name";

   var nameValue = "No value saved";

  @override
  void initState() {
    super.initState();
    getValue();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Data'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: saveDate,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(color: Colors.blue)
                      )
                    ),
          
                  ),
                  SizedBox(height: 11,),
                  ElevatedButton(onPressed: ()  async {
                    var pref = await SharedPreferences.getInstance();
                    pref.setString(KEYNAME, saveDate.text.toString());
                  }, child: Text('Save')),
                  SizedBox(height: 11,),
                  Text(nameValue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void getValue() async {
    var pref = await SharedPreferences.getInstance();
    var getName = pref.getString(KEYNAME);
    nameValue = getName ?? " No value stored";
    setState(() {

    });
  }
}