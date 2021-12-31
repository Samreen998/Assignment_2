import 'package:flutter/material.dart';
import 'device.dart' as device;

void main() {
  runApp( MaterialApp(
    home: Home()
  ));
}

class Devices {  
  Devices({required this.title, required this.icon, required this.on, required this.type });  
  final String title;  
  final IconData icon;  
  bool on ;
  var type;
} 

class Home extends StatefulWidget {
  static List<Devices> devices = <Devices>[  
  Devices(title: 'Lights', icon: Icons.light, on: true, type: 'Living room'),  
  Devices(title: 'Window', icon: Icons.window,  on: true, type: 'Living room'),  
  Devices(title: 'Camera', icon: Icons.camera,  on: true , type: 'Living room'),  
  Devices(title: 'TV', icon: Icons.tv,  on: true, type: 'Living room'),
];
  const Home({Key? key}) : super(key: key);  
  @override 
  _HomeState createState()=> _HomeState();
}
  

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  static late TabController controller;
  @override 
  void initState(){
    controller = TabController(length: 1, vsync: this);
    super.initState();
  }

  
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home'),
        backgroundColor: Colors.grey,
        bottom: TabBar(
          controller: controller,
          indicatorWeight: 5.0,
          indicatorColor: Colors.black,
          tabs: const <Widget>[
            Tab(text: "All"),
          ],
        ),
      ),

      body: TabBarView(
        controller: controller,
        children: const <Widget> [
          device.firsttab(),
        ]
      )
    );
  }
}