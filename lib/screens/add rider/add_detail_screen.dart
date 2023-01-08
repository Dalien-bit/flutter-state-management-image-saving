import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rider/models/documents.dart';
import 'package:rider/models/rider.dart';
import 'package:rider/providers/riders_provider.dart';
import 'package:rider/screens/add%20documents/add_documents_screen.dart';
import 'package:rider/screens/universal%20widgets/buttons.dart';
import 'package:rider/screens/universal%20widgets/layout_widgets.dart';
import 'package:uuid/uuid.dart';

import 'widgets/widget.dart';

const List<String> list = <String>['Two', 'Three', 'Four'];

class AddDetailScreen extends StatefulWidget {
  const AddDetailScreen({super.key});
  static const routeName = '/addrider';

  @override
  State<AddDetailScreen> createState() => _AddDetailScreenState();
}

class _AddDetailScreenState extends State<AddDetailScreen> {
  final _id = const Uuid().v1();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _addressController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _accountController = TextEditingController();
  final _ifscController = TextEditingController();
  String? _locality;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: appBar('Add new Rider'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              FormFieldRider(
                controller: _nameController,
                helpertext: 'Robert',
                labelText: 'Name',
              ),
              FormFieldRider(
                controller: _numberController,
                helpertext: '9 digits',
                labelText: 'Phone Number',
                inputFormatters: [LengthLimitingTextInputFormatter(9)],
                inputType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  value: _locality,
                  icon: const Icon(
                    Icons.abc,
                    color: Colors.white,
                  ),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() {
                    _locality = value!;
                  }),
                ),
              ),
              FormFieldRider(
                controller: _addressController,
                helpertext: '',
                labelText: 'Current Address',
              ),
              FormFieldRider(
                controller: _pincodeController,
                helpertext: '6 digits',
                labelText: 'Current Pincode',
                inputFormatters: [LengthLimitingTextInputFormatter(6)],
                inputType: TextInputType.number,
              ),
              FormFieldRider(
                controller: _accountController,
                helpertext: '',
                labelText: 'Bank Account Number',
                inputType: TextInputType.number,
              ),
              FormFieldRider(
                controller: _ifscController,
                helpertext: '',
                labelText: 'IFSC Number',
                inputType: TextInputType.number,
              ),
            ],
          ),
        ),
        floatingActionButton: CustomTextButtom(
          title: 'Next',
          onPressed: nextPressed,
        ),
      ),
    );
  }

  void nextPressed() {
    if (_formKey.currentState!.validate() &&
        _locality != null &&
        _locality!.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddDocumentsScreen(
            id: _id,
            rider: Rider(
              name: _nameController.text,
              phoneNumber: _numberController.text,
              localities: _locality!,
              currentAddress: _addressController.text,
              currentPincode: _pincodeController.text,
              bankAccountNumber: _accountController.text,
              ifscNumber: _ifscController.text,
              id: _id,
              documents: Documents(),
            ),
          ),
        ),
      );
    }
  }
}
