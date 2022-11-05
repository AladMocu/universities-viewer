import 'package:universities/domain/entities/university.dart';

abstract class UniversityRepository {

  /// Get a list of all universities
  Future<List<University>> getUniversities();
}