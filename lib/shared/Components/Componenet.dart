import 'package:flutter/material.dart';

Widget defultButton({
  Color color = Colors.blue,
  double width = double.infinity,
  required VoidCallback function,
  required String text,
  bool isUpper = true,
  double radius = 0.0,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      width: width,
      child: MaterialButton(
        // ignore: sort_child_properties_last
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: function,
      ),
    );
Widget defultformfiel({
  required TextEditingController controller,
  required TextInputType type,
  String labelname = '',
  required Widget prefix,
  GestureTapCallback? onTap,
  required FormFieldValidator validate,
  ValueChanged<String>? onChange,
}) =>
    TextFormField(
      validator: validate,
      controller: controller,
      onTap: onTap,
      onChanged: onChange,
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: prefix,
        border: OutlineInputBorder(),
        labelText: labelname.toString(),
      ),
    );
NavigateTo(Widget, context) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

Widget Data(Map map, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.blue,
            backgroundImage: AssetImage('lib/assests/images/icon.png'),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' ${map['medname']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Row(
                  children: [
                    Text(
                      "Start:${map['startday']}",
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Ended:${map['endday']}",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
        ],
      ),
    );
Widget buildMedInfo(Map map, context) => Container(
      height: 250,
      width: 300,
      child: Card(
        color: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${map['medname']}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              const Text(
                'Count Of Drugs :',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                '   ${map["medcount"]}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Drug Per Day     :',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                '  ${map["medcountperday"]}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Every        :',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                '   ${map["medcountperday"]} Hours',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'End Date  :',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                '   ${map["endday"]}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]),
      ),
    );
