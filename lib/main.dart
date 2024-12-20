import 'package:flutter/material.dart';
import 'package:petshop/view/SplashScreen/splashscreen.dart';
import 'package:petshop/view/homepage/homepage.dart';
import 'package:petshop/view/loginPage/loginpage.dart';
import 'package:petshop/viewModel/cartprovider.dart';
import 'package:petshop/viewModel/providerProdects.dart';
import 'package:petshop/viewModel/whislistProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderprodectsForFetch(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cartprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Whislistprovider(),
        )
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
