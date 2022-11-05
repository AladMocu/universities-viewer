import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universities/domain/entities/university.dart';
import 'package:universities/presentation/routes/routes.dart';

class ListItem extends StatelessWidget {
  final University university;

  const ListItem({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.toNamed(Pages.detail, arguments: university);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                university.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
    );
  }
}