
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:universities/data/dto/university_dto.dart';


class UniversityDataSource{

  final http.Client client;

  const UniversityDataSource(this.client);

  Future<List<UniversityDTO>> getUniversities() async {
    try{
      final response = await client.get(Uri.parse("https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json"));
      if(response.statusCode == HttpStatus.ok){
        final List<dynamic> universities = json.decode(response.body);
        return universities.map((university) => UniversityDTO.fromJson(university)).toList();
      }else{
        throw Exception('Error in UniversityDataSource.getUniversities(): ${response.statusCode}');
      }
    }on Exception{
      if(kDebugMode){
        print('Error in UniversityDataSource.getUniversities()');
      }
      rethrow;
    }
  }
}