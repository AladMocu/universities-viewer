import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universities/domain/entities/university.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailController extends GetxController {
  final Rx<University> _university = Rx(Get.arguments);

  final ImagePicker _picker = ImagePicker();

  RxString imagePath = "".obs;
  RxInt studentCount = 0.obs;

  
  TextEditingController studentCountController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    imagePath.value = _university.value.photoPath ?? "";
    studentCount.value = _university.value.studentCount;
    studentCountController.text = studentCount.value.toString();
    
  }

  University get university => _university.value;

  Future getImage(ImageSource imageSource) async {
    final pickedFile = await _picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
      university.photoPath = pickedFile.path;
      if (kDebugMode) print(pickedFile.path);
    } else {
      if (kDebugMode) print('No image selected.');
    }
  }

  Future<void> launchUniversityUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> updateStudentCount(int count) async {
    studentCount.value = count;
    university.studentCount = count;
  }
}
