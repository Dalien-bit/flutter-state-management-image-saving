import 'package:flutter/material.dart';

class DocumentTile extends StatelessWidget {
  const DocumentTile({
    Key? key,
    required this.text,
    required this.add,
    required this.view,
    required this.check,
  }) : super(key: key);
  final String text;
  final void Function() add;
  final void Function() view;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: ListTile(
        leading: check
            ? const Icon(Icons.check_box)
            : const Icon(Icons.check_box_outline_blank),
        title: Text(text),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
                onPressed: view,
                child: const Text(
                  'View',
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  // backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: add,
                child: const Text(
                  'Add',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
