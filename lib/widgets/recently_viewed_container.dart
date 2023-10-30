import 'package:flutter/material.dart';
import 'package:srchout_assignment/widgets/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentlyViewedContainer extends StatefulWidget {
  RecentlyViewedContainer({
    super.key,
    required this.image,
    required this.name,
    required this.rent,
    this.avaiableOrBooked,
    this.buttonValue,
  });

  final String image;
  final String name;
  final String? avaiableOrBooked;
  final int rent;
  int? buttonValue = 0;

  @override
  State<RecentlyViewedContainer> createState() =>
      _RecentlyViewedContainerState();
}

List<int> cartItems = [0, 0, 0];

class _RecentlyViewedContainerState extends State<RecentlyViewedContainer> {
  int totalValue1 = 0;
  int totalValue2 = 0;
  int totalValue3 = 0;
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<int> calculateTotalSum() async {
    print(cartItems);
    int totalSum = 0;
    for (var item in cartItems) {
      totalSum += item;
    }
    _pref.then(
      (value) {
        value.setInt("Total_Rent", totalSum);
      },
    );
    print("totalSum: $totalSum");
    return totalSum;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: const Color(0xFFBABABA), width: 1, style: BorderStyle.solid),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 9),
        child: Row(
          children: [
            Image.asset(widget.image),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text.rich(
                  TextSpan(
                      text: '${widget.rent}/',
                      style: const TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: 'Risque',
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                      children: const [
                        TextSpan(
                          text: 'per day',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Roboto',
                              fontSize: 17),
                        ),
                      ]),
                ),
              ],
            ),
            const Spacer(),
            if (widget.avaiableOrBooked != null)
              Container(
                decoration: BoxDecoration(
                  color: widget.avaiableOrBooked == "Available"
                      ? Colors.black
                      : const Color(0xFFBABABA),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.avaiableOrBooked!,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      color: widget.avaiableOrBooked != "Available"
                          ? Colors.black
                          : const Color(0xFFBABABA),
                    ),
                  ),
                ),
              )
            else
              InkWell(
                onTap: () async {
                  widget.buttonValue = widget.buttonValue! + 1;
                  setState(() {
                    if (widget.name == "Helmet") {
                      totalValue1 = widget.buttonValue! * widget.rent;
                      cartItems[0] = totalValue1;
                    } else if (widget.name == "Riding Gloves") {
                      totalValue2 = widget.buttonValue! * widget.rent;
                      cartItems[1] = totalValue2;
                    } else if (widget.name == "Riding Jacket") {
                      totalValue3 = widget.buttonValue! * widget.rent;
                      cartItems[2] = totalValue3;
                    }
                  });

                  await calculateTotalSum();
                },
                child: Container(
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: widget.buttonValue! > 0 ||
                            widget.buttonValue! > 0 ||
                            widget.buttonValue! > 0
                        ? Colors.black
                        : const Color(0xFFBABABA),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.buttonValue == 0
                          ? "Add"
                          : widget.buttonValue.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: widget.buttonValue == 0
                            ? Colors.black
                            : const Color(0xFFBABABA),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
