import 'package:flutter/foundation.dart';
import 'package:universities/data/datasource/university_datasource.dart';
import 'package:universities/domain/entities/university.dart';
import 'package:universities/domain/repositories/university_repository.dart';

class UniversityRepositoryImpl implements UniversityRepository{

final UniversityDataSource dataSource;

const UniversityRepositoryImpl(this.dataSource);

  @override
  Future<List<University>> getUniversities() async{
    try{
      final remoteUniversities = await dataSource.getUniversities();
      return remoteUniversities.map((university) => university.toEntity()).toList();
    }on Exception{
      if(kDebugMode){
        print('Error in UniversityRepositoryImpl.getUniversities()');
      }
      rethrow;
    }
  }
  
}