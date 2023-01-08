class Documents {
  String? aadhar, panCard, drivingLicense, bankCheque, photo;
  Documents({
    this.aadhar,
    this.panCard,
    this.drivingLicense,
    this.bankCheque,
    this.photo,
  });

  addAadhar(String value) {
    aadhar = value;
    // debugPrint("AAdhar   $aadhar");
  }

  addPanCard(String value) => panCard = value;
  addDrivingLicense(String value) => drivingLicense = value;
  addBankCheque(String value) => bankCheque = value;
  addPhoto(String value) => photo = value;
}
