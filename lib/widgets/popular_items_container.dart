import 'package:flutter/material.dart';
import 'package:srchout_assignment/utils/routes/route_generator.dart';

class PopularItemsContainer extends StatelessWidget {
  const PopularItemsContainer({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.rent,
  });
  final String image;
  final String name;
  final String type;
  final int rent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, RouteGenerator.bikeDetailsPage,
          arguments: {
            'image': image,
            'name': name,
            'type': type,
            'rent': rent
          }),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: const Color(0xFFBABABA),
              width: 2,
              style: BorderStyle.solid),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(image, height: 158, width: 150,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    type,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto Slab',
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text.rich(
                    TextSpan(
                        text: '$rent/',
                        style: const TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'Risque',
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        children: const [
                         TextSpan(
                            text: ' per day',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Roboto',
                                fontSize: 17),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
