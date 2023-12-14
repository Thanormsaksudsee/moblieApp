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
    foodMenu("ข้าวผัดไข่", 100, "assets/images/img1.jpg"),
    foodMenu("ข้าวผัดหมู", 100, "assets/images/img2.jpg"),
    foodMenu("ข้าวผัดไก่", 100, "assets/images/img3.jpg"),
    foodMenu("ข้าวผัดกุ้ง", 100, "assets/images/img4.jpg"),
    foodMenu("ข้าวผัดไตปลา", 100, "assets/images/img5.jpg"),
    foodMenu("ข้าวผัดปู", 100, "assets/images/img6.jpg"),
    foodMenu("ข้าวผัดปูทาราบะ", 100, "assets/images/img7.jpg"),
    foodMenu("ข้าวผัดทะเล", 100, "assets/images/img8.jpg"),
    foodMenu("ข้าวผัดหมึก", 100, "assets/images/img9.jpg"),
    foodMenu("ข้าวผัดอเมริกัน", 100, "assets/images/img10.jpg"),
    foodMenu("ข้าวผัดรถไฟ", 100, "assets/images/img11.jpg"),
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

  int count = 0;
  int price = 0;

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
            subtitle: Text(" ราคา " + food.price.toString() + " บาท"),
  

            onTap: () {count += 1;
                        price += food.price;
              // print("คุณเลือกเมนู คือ " + food.name);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                AlertDialog alert = AlertDialog(
                title: Text("คุณเลือกเมนูทั้งหมด" + count.toString() +'จาน' + "ราคารวม "+ price.toString() + 'บาท' ),
              );
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
