import 'package:rider/models/documents.dart';

class Rider {
  final String name,
      phoneNumber,
      localities,
      currentAddress,
      currentPincode,
      bankAccountNumber,
      ifscNumber,
      id;
  Documents documents;
  Map<String, String> docs = {
    'aadhar': '',
    'pancard': '',
    'driving license': '',
    'bank cheque': '',
    'photo': ''
  };

  Rider({
    required this.name,
    required this.phoneNumber,
    required this.localities,
    required this.currentAddress,
    required this.currentPincode,
    required this.bankAccountNumber,
    required this.ifscNumber,
    required this.id,
    required this.documents,
  });
}
