import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
          
              const ListTile(

                title: Text("Error Screen"),
                subtitle: Text("This is a dummy error screen"),

                trailing: Row(

                  children: [
                    Icon(Icons.error),

                    Icon(Icons.abc_sharp),
                  ],
                ),
              ),
              GridView(
          physics: ScrollPhysics(),
                shrinkWrap: true
                ,
                
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 13,
                  crossAxisCount: 2,
                ),
                children: List.generate(20, (i) => DummyCard(i: i)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DummyCard extends StatelessWidget {
  const DummyCard({super.key, required this.i});
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors[i],

        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      height: 100,
      width: 100,
    );
  }
}

final colors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.indigo,
  Colors.cyan,
  Colors.amber,
  Colors.lime,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
];