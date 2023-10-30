import 'package:flutter/material.dart';
import 'package:srchout_assignment/widgets/popular_items_container.dart';
import 'package:srchout_assignment/widgets/recently_viewed_container.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int? _value = 1;
  List<String> bikeFilter = ["Adventure", "Cruiser", "Sports", "Touring"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding:
                   EdgeInsets.symmetric(horizontal: 12.0, vertical: 31),
                child: Row(
                  children: [
                    
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              color: Color(0xFF8C7E7E),
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Abhi Tiwari',
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    prefixIcon: const Image(
                        image: AssetImage('assets/icons/magnfying.png')),
                    fillColor: const Color(0xFFEFEEEE),
                    hintText: 'Search Bike',
                    hintStyle: const TextStyle(
                        color: Color(0xFFD2CFCF),
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: bikeFilter.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        showCheckmark: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Color(0xFFBABABA)),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 9, vertical: 15),
                        label: Text(
                          bikeFilter[index],
                          style: TextStyle(
                            color:
                                _value == index ? Colors.white : Colors.black,
                          ),
                        ),
                        selectedColor: Colors.black,
                        selected: _value == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? index : null;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                        text: 'Popular',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'Roboto',
                            fontSize: 21,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: ' Items',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    PopularItemsContainer(
                      image: 'assets/images/meteore.png',
                      name: "Meteore",
                      type: "Royal Enfield",
                      rent: 699,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    PopularItemsContainer(
                      image: 'assets/images/scout_bobber.png',
                      name: "Scout Bobber",
                      type: "Indian",
                      rent: 1499,
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    PopularItemsContainer(
                      image: 'assets/images/rebel.jpg',
                      name: "Rebel 1100",
                      type: "Honda",
                      rent: 1199,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                        text: 'Recently',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'Roboto',
                            fontSize: 21,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: ' Viewed',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SingleChildScrollView(
                  primary: false,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      RecentlyViewedContainer(
                        image: 'assets/images/hayabusa.png',
                        name: 'Hayabusa',
                        rent: 2000,
                        avaiableOrBooked: 'Available',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RecentlyViewedContainer(
                        image: 'assets/images/classic_350.png',
                        name: 'Classic 350',
                        rent: 1500,
                        avaiableOrBooked: 'Booked',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RecentlyViewedContainer(
                        image: 'assets/images/ninja.png',
                        name: 'Ninja ZX-10r',
                        rent: 1800,
                        avaiableOrBooked: 'Available',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
