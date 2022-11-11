import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_mind/shared/cubit/srates.dart';

import '../shared/cubit/Cubit.dart';

class HomePageLayout extends StatelessWidget {
  const HomePageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedRemindCubit, MedRemindStates>(
      listener: (context, state) => print('object'),
      builder: (context, state) => Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: MedRemindCubit.get(context).currentIndex,
        //   type: BottomNavigationBarType.fixed,
        //   items: MedRemindCubit.get(context).listOfItemForBNB,
        //   onTap: (value) => MedRemindCubit.get(context).chaneScreen(value),
        // ),
        bottomNavigationBar: CurvedNavigationBar(
          onTap: (value) => MedRemindCubit.get(context).chaneScreen(value),
          color: Colors.deepPurple.shade200,
          //Colors.deepPurple
          backgroundColor: Colors.deepPurple,
          items: MedRemindCubit.get(context).listForBottmNavBar,
        ),
        body: MedRemindCubit.get(context)
            .screens[MedRemindCubit.get(context).currentIndex],
      ),
    );
  }
}
