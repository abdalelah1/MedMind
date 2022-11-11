import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:med_mind/layout/homePage.dart';
import 'package:med_mind/shared/Components/Componenet.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('lib/assests/images/med.jpeg'),
                const SizedBox(
                  height: 200,
                ),
                const Text(
                  'MedMind',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Take Care About  Self SSSS SSS',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 140,
                ),
                Container(
                  width: 120,
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100.0)),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () => NavigateTo(HomePageLayout(), context),
                    child: const Text(
                      'Start',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Color.fromARGB(255, 129, 115, 188),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
