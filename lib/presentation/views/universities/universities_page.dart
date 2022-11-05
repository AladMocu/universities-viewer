import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universities/presentation/views/universities/universities_controller.dart';
import 'package:universities/presentation/views/universities/widgets/grid_item.dart';
import 'package:universities/presentation/views/universities/widgets/list_item.dart';

class UniversitiesView extends GetView<UniversitiesController> {
  const UniversitiesView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Universities'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Obx(
            ()=>ToggleButtons(
              isSelected: [!controller.isGrid, controller.isGrid],
              onPressed: (index) {
                controller.isGrid = index == 1;
              },
              children: const [
                Icon(Icons.list),
                Icon(Icons.grid_view),
              ],
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(
                  ()=> controller.isGrid ? GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: controller.universities.length,
                    itemBuilder: (context, index) => Card(
                      child: GridItem(
                        university: controller.universities[index],
                      ),
                    ),
                  ) : ListView.builder(
                    itemCount: controller.universities.length,
                    itemBuilder: (context, index) => Card(
                      child: ListItem(
                        university: controller.universities[index],
                      ),
                    ),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}