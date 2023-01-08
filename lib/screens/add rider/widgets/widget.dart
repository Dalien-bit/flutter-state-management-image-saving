import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldRider extends StatelessWidget {
  const FormFieldRider({
    Key? key,
    required TextEditingController controller,
    this.inputFormatters,
    this.labelText,
    this.helpertext,
    this.inputType,
    this.validator,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? labelText, helpertext;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextFormField(
        controller: _controller,
        validator: validator ??
            (value) {
              if (value!.isEmpty) {
                return 'This field is required';
              } else {
                return null;
              }
            },
        inputFormatters: inputFormatters,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: helpertext,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
