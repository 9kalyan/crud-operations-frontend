import 'package:crud/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class AdminIntro extends StatefulWidget {
  const AdminIntro({super.key});
  @override
  State<AdminIntro> createState() => _AdminIntroState();
}

class _AdminIntroState extends State<AdminIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        padding: EdgeInsets.all(10),
        child: FutureBuilder(future:
            api.getListOfUsers()
            ,
            builder: (context,
                snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
                itemBuilder:
                (context,index){
                  return
                    InkWell(
                        onTap: (){
                          print(9);

                        },
                        child:
                            Card(
                              elevation: 5,
                                shadowColor: Colors.red,
                                color: Colors.cyan,
                                child:
                    ListTile(
                    title: Text(snapshot.data![index].toString())
                  )));
                }
            );
          }
          return
            Center(child:
            CircularProgressIndicator());
            }),
      ),
    );
  }
}
