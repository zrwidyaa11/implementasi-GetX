import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/dummy_model.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DummyModel dummy = Get.arguments;

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
          GetBuilder<DetailController>(
            init: DetailController(),
            builder: (controller) {
              return Column(
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name: ${dummy.name}',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Text('Description: ${dummy.description}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white70)),
                            SizedBox(height: 16),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed('/third');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 100, 215, 80),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 12),
                                  textStyle: TextStyle(fontSize: 18),
                                ),
                                child: Text('Next'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class DetailController extends GetxController {
  // Add any necessary logic or state management here
}