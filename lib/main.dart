import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/cart_page.dart';
import 'package:shamo/pages/cekout_page.dart';
import 'package:shamo/pages/cekout_success.dart';
import 'package:shamo/pages/edit_profile.dart';
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/pages/login.dart';
import 'package:shamo/pages/signUp.dart';
import 'package:shamo/pages/splash.dart';
import 'package:shamo/provider/cart_provider.dart';
import 'package:shamo/provider/cekout_provider.dart';
import 'package:shamo/provider/favorite_provider.dart';
import 'package:shamo/provider/page_provider.dart';
import 'package:shamo/provider/product_provider.dart';
import 'package:shamo/provider/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
        ChangeNotifierProvider(create: (context) => PageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Splash(),
          '/sign-in': (context) => const Login(),
          '/sign-up': (context) => const SignUp(),
          '/main': (context) => const MainPage(),
          '/edit-profile': (context) => const EditProfile(),
          '/cart': (context) => const CratPage(),
          '/cekout': (context) => const CekOutPage(),
          '/cekout-sukses': (context) => const CekOutSuksesPage(),
        },
      ),
    );
  }
}
