import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double x = 0, y = 0, z = 0;
  String direction = "none";

  Color containerColor = Colors.red;
 

  @override
  void initState() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      print(event);

      x = event.x;
      y = event.y;
      z = event.z;




      direction = event.toString();

      if ( 9.6 < y && y < 10 ){
        containerColor = Colors.green;
      }else {
        containerColor = Colors.red;
      }

      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: containerColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              direction,
              style: const TextStyle(fontSize: 30),
              
            )
          ],
        ),
      ),
    );
  }
}
