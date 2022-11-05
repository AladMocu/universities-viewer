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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    university.name,
                    style: const TextStyle(
                      fontSize: 18,
                      
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      
    );
  }
}