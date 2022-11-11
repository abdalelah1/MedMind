import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:med_mind/modules/addmed/addmedicine.dart';
import 'package:med_mind/modules/articles/medical_articles.dart';
import 'package:med_mind/modules/medical_archive/Medical_Archive.dart';
import 'package:med_mind/modules/profile/profile.dart';
import 'package:med_mind/shared/cubit/srates.dart';
import 'package:sqflite/sqflite.dart';

class MedRemindCubit extends Cubit<MedRemindStates> {
  MedRemindCubit() : super(InitaialStates());
  static MedRemindCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> listOfItemForBNB = const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: 'profile'),
    BottomNavigationBarItem(icon: Icon(Icons.medication_liquid), label: 'add'),
    BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: 'med'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
  ];
  int currentIndex = 0;
  List<Widget> screens = [
    Profile(),
    MedicalArchive(),
    AddMedicine(),
    MedicalArchive()
  ];
  void chaneScreen(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  List<Widget> listForBottmNavBar = [
    Icon(
      Icons.person,
    ),
    Icon(Icons.medication_liquid),
    Icon(Icons.article_outlined),
    Icon(Icons.settings),
  ];
  Database? database;
  void createdatabase() {
    openDatabase('task.db', version: 1, onCreate: (database, version) {
      database.execute(
          'CREATE TABLE task(id INTEGER PRIMARY KEY  ,medname TEXT,medcount TEXT,medcountperday TEXT, startday TEXT ,endday TEXT,firstDrug Text )');
    }, onOpen: (database) {
      print('database opened');

      getdatafromdatabase(database);
    }).then((value) {
      database = value;

      emit(CreateDataBase());
    });
  }

  List<dynamic> medInfo = [];
  void getdatafromdatabase(database) {
    medInfo = [];
    database!
        .rawQuery(
            'SELECT id, medname,medcount,medcountperday,startday,endday,firstDrug FROM task')
        .then((List value) {
      emit(GetFromDataBase());
      value.forEach((element) {
        medInfo.add(element);
      });
    });
  }

  static calcAmoutofmedicine(
      String MedCount, String Medountperday, String Celender) {
    int medcount = int.parse(MedCount);
    int medAmountPerDay = int.parse(Medountperday);
    double days =
        (int.parse(MedCount) / int.parse(Medountperday)).floorToDouble();
    int intDays = days.toInt();
    DateTime startDay = DateTime.parse(Celender);
    var newDate = DateTime(
      startDay.year,
      startDay.month,
      startDay.day + intDays,
    );
    print("Start day " + newDate.day.toString());
    String nowDate = DateFormat("yyyy-MM-dd").format(newDate);

    return nowDate.toString();
  }

  inserttodatabase({
    required MedName,
    required MedCount,
    required Medountperday,
    required Celender,
    required firstDrug,
    
  }) async {
    await database!.transaction((txn) {
      return txn
          .rawInsert(
              // ignore: avoid_print
              'INSERT INTO task (medname,medcount,medcountperday,startday,endday,firstDrug) VALUES ("${MedName}","${MedCount}","${Medountperday}","${Celender}","${calcAmoutofmedicine(MedCount, Medountperday, Celender)}","${firstDrug}")')
          .then((value) {
        print('${value} DOne');

        getdatafromdatabase(database);
        emit(InsertToDataBase());
      }).catchError((error) => print(error));
    });
  }
}
