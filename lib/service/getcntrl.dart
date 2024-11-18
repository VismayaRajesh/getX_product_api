import 'package:get/get.dart';
import '../model/Products.dart';
import 'apiservice.dart';

class Productcntrl extends GetxController {
  Apiservice apiservice = Apiservice();

  // Reactive list of products.
  // This list will hold the fetched product data.
  var plist = <Products>[];

  // Fetches all products from the API using `Apiservice`.
  // Updates the `plist` variable and notifies listeners of state changes.
  Future<void> fetch() async {
    // Call the API to get all products and update the `plist`.
    // If the API returns null, initialize `plist` as an empty list.
    plist = (await apiservice.getAllProducts()) ?? [];

    // Notify listeners about the state change so the UI can update.
    update();
  }
}
