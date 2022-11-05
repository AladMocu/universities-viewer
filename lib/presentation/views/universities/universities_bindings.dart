import 'package:get/get.dart';
import 'package:universities/data/datasource/university_datasource.dart';
import 'package:universities/data/repositories/university_repository_impl.dart';
import 'package:universities/domain/repositories/university_repository.dart';
import 'package:universities/presentation/views/universities/universities_controller.dart';
import 'package:http/http.dart'as http;

class UniversitiesBindings extends Bindings {
  @override
  void dependencies() {

    UniversityDataSource dataSource = UniversityDataSource(http.Client());
    Get.put<UniversityRepository>(UniversityRepositoryImpl(dataSource));
    Get.put<UniversitiesController>(UniversitiesController());

  }
}