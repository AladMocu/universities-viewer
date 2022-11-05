import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universities/domain/entities/university.dart';
import 'package:universities/presentation/routes/routes.dart';

class GridItem extends StatelessWidget{

  final University university;

  const GridItem({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
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
      
    );
  }
}