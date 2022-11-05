import 'package:universities/domain/entities/university.dart';

class UniversityDTO{
  String alphaTwoCode;
  String country;
  String stateProvince;
  String name;

  List<String> domains;
  List<String> webPages;

  UniversityDTO({
    required this.alphaTwoCode,
    required this.country,
    required this.stateProvince,
    required this.name,
    required this.domains,
    required this.webPages,
  });

  factory UniversityDTO.fromJson(Map<String, dynamic> json) {
    return UniversityDTO(
      alphaTwoCode: json['alpha_two_code'],
      country: json['country'],
      stateProvince: json['state-province']??"",
      name: json['name'],
      domains: List<String>.from(json['domains']),
      webPages: List<String>.from(json['web_pages']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'alpha_two_code': alphaTwoCode,
      'country': country,
      'state-province': stateProvince,
      'name': name,
      'domains': domains,
      'web_pages': webPages,
    };
  }

  University toEntity() {
    return University(
      alphaTwoCode: alphaTwoCode,
      country: country,
      stateProvince: stateProvince,
      name: name,
      domains: domains,
      webPages: webPages,
    );
  }
  
}