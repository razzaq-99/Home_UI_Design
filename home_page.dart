import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_ui_design/utils/smartdevices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List mySmartDevices = [
    ['Smart Light','lib/icons/light-bulb.png',true],
    ['Smart AC','lib/icons/air-conditioner.png',false],
    ['Smart TV','lib/icons/smart-tv.png',false],
    ['Smart Fan','lib/icons/fan.png',false],
  ];

  void powerSwitchChange( bool value,int index){
    setState(() {

      mySmartDevices[index][2]=value;
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey.shade800,
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey.shade800,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Welcome to Home",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                  Text(
                    "Abdul Razzaq",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 44),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text("Smart Devices",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
            ),
            Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(15),
                  itemCount: mySmartDevices.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                    childAspectRatio: 1/1.4),
                    itemBuilder: (context, index) {
                      return SmartDevices(
                        smartDevicesNames: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onchanged: (value) => powerSwitchChange(value,index),
                      );
                    }
                    )
            )
          ],
        ),
      ),
    );
  }
}
