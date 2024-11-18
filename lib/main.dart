import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_productapi/service/getcntrl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // Create and register an instance of Productcntrl with GetX.
    final Productcntrl c = Get.put(Productcntrl());

    // Fetch product data from the API.
    c.fetch();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GetBuilder<Productcntrl>(
        // Use GetBuilder to rebuild the UI when the Productcntrl's state changes.
        builder: (c) {
          return ListView.builder(
            itemCount: c.plist.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("${c.plist[index].brand}"),
                subtitle: Text("${c.plist[index].category}"),
              );
            },
          );
        },
      ),
    );
  }

}
