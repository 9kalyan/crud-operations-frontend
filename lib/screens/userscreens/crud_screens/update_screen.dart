import 'package:flutter/material.dart';
import 'package:crud/api.dart';
class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFC95F),
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Color(0xffFF6D60),
        padding: EdgeInsets.all(0.1*width),
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

                      ExpansionPanelList(
                        expansionCallback: (index,isExpanded){

                        },
                      )
                        ;
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
