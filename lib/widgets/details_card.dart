import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    required this.name,
    required this.value,
  });
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: const Color(0xFFBABABA), width: 2, style: BorderStyle.solid),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  color: Color(0xFF8C7E7E),
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              value,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
