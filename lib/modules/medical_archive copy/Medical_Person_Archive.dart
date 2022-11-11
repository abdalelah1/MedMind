import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_mind/shared/cubit/Cubit.dart';
import 'package:med_mind/shared/cubit/srates.dart';

import '../../shared/Components/Componenet.dart';

class MedicalPersonlatyArchive extends StatelessWidget {
  const MedicalPersonlatyArchive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = MedRemindCubit.get(context).medInfo;
    print(list.length);
    print(list);
    return BlocConsumer<MedRemindCubit, MedRemindStates>(
        listener: (context, state) => print(" legth is ::::" +
            MedRemindCubit.get(context).medInfo.length.toString()),
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: Text('App Bar'),
              ),
              body: ListView.separated(
                  itemBuilder: (context, index) => Data(list[index],context),
                  separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsetsDirectional.only(start: 20.0),
                        child: Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.grey[300],
                        ),
                      ),
                  itemCount: list.length),
            ));
  }
}
