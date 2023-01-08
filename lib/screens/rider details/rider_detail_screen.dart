import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider/screens/universal%20widgets/layout_widgets.dart';

import '../../models/rider.dart';
import '../../providers/riders_provider.dart';
import '../universal widgets/buttons.dart';
import 'widgets/widget.dart';

class RiderDetails extends StatelessWidget {
  const RiderDetails({super.key, required this.rider});

  final Rider rider;

  @override
  Widget build(BuildContext context) {
    final riderProviderInstance = Provider.of<RidersProvider>(context);
    return Scaffold(
      appBar: appBar('View Rider'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 400.0, autoPlay: true, viewportFraction: 1),
              items: [
                rider.docs['aadhar'],
                rider.docs['pancard'],
                rider.docs['driving license'],
                rider.docs['bank cheque'],
                rider.docs['photo'],
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.file(
                        File(i!),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.black,
              height: 1,
            ),
            InfoFields(title: 'Name', value: rider.name),
            InfoFields(title: 'Phone Number', value: rider.phoneNumber),
            InfoFields(title: 'Address', value: rider.currentAddress),
            InfoFields(title: 'Localities', value: rider.localities),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextButtom(
              title: 'Reject',
              onPressed: () {
                riderProviderInstance.removeRider(rider.id);
                Navigator.of(context).pop();
              },
            ),
            CustomTextButtom(
              title: 'Accept',
              onPressed: () {
                riderProviderInstance.removeRider(rider.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
