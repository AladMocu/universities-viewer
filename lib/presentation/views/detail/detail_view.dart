import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universities/presentation/views/detail/detail_controller.dart';

class DetailView extends GetView<DetailController>{
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Column(
        children: [
          Text(controller.university.name),
          Text(controller.university.country),
          Text(controller.university.alphaTwoCode),
          Text(controller.university.webPages[0]),
        ],
      ),
    );
  }
}