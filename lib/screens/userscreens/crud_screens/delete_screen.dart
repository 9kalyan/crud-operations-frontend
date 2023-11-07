import 'package:flutter/material.dart';
import 'package:crud/api.dart';
import 'package:get_storage/get_storage.dart';
class DeleteScreen extends StatefulWidget {
  const DeleteScreen({Key? key}) : super(key: key);

  @override
  _DeleteScreenState createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  final box=GetStorage();
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEC255A),
      ),
      body:

      Container(
        color: Color(0xffFA9494),
        padding: EdgeInsets.all(0.1*width),
        child: StreamBuilder(stream:
        api.docsofuser("reva"),
            builder: (context,
                snapshot){
              if(snapshot.hasData){
                List<bool> n=List.generate(snapshot.data!.length,
                        (index) => true);
                return
                RefreshIndicator(
                    onRefresh: ()=>
                  Future.delayed(Duration(seconds: 5),(){
                    api.docsofuser("reva");
                  })
                ,child:
                  ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder:
                        (context,index){
                        if(n[index]==true)
                          return
                          InkWell(
                              onTap: () {},
                              child:
                              Card(
                                  elevation: 5,
                                  shadowColor: Colors.red,
                                  color: Colors.cyan,
                                  child:
                                  ListTile(
                                    title: Text(snapshot.data![index].toString()
                                    ),
                                    leading: IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () async {
                                        api.delete("reva",
                                            snapshot.data![index].toString()
                                        );
                                        Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context)=>
                                          Scaffold()
                                          )
                                        );
                                      },
                                    ),
                                  )));
                        else
                          return ElevatedButton(onPressed: (){}, 
                              child: Text(""));
                    }
                  ) );
              }
              return
                Center(child:
                CircularProgressIndicator());
            }),
      ),

    );
  }
}
