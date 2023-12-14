import 'package:flutter/material.dart';
import 'foodMenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My app",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<foodMenu> menu = [
    foodMenu("กุ้งเผา", '500', "assets/images/img1.jpg"),
    foodMenu("กระเพราหมู", '80', "assets/images/img2.jpg"),
    foodMenu("ข้าวขาหมู", '50', "assets/images/img3.jpg"),
    foodMenu("ข้าวไข่เจียว", '40', "assets/images/img4.jpg"),
    foodMenu("ข้าวมันไก่", '50', "assets/images/img5.jpg"),
    foodMenu("ข้าวผัดหมู", '50', "assets/images/img6.jpg"),
    foodMenu("ไก่ทอด", '80', "assets/images/img7.jpg"),
    foodMenu("หมูหัน", '800', "assets/images/img8.jpg"),
    foodMenu("หมูทอด", '800', "assets/images/img9.jpg"),
    foodMenu("หมูปิ้ง", '800', "assets/images/img10.jpg"),
    foodMenu("น้ำตกหมู", '800', "assets/images/img11.jpg"),
  ];
  int number = 0;

  void _incrementNumber() {
    setState(() {
      number++;
    });
  }

  void _decrementNumber() {
    setState(() {
      if (number > 0) {
        number--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Menu"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          foodMenu food = menu[index];
          return ListTile(
            leading: Image.asset(food.img),
            title: Text(
              "${index + 1}" + "." + food.name,
              style: TextStyle(fontSize: 30),
            ),
            subtitle: Text(" ราคา " + food.price + " บาท"),
            onTap: () {
              // print("คุณเลือกเมนู คือ " + food.name);
              AlertDialog alert = AlertDialog(
                title: Text("คุณเลือกดูหนัง เรื่อง " + food.name),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementNumber,
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _incrementNumber,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
