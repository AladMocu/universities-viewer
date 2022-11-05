import 'package:get/get.dart';
import 'package:universities/presentation/views/detail/detail_bindings.dart';
import 'package:universities/presentation/views/detail/detail_view.dart';
import 'package:universities/presentation/views/universities/universities_bindings.dart';
import 'package:universities/presentation/views/universities/universities_page.dart';

class Pages{
  static const String home = '/';
  static const String detail = '/detail';



  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => const UniversitiesView(),
      binding: UniversitiesBindings(),
    ),
    GetPage(
      name: detail, 
      page: ()=> const DetailView(),
      binding: DetailBindings()
    )
  ];
}