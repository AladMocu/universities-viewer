class University{
  String alphaTwoCode;
  String country;
  String stateProvince;
  String name;

  List<String> domains;
  List<String> webPages;

  String? photoPath;
  int studentCount = 0;

  University({
    required this.alphaTwoCode,
    required this.country,
    required this.stateProvince,
    required this.name,
    required this.domains,
    required this.webPages,
  });
}