import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:med_mind/shared/Components/Componenet.dart';
import 'package:med_mind/shared/cubit/Cubit.dart';
import 'package:med_mind/shared/cubit/srates.dart';

class AddMedicine extends StatelessWidget {
  AddMedicine({Key? key}) : super(key: key);

  TextEditingController medicalNameController = TextEditingController();
  TextEditingController medicalCountController = TextEditingController();
  TextEditingController medicalCountPerDayController = TextEditingController();
  TextEditingController TimeOfFirstDrugController = TextEditingController();
  TextEditingController drugEveryHour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedRemindCubit, MedRemindStates>(
      listener: (context, state) {},
      builder: (context, state) => Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Container(
                child: Row(children: [
                  const Text('add med :       ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: defultformfiel(
                        controller: medicalNameController,
                        type: TextInputType.text,
                        prefix: Icon(Icons.medication_rounded),
                        validate: (value) {
                          if (value.toString() != null &&
                              medicalNameController.text != null) {
                            return '';
                          } else
                            return 'U cant';
                        }),
                  )
                  // Expanded
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.text,

                  //   ),
                ]),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 0,
                  ),
                  const Text('Count of mid :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: defultformfiel(
                        controller: medicalCountController,
                        type: TextInputType.number,
                        prefix: Icon(Icons.medication_rounded),
                        validate: (value) {
                          if (value.toString() != null &&
                              medicalCountController.text != null) {
                            return '';
                          } else
                            return 'U cant';
                        }),
                  )
                  // Expanded
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.text,

                  //   ),
                ]),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 0,
                  ),
                  const Text('med per day : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: defultformfiel(
                        controller: medicalCountPerDayController,
                        type: TextInputType.number,
                        prefix: Icon(Icons.medication_rounded),
                        validate: (value) {
                          if (value.toString() != null &&
                              medicalCountPerDayController.text != null) {
                            return '';
                          } else
                            return 'U cant';
                        }),
                  )
                  // Expanded
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.text,

                  //   ),
                  ,
                ]),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 0,
                  ),
                  const Text('First Drug: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: defultformfiel(
                        controller: TimeOfFirstDrugController,
                        type: TextInputType.number,
                        prefix: Icon(Icons.medication_rounded),
                        onTap: () => showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(hour: 12, minute: 00))
                            .then((value) => TimeOfFirstDrugController.text =
                                value!.format(context)),
                        validate: (value) {
                          if (value.toString() != null &&
                              medicalCountPerDayController.text != null) {
                            return '';
                          } else
                            return 'U cant';
                        }),
                  ),
                  // Expanded
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.text,

                  //   ),
                  Expanded(
                    child: defultformfiel(
                        controller: drugEveryHour,
                        type: TextInputType.number,
                        prefix: Icon(Icons.medication_rounded),
                        validate: (value) {
                          if (value.toString() != null &&
                              medicalCountPerDayController.text != null) {
                            return '';
                          } else
                            return 'U cant';
                        }),
                  ),
                ]),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: 120,
            height: 50,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(100.0)),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                String nowDate =
                    DateFormat("yyyy-MM-dd").format(DateTime.now());
                MedRemindCubit.get(context).inserttodatabase(
                    MedName: medicalNameController.text.toString(),
                    MedCount: medicalCountController.text.toString(),
                    Medountperday: medicalCountPerDayController.text.toString(),
                    Celender: nowDate.toString(),
                    firstDrug: TimeOfFirstDrugController.text.toString());

                print(MedRemindCubit.get(context).medInfo);
              },
              child: const Text(
                'Add med',
                style: TextStyle(color: Colors.white),
              ),
              color: Color.fromARGB(255, 129, 115, 188),
            ),
          )
        ],
      ),
    );
  }
}
