import 'package:flutter/material.dart';
import 'package:crud/api.dart';
class UserInfoScreen extends StatefulWidget {
  String username="";
  UserInfoScreen({required String username});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
          )
        ],
      ),
    );
  }
}
