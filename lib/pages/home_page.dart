import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dummy_controller.dart';

class HomePage extends StatelessWidget {
  final DummyController dummyController = Get.put(DummyController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.2)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 180,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Welcome to Warung Candi',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ]),
                ),
              ),
              SizedBox(height: 20),
              // Input Menu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  color: Color.fromARGB(255, 173, 201, 109).withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Menu Name',
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Add new menu item to the list
                            dummyController.addMenuItem(
                              nameController.text,
                              descriptionController.text,
                            );
                            nameController.clear();
                            descriptionController.clear();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 100, 215, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          child: Text('Add Menu', style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GetBuilder<DummyController>(
                  builder: (_) {
                    return ListView.builder(
                      itemCount: dummyController.dummyList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.black54,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: ListTile(
                            title: Text(
                              dummyController.dummyList[index].name,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.yellow),
                                  onPressed: () {
                                    // Edit item
                                    nameController.text =
                                        dummyController.dummyList[index].name;
                                    descriptionController.text = dummyController
                                        .dummyList[index].description;
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Edit Menu'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextField(
                                                controller: nameController,
                                                decoration: InputDecoration(
                                                    labelText: 'Menu Name'),
                                              ),
                                              TextField(
                                                controller:
                                                    descriptionController,
                                                decoration: InputDecoration(
                                                    labelText: 'Deskripsi'),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                dummyController.updateMenuItem(
                                                  index,
                                                  nameController.text,
                                                  descriptionController.text,
                                                );
                                                nameController.clear();
                                                descriptionController.clear();
                                                Get.back();
                                              },
                                              child: Text('Save'),
                                              style: TextButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 100, 215, 80),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete,
                                      color: Color.fromARGB(255, 100, 215, 80)),
                                  onPressed: () {
                                    // Delete item
                                    dummyController.deleteMenuItem(index);
                                  },
                                ),
                              ],
                            ),
                            onTap: () {
                              Get.toNamed('/detail',
                                  arguments: dummyController.dummyList[index]);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}