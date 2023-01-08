import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rider/screens/universal%20widgets/buttons.dart';

import '../../models/rider.dart';
import '../../providers/riders_provider.dart';
import '../universal widgets/layout_widgets.dart';
import 'widgets/widgets.dart';

class AddDocumentsScreen extends StatefulWidget {
  const AddDocumentsScreen({super.key, required this.id, required this.rider});
  final String id;
  final Rider rider;

  @override
  State<AddDocumentsScreen> createState() => _AddDocumentsScreenState();
}

class _AddDocumentsScreenState extends State<AddDocumentsScreen> {
  XFile? image;
  Map<String, String> images = {
    'aadhar': '',
    'pancard': '',
    'driving license': '',
    'bank cheque': '',
    'photo': ''
  };
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final riderProviderInstance = Provider.of<RidersProvider>(context);

    Future<void> addImage(String key) async {
      await picker.pickImage(source: ImageSource.camera).then((value) {
        setState(() {
          image = value;
          images[key] = value?.path ?? "";
        });
      });
    }

    void saveRider() {
      bool alldocs = true;
      images.forEach((key, value) {
        if (value.isEmpty) {
          alldocs = false;
        }
      });
      if (alldocs) {
        widget.rider.docs = images;
        riderProviderInstance.addRider(widget.rider);
        Navigator.popUntil(context, ModalRoute.withName('/'));
      }
    }

    return Scaffold(
      appBar: appBar('Upload Documents'),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          String key = images.keys.elementAt(index);
          return DocumentTile(
            text: key,
            add: () => addImage(key),
            view: () => viewImage(images[key] ?? ''),
            check: images[key]?.isNotEmpty ?? false,
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextButtom(
              title: 'Previous',
              onPressed: () => Navigator.of(context).pop(),
            ),
            CustomTextButtom(
              title: 'Save',
              onPressed: () => saveRider(),
            ),
          ],
        ),
      ),
    );
  }

  void viewImage(String key) {
    if (key.isEmpty) return;
    showDialog<bool>(
      context: context,
      builder: (context) {
        return Image.file(File(key));
      },
    );
  }
}
