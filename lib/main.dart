import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'screens/adminscreens/adminintro.dart';
import 'screens/userscreens/crud_screens/create_screen.dart';
import 'screens/userscreens/crud_screens/delete_screen.dart';
import 'screens/userscreens/crud_screens/read_screen.dart';
import 'screens/userscreens/crud_screens/update_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'api.dart';
import 'screens/userscreens/userintro.dart';
import 'screens/loginscreen.dart';
import 'package:get/get.dart';
import 'screens/signupscreen.dart';
final box = GetStorage();
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(app());
  if(box.read("login")==null)
  await box.write("login", false);
}
class app extends StatefulWidget {
  const app({super.key});

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute:"/deletescreen",
      //box.read("login")?"/userintro":"/login"
      getPages: [
        GetPage(name: "/login",
          page: ()=>LoginScreen()),
        GetPage(name: "/admin",
            page: ()=>AdminIntro()),
        GetPage(name: "/signup",
            page: ()=>SignUp()),
        GetPage(name: "/userintro",
            page: ()=>UserIntro()),

        GetPage(name: "/deletescreen",
            page: ()=>DeleteScreen(),),
        GetPage(name: "/createscreen",
            page: ()=>CreateScreen()),
        GetPage(name: "/readscreen",
            page: ()=>ReadScreen()),
        GetPage(name: "/updatescreen",
            page: ()=>UpdateScreen()),
      ],
    );
  }
}