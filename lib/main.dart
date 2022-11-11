import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_mind/layout/homePage.dart';
import 'package:med_mind/modules/onboarding/Onboarding.dart';
import 'package:med_mind/shared/cubit/Cubit.dart';
import 'package:med_mind/shared/cubit/bloc_observe.dart';

import 'modules/log_in/MedMind -LogIn interface-1/Screens/Signup/signup_screen.dart';
import 'modules/log_in/MedMind -LogIn interface-1/Screens/Welcome/welcome_screen.dart';
import 'modules/log_in/MedMind -LogIn interface-1/constants.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedRemindCubit()..createdatabase(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme:   TextTheme(
      headline1: TextStyle(color: Colors.black),
      headline2: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
      subtitle1: TextStyle(color: Colors.black),
    ),
  
          primaryTextTheme:TextTheme() ,
           primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          ),
          appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple.shade200),
          iconTheme: const IconThemeData(color: Colors.white),
          //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
          //       selectedItemColor: Colors.black,
          //       backgroundColor: Color.fromARGB(255, 187, 62, 209)),
          // ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePageLayout(),
      ),
    );
  }
}
