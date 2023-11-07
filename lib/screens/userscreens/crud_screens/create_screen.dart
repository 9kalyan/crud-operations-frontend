import 'package:flutter/material.dart';
import 'package:crud/api.dart';
import 'package:get_storage/get_storage.dart';
class CreateScreen extends StatefulWidget {
  CreateScreen({Key? key}) : super(key: key);
  @override
  _CreateScreenState createState() => _CreateScreenState();
}
class _CreateScreenState extends State<CreateScreen> {
  final node1=FocusNode();
  final node2=FocusNode();
  final variable=TextEditingController();
  final value=TextEditingController();
  final box=GetStorage();
  final form_key=GlobalKey<FormState>();
  @override
  void initState() {
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return
      WillPopScope(
          onWillPop:() async{
            return true;
    },
        child:
      Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xffFFABAB)
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.tealAccent,
        padding: EdgeInsets.all(0.1*width),
        child:
        Form(
          key: form_key,
    child:
    Column(
          children: [
            SizedBox(height: 0.05*height,),
            TextField(
              controller: variable,
              focusNode: node1,
              onSubmitted: (va){
                FocusScope.of(context).requestFocus(node2);
              },
              decoration: InputDecoration(
                  labelText: "Enter the variable name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
              )),
            ),
            SizedBox(height: 0.03*height,),
            TextField(
              controller: value,
              focusNode: node2,
              decoration: InputDecoration(
                labelText: "Enter the value to be stored",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
              )),
            ),
            SizedBox(height: 0.03*height,),
            ElevatedButton(onPressed: ()async{
              await api.postRequestCreate(variable.text, value.text,box.read("user"));
            },
                child: Text("Create Field"))
          ],
        ),
      ),))

    );
  }
}
