import 'package:flutter/material.dart';
import 'package:srchout_assignment/utils/routes/route_generator.dart';
import 'package:srchout_assignment/widgets/details_card.dart';
import 'package:srchout_assignment/widgets/recently_viewed_container.dart';

class BikeDetailsPage extends StatefulWidget {
  const BikeDetailsPage(
      {super.key,
      required this.image,
      required this.name,
      required this.type,
      required this.rent});
  final String image;
  final String name;
  final String type;
  final int rent;

  @override
  State<BikeDetailsPage> createState() => _BikeDetailsPageState();
}

class _BikeDetailsPageState extends State<BikeDetailsPage> {
  int gloves = 800;
  int helmet = 800;
  int jacket = 1500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 31),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset('assets/icons/back_arrow.png')),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 71, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xFFBABABA),
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                        child: const Text(
                          "Bike Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.type,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto Slab',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              widget.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const DetailsCard(name: "Category", value: "Cruiser"),
                        const SizedBox(
                          height: 15,
                        ),
                        const DetailsCard(
                            name: "Displacement", value: "1133 cc"),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width * 0.49,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFBABABA),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 15,
                              child: Image.asset(
                                'assets/images/scout_bobber_2.png',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const DetailsCard(name: "Max. Speed", value: "124 km/h"),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.checkoutPage);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.49,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Rent",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: '1499 /',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Risque',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    TextSpan(
                                      text: ' per day',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Roboto',
                                          fontSize: 17),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 38,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                        text: 'Add',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'Roboto',
                            fontSize: 21,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: ' items',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                SingleChildScrollView(
                  primary: false,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      RecentlyViewedContainer(
                        image: 'assets/images/riding_jacket.png',
                        name: 'Riding Jacket',
                        rent: jacket,
                        buttonValue: 0,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RecentlyViewedContainer(
                        image: 'assets/images/riding_gloves.png',
                        name: 'Riding Gloves',
                        rent: gloves,
                        buttonValue: 0,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RecentlyViewedContainer(
                        image: 'assets/images/helmet.png',
                        name: 'Helmet',
                        rent: helmet,
                        buttonValue: 0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
