import 'package:get/get.dart';
import 'package:project9/models/services_model.dart';

class UserServiceController extends GetxController {
  List<ServicesOffer> serviceData = [];

  @override
  void onInit() {
    super.onInit();
    fetchServiceData();
  }

  fetchServiceData() async {
    await Future.delayed(Duration(seconds: 2));

    List<ServicesOffer> serverResponce = [
      ServicesOffer(
          allServices: "Medical Emergency",
          allServicesImages: "assets/images/medicalEmergency.jpg"),
      ServicesOffer(
          allServices: "Fire", allServicesImages: "assets/images/fire.jpg"),
      ServicesOffer(
          allServices: "Accident",
          allServicesImages: "assets/images/accident.jpg"),
      ServicesOffer(
          allServices: "Robbery",
          allServicesImages: "assets/images/robbery.jpg"),
      ServicesOffer(
          allServices: "Harasment",
          allServicesImages: "assets/images/harrasment.jpg"),
      ServicesOffer(
          allServices: "Fight", allServicesImages: "assets/images/fight.png"),
      ServicesOffer(
          allServices: "Cylinder Blast",
          allServicesImages: "assets/images/cylinderblast.jpg"),
      ServicesOffer(
          allServices: "Short Circuit",
          allServicesImages: "assets/images/shortcircuit.jpg"),
    ];

    serviceData.assignAll(serverResponce);
    update();
  }
}
