
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_browser_app/screens/homescreen/provider/homeprovider.dart';
import 'package:web_browser_app/screens/homescreen/view/homescreen.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Homescreen()
        },
      ),
    ),
  );
}
