import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;

  const SearchBarWidget({super.key, required this.controller, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter City Name',
              prefixIcon: const Icon(Icons.location_city),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: onPressed,
          child: const Icon(Icons.search),
        )
      ],
    );
  }
}