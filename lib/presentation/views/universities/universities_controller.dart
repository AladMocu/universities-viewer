import 'package:get/get.dart';
import 'package:universities/domain/entities/university.dart';
import 'package:universities/domain/repositories/university_repository.dart';
import 'package:universities/domain/usecases/list_universities.dart';
import 'package:universities/presentation/routes/routes.dart';

class UniversitiesController extends GetxController{

  //observable variables
  final RxList<University> _universities = <University>[].obs;
  final RxBool _isGrid = false.obs;


  //getters
  List<University> get universities => _universities;
  bool get isGrid => _isGrid.value;

  //setters
  set isGrid(bool value) => _isGrid.value = value;

  @override
  void onInit() {
    super.onInit();
    initUniversities(); 
  }

  void initUniversities()async{
    ListUniversities(Get.find<UniversityRepository>()).call().then(
      (value) => _universities.addAll(value)
    );
  }

  void openUniversityDetail(University university){
    Get.toNamed(Pages.detail, arguments: university);
  }
}