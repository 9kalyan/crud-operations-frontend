

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
class api{
  static late dynamic body;
  static Future<dynamic> sendRequestUsernameCheck(String username,String password) async
  {
    Uri uri=Uri.parse("http://192.168.29.241:7000/user?username=${username}&password=${password}",);
    http.Response res= await http.get(uri);
    body=json.decode(res.body);
    print(body['status'].toString());
    return body;
  }
  static Future<dynamic> getRequestRead(String name) async
  {
    Uri uri=Uri.parse("http://192.168.29.241:7000/read?name=${name}",);
    http.Response res= await http.get(uri);
    body=json.decode(res.body);
    return body;
  }
  static Future<void> postRequestSignUp(String Username,String Password
      ,String PhoneNumber,String EmailId
      )
  async{
    Uri uri=Uri.parse("http://192.168.29.241:7000/signup");
    Map<String,String> map={
      "UserName":Username,
      "Password":Password,
      "PhoneNumber":PhoneNumber,
      "EmailId":EmailId
    };
    http.Response res= await http.post(uri,body: jsonEncode(map),
    headers: <String,String>{
      'Content-Type':'application/json; charset=UTF-8',
    }
    );
  }

  static Future<void> postRequestCreate(String variable,String value,String username)async{
    final box=GetStorage();
    Uri uri=Uri.parse("http://192.168.29.241:7000/create?username=${username}");
    Map<String,String> map={
      "Variable":variable,
      "Value":value
    };
    http.Response res= await http.post(uri,body: jsonEncode(map),
        headers: <String,String>{
          'Content-Type':'application/json; charset=UTF-8',
        }
    );
  }
  static Future<List> getListOfUsers() async{
    Uri uri=Uri.parse("http://192.168.29.241:7000/admin");
    http.Response res=await http.get(uri);
    List body=jsonDecode(res.body);
    print(body);
    return body;
  }
  static Future<List> getUserInformation(String username) async{
    Uri uri=Uri.parse("http://192.168.29.241:7000/userinfo?name=$username");
    http.Response res=await http.get(uri);
    List body=jsonDecode(res.body);
    print(body);
    return body;
  }
  static Stream<List> docsofuser(String username) async*{
    Uri uri=Uri.parse("http://192.168.29.241:7000/getdocs?name=$username");
    http.Response res=await http.get(uri);
    List body=jsonDecode(res.body);
    print(body);
    yield body;
  }
  static Future<void> delete(String username,String doc)
  async{
    Uri uri=Uri.parse(
        "http://192.168.29.241:7000/delete?name=$username&doc=$doc");
    http.Response res=await http.get(uri);
  }

}