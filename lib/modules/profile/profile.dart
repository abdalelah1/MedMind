import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_mind/modules/medical_archive%20copy/Medical_Person_Archive.dart';
import 'package:med_mind/shared/cubit/Cubit.dart';
import 'package:med_mind/shared/cubit/srates.dart';

import '../../layout/homePage.dart';
import '../../shared/Components/Componenet.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = MedRemindCubit.get(context).medInfo;

    return BlocConsumer<MedRemindCubit, MedRemindStates>(
        listener: (context, state) => {},
        builder: (context, state) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('lib/assests/images/med.jpeg'),
                      radius: 25.0,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Abdalelah Taleb',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Medicine : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '1. SSS ',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '2. SSS ',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '3. SSS ',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Age == 25',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Medicine : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.white),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < list.length; i++)
                          buildMedInfo(list[i], context),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 120,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100.0)),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () =>
                        NavigateTo(const MedicalPersonlatyArchive(), context),
                    color: const Color.fromARGB(255, 129, 115, 188),
                    child: const Text(
                      'Medicine',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )));
  }
}
