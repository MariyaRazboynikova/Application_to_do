//remove item from cart method
import 'package:flutter/material.dart';

void removeItemFromCart(BuildContext context) {
  //show a dialog box to ask user to confirm to remove to card
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Confirm'),
      content: const Text('Are you sure you wish to delete this task?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text('No'),
        ),
      ],
    ),
  );
}
