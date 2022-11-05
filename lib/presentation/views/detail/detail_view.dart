import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universities/presentation/views/detail/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(controller.university.name),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: controller.imagePath.value.isEmpty? const DecorationImage(
                      image: AssetImage('assets/images/placeholder.png'),
                      fit: BoxFit.cover,
                    ):DecorationImage(
                      image:  FileImage(File(controller.imagePath.value)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  controller.university.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "${controller.university.country} (${controller.university.alphaTwoCode})${controller.university.stateProvince.isNotEmpty ? ", ${controller.university.stateProvince}" : ""}",
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const Icon(
                          Icons.mail,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '@${controller.university.domains[index]}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    );
                  },
                  itemCount: controller.university.domains.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        const Icon(
                          Icons.web,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () => controller.launchUniversityUrl(controller.university.webPages[index]),
                          child: Text(
                            controller.university.webPages[index],
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: controller.university.webPages.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //student count editable text field
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.people,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 120,
                      child: TextField(
                        controller: controller.studentCountController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          controller.updateStudentCount(int.parse(value.isEmpty ? "0" : value));
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Student Count',
                        ),
                      ),
                    )
                  ],
                ),
              ),

                            
            ],
          ),
          Positioned(
            top: 175,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => controller.getImage(ImageSource.camera),
                      icon: Icon(
                        Icons.camera_alt,
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
                  Divider(
                    color: Theme.of(context).colorScheme.onBackground,
                    thickness: 3,
                    indent: 10,
                    endIndent: 10,
                  ),
                  IconButton(
                      onPressed: () => controller.getImage(ImageSource.gallery),
                      icon: Icon(
                        Icons.image,
                        color: Theme.of(context).colorScheme.onBackground,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
