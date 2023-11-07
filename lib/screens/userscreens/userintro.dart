import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';
final box=GetStorage();
class UserIntro extends StatefulWidget {
  const UserIntro({super.key});

  @override
  State<UserIntro> createState() => _UserIntroState();
}

class _UserIntroState extends State<UserIntro> with TickerProviderStateMixin{
  late AnimationController k;
  late Animation animat;
  @override

  void initState() {
    k=AnimationController(vsync: this,duration: Duration(seconds: 5));
    animat=ColorTween(begin: Colors.redAccent,end: Colors.teal)
        .animate(k);
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Color(0xffDAFFFB),
      body:
      SafeArea(child:
      Padding(
        padding: EdgeInsets.all(0.04*width),
        child:
        SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:
        Column(
          children: [
            Card(
              elevation: 10,
              shadowColor: Colors.cyan,
              color: Colors.greenAccent,
              child:

              Container(height: 0.2*height,

                width: double.infinity,
              padding: EdgeInsets.all(0.03*height),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                  ,
                  crossAxisAlignment: CrossAxisAlignment.center
                  ,children:[
                Column(children:[
                Text("9kalyan",
                  style: GoogleFonts.abrilFatface(fontSize: 0.06*width,color: Colors.white),),

                  TextButton(onPressed: (){
                    Get.offAllNamed("/login");
                    box.remove("user");
                    box.write("login", false);
                  },style: ButtonStyle(
                  ),
                      child: Text("Logout",style: GoogleFonts.abrilFatface(
                        color: Colors.black,
                        fontSize: 0.08*width
                      ),)),]),
                Lottie.asset("assets/user.json")])
              )
            ),



            SizedBox(height: 0.015*height,),
            InkWell(onTap: ()async{
              showDialog(context: context, builder:(context)=>
                  WillPopScope(onWillPop: ()async{
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
              Get.toNamed('/createscreen');
            },child:
            Card(

              elevation: 10,
              color:Color(0xff64CCC5),
              child:               Container(height: 0.2*height,

                  width: double.infinity,
                  padding: EdgeInsets.all(0.03*height),
                  child:
                  Stack(
                  children:[
                    Column(children:[
                      Padding(padding: EdgeInsets.only(left: 0.5*width,top: 0.04*height),
                        child:Text("Create❐",
                        style: GoogleFonts.abrilFatface
                          (fontSize: 0.06*width,color: Colors.white),),

                      ),
]),
                    Lottie.asset("assets/pe.json",)])
              )
            ),),
            //////////////////////////////////////////////////////////////////////////////////
            SizedBox(height: 0.015*height,),
            InkWell(
              onTap: ()async{
                showDialog(context: context, builder:(context)=>
                    WillPopScope(onWillPop: ()async{
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
                Get.toNamed('/readscreen');
              },
              child:
            Card(
              elevation: 10,
              shadowColor: Colors.tealAccent,
              color: Color(0xffFFCF96),
              child: Container(height: 0.2*height,

                  width: double.infinity,
                  padding: EdgeInsets.all(0.03*height),
                  child:
                  Stack(
                      children:[
                    Column(children:[
                      Padding(padding: EdgeInsets.only(left: 0.5*width,top: 0.04*height),
                        child:Text("Read❐",
                        style: GoogleFonts.abrilFatface(fontSize: 0.06*width,color: Colors.white),),

                      ),

                     ]),
                    Lottie.asset("assets/read.json",)])
              ),
            ),),
            /////////////////////////////////////////////////////////////////////////////////
            SizedBox(height: 0.015*height,),
            InkWell(
              onTap: ()async{
                showDialog(context: context, builder:(context)=>
                    WillPopScope(onWillPop: ()async{
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
                Get.toNamed('/updatescreen');
              },
              child:Card(
                shadowColor: Colors.teal,
              elevation: 10,
              color: Color(0xffED7B7B),
              child: Container(height: 0.2*height,

                  width: double.infinity,
                  padding: EdgeInsets.all(0.03*height),
                  child:
                  Stack(
                      children:[
                    Column(children:[
                      Padding(padding: EdgeInsets.only(left: 0.4*width,top: 0.04*height),child:
                      Text("Update❐",
                        style: GoogleFonts.abrilFatface(fontSize: 0.06*width,color: Colors.white),),
                      ),
                  ]),
                    Lottie.asset("assets/create.json",)])
              ),
            ),),
            SizedBox(height: 0.015*height,),
            InkWell(
              onTap: ()async{
                showDialog(context: context, builder:(context)=>
                    WillPopScope(onWillPop: ()async{
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
                Get.toNamed('/deletescreen');
              }
            ,child:
            Card(
              elevation: 3,
              shadowColor:Colors.cyan,
              color: Color(0xff219C90),
              child: Container(height: 0.2*height,

                  width: double.infinity,
                  padding: EdgeInsets.all(0.03*height),
                  child:
                  Stack(
                      children:[
                    Column(children:[

                      Padding(padding: EdgeInsets.only(left: 0.4*width,top: 0.04*height),
                        child:Text("Delete❐",
                        style: GoogleFonts.abrilFatface(fontSize: 0.06*width,
                            color: Colors.white),),

                      )]),
                    Lottie.asset("assets/DELETE.json",)])
              ),
            ))
          ])


      ),
      ))
    );
  }
}
