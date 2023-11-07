
import 'dart:ffi';
import 'package:crud/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FocusNode first;late FocusNode second;
  late TextEditingController text1;
  late TextEditingController text2;
  @override
  void initState() {
    text1=TextEditingController();
    text2=TextEditingController();
    first=FocusNode();
    second=FocusNode();
    super.initState();
  }
  var channel=MethodChannel("bab");
final box=GetStorage();
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return
      WillPopScope(
          onWillPop:()async{
            final bool goback=await showDialog(context: context, builder: (cotext){
              return AlertDialog(
                title: Text("Do you want to quit?"),
                actions: [ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pop(context,true);
                  });
                }, child: Text("Yes",)),ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pop(context,false);
                  });
                }, child:Text("No"))],
              );
            });
            return Future.value(goback);
          },
          child:
      Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.tealAccent,
      body:
          Stack(
          children:[
            Padding(padding: EdgeInsets.only(bottom: 0.01*height),child:
            Align(alignment: Alignment.bottomCenter,
                child:Lottie.asset("assets/ka.json")),
            ),Center(
        child: Container(
          height: 0.5*height,
          width: 0.9*width,
          padding: EdgeInsets.all(0.05*width),
          child: Column(
            children: [
              SizedBox(child:
              TextFormField(
                onFieldSubmitted: (v){
                  first.unfocus();
                  FocusScope.of(context).requestFocus(second);
                },
                style: GoogleFonts.abrilFatface(fontWeight: FontWeight.bold,letterSpacing: 2),
                enabled: true,
                onTap: (){
                  second.unfocus();
                },

                focusNode: first,
                controller: text1,
                decoration: InputDecoration(
                  hintText: "Your Username",
                  labelText: "UserName",
                  labelStyle: GoogleFonts.abrilFatface(fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),


                ),
              )
              )
              ,
              SizedBox(height: 0.05*width,),

              SizedBox(child:
              TextFormField(
                obscureText: true,
                style: GoogleFonts.abrilFatface(fontWeight: FontWeight.bold,
                letterSpacing: 2
                ),
                onFieldSubmitted: (v){
                  second.unfocus();
                  first.unfocus();
                },
                onTap: (){
                  first.unfocus();
                },
                validator: (v){

                },

                focusNode: second,
                controller: text2,

                decoration: InputDecoration(
                  labelStyle: GoogleFonts.abrilFatface(fontWeight: FontWeight.bold),
                  labelText: "Password",
                  hintText: "Your password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                          style: BorderStyle.solid
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                  ),


                ),
              )
              ),
              Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly
    ,children:[

              TextButton(onPressed: ()async{
                dynamic go =await api.sendRequestUsernameCheck(
                    text1.text, text2.text);
                if(go['status']=="Success"){
                  showDialog(context: context, builder:(context)=>
                      WillPopScope(
                          onWillPop: ()async{
                            return false;
                          },
                          child:
                      Scaffold(
                    body: Center(
                      child: Lottie.asset('assets/loading.json'),
                    ),
                  )));
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.of(context).pop();
                  Get.offAllNamed('/userintro');
                  box.write("user",text1.text);
                  box.write("login",true);
                }
                else{
                  Get.snackbar(
                  "Alert",
                  "Wrong password or Username",
                  colorText: Colors.white,
                  backgroundColor: Colors.lightBlue,
                  icon: const Icon(Icons.error),
                );

                }


              }, child: Text("Login",style: GoogleFonts.abrilFatface(
                color: Colors.black,
                fontSize: 0.03*height
              ),),),
                TextButton(onPressed: (){
                  Get.toNamed('/signup');

                }, child: Text("Signup",style: GoogleFonts.abrilFatface(
                  color: Colors.white,
                  fontSize: 0.03*height
                ),),),


              ])
            ],
          ),
        ),
      ),

      ]))
    );
  }
}
