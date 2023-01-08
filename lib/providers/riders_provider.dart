import 'package:flutter/widgets.dart';
import 'package:rider/models/rider.dart';

class RidersProvider extends ChangeNotifier {
  final List<Rider> _riders = [];
  List<Rider> get riders => _riders;

  void addRider(Rider rider) {
    _riders.add(rider);
    notifyListeners();
  }

  void removeRider(String id) {
    _riders.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void addDocument(String id, String key, String value) {
    _riders.firstWhere((element) => element.id == id).docs['id'] = value;
    notifyListeners();
  }
}
