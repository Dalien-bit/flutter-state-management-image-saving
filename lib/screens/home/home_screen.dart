import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider/providers/riders_provider.dart';
import 'package:rider/screens/add%20rider/add_detail_screen.dart';
import 'package:rider/screens/rider%20details/rider_detail_screen.dart';
import 'package:rider/screens/universal%20widgets/buttons.dart';
import 'package:rider/screens/universal%20widgets/layout_widgets.dart';
import 'package:swipe_to_action/swipe_to_action.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final riders = Provider.of<RidersProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar('Riders'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: riders.riders.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                // padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Swipeable(
                  key: const ValueKey("hhshs"),
                  background: Container(color: Colors.green),
                  secondaryBackground: Container(color: Colors.red),
                  onSwipe: (direction) {
                    riders.removeRider(riders.riders[index].id);
                  },
                  child: ListTile(
                    title: Text(riders.riders[index].name),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RiderDetails(
                          rider: riders.riders[index],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: CustomTextButtom(
        title: 'Add',
        onPressed: () {
          Navigator.of(context).pushNamed(AddDetailScreen.routeName);
        },
      ),
    );
  }
}
