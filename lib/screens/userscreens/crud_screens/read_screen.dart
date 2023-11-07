import 'package:flutter/material.dart';
import 'package:crud/api.dart';
import 'package:get_storage/get_storage.dart';
class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);
  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final box=GetStorage();
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff3AA6B9),
      ),
      body: Container(
        color: Color(0xffC1ECE4),
        padding: EdgeInsets.all(0.1*width),
        child: FutureBuilder(future: api.getRequestRead(
            box.read("user")),
            builder: (context,snapshot){
          return ListView.builder(
              itemCount: 1,
              itemBuilder: (context,index)
          =>ListTile(

             title: Text(snapshot.data.toString()),
          )
          );
            }),
      ),

    );
  }
}
