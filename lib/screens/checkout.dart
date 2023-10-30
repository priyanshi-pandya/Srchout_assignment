import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srchout_assignment/utils/constants/constants.dart';
import 'dart:math';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  var formatter = DateFormat('yyyy-MM-dd');
  DateTime startDate = DateTime.now();
  var endDate = DateTime.now();
  int discount = 0;
  int totalRent = 0;
  int daysDifference = 0;
  TextEditingController coupanController = TextEditingController();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<void> _selectDate(
      BuildContext context, dateSelected, bool isStart) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != dateSelected) {
      await _pref.then(
        (value) {
          totalRent = value.getInt("Total_Rent") ?? 0;
          totalRent = totalRent * daysDifference;
        },
      );
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    startDate = DateTime.parse(formatter.format(startDate));
    endDate = DateTime.parse(formatter.format(endDate));
  }

  @override
  Widget build(BuildContext context) {
    daysDifference = endDate.difference(startDate).inDays + 1;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 31),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
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
                        "Check Out",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 33,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFBABABA),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(children: [
                      Container(
                        width: 296,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFE5E5E5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 7),
                          child: Row(children: [
                            Column(
                              children: [
                                const Text(
                                  "Start Date",
                                  style: TextStyle(
                                      color: Color(0xFF8C7E7E),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "${startDate.day}-${startDate.month}-${startDate.year}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () =>
                                    _selectDate(context, startDate, true),
                                child:
                                    Image.asset('assets/images/calender.png'))
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 296,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFE5E5E5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 7),
                          child: Row(children: [
                            Column(
                              children: [
                                const Text(
                                  "End Date",
                                  style: TextStyle(
                                      color: Color(0xFF8C7E7E),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "${endDate.day}-${endDate.month}-${endDate.year}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () =>
                                    _selectDate(context, endDate, false),
                                child:
                                    Image.asset('assets/images/calender.png'))
                          ]),
                        ),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: coupanController,
                  onChanged: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        discount = 0;
                      } else {
                        discount = 369;
                      }
                    });
                  },
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    isCollapsed: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Color(0xFFBABABA),
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Color(0xFFBABABA),
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    hintText: "Apply coupon",
                    hintStyle: TextStyle(
                      color: Color(0xFF8C7E7E),
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xFFBABABA),
                  thickness: 1,
                ),
                const SizedBox(
                  height: 6,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Days ',
                          style: Constants.textStyle,
                        ),
                        const Spacer(),
                        Text(
                          daysDifference.toString(),
                          style: Constants.textStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Rent ',
                          style: Constants.textStyle,
                        ),
                        const Spacer(),
                        Text(
                          '₹${1499 * daysDifference}',
                          style: Constants.textStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Additional items ',
                          style: Constants.textStyle,
                        ),
                        const Spacer(),
                        Text(
                          '₹$totalRent',
                          style: Constants.textStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Coupon Discount ',
                          style: Constants.textStyle,
                        ),
                        const Spacer(),
                        Text(
                          '₹$discount',
                          style: Constants.textStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                const Divider(
                  color: Color(0xFFBABABA),
                  thickness: 1,
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    const Text(
                      "Total Amount",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "₹${1499 * daysDifference + discount + totalRent}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Success",
                            textAlign: TextAlign.center,
                          ),
                          content: Image.asset('assets/images/success.jpg'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text(
                    'PAY',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
