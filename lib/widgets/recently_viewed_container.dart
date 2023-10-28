import 'package:flutter/material.dart';

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
  int? buttonValue;

  @override
  State<RecentlyViewedContainer> createState() =>
      _RecentlyViewedContainerState();
}

class _RecentlyViewedContainerState extends State<RecentlyViewedContainer> {
  int totalValue1 = 0;
  int totalValue2 = 0;
  int totalValue3 = 0;
  int totalSum = 0;
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
                onTap: () {
                  setState(() {
                    // totalSum = 0;
                    widget.buttonValue = widget.buttonValue! + 1;
                    // if (widget.name == "Helmet") {
                    //   totalValue1 = widget.buttonValue! * widget.rent + 800 + totalValue2 + totalValue3;
                    //   totalSum = totalValue1;
                    // }
                    // if (widget.name == "Riding Gloves") {
                    //   totalValue2 = widget.buttonValue! * widget.rent + totalValue1 + totalValue3;
                    //   totalSum = totalValue2;
                    // }
                    // if (widget.name == "Riding Jacket") {
                    //   totalValue3 = widget.buttonValue! * widget.rent + 1500 +  totalValue1 + totalValue2;
                    //   totalSum = totalValue3;
                    // }
                    // totalSum += totalValue1 + totalValue2 + totalValue3;
                    // print(totalSum);
                  });
                },
                child: Container(
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: widget.buttonValue! > 0
                        ? Colors.black
                        : const Color(0xFFBABABA),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.buttonValue == 0
                          ? "Add"
                          : widget.buttonValue!.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: widget.buttonValue! == 0
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
