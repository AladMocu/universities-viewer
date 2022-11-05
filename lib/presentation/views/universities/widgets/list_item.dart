import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universities/domain/entities/university.dart';
import 'package:universities/presentation/routes/routes.dart';

class ListItem extends StatelessWidget {
  final University university;

  const ListItem({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed(Pages.detail, arguments: university);
        },
        child: Column(
          children: [
            Text(university.name),
            Text(university.country),
            Text(university.alphaTwoCode),
            Text(university.webPages[0]),
          ],
        ),
      ),
    );
  }
}