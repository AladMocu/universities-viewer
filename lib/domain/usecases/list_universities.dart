import 'package:universities/domain/entities/university.dart';
import 'package:universities/domain/repositories/university_repository.dart';

class ListUniversities{
  final UniversityRepository repository;

  ListUniversities(this.repository);

  Future<List<University>> call() async {
    return await repository.getUniversities();
  }
}