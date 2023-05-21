import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class FoodItemPage extends StatefulWidget {
  const FoodItemPage({super.key});

  @override
  State<FoodItemPage> createState() => _FoodItemPageState();
}

final _paymentItems = <PaymentItem>[];
final Map<String, int> cost = {
  "idly": 8,
  "poori": 10,
  "vadai": 6,
  "tomato": 30
};
var idlyQty = 0;
var vadaiQty = 0;
var pooriQty = 0;
var tomatoQty = 0;
num totalPrice = 0;

class _FoodItemPageState extends State<FoodItemPage> {
  num calculateTotalPrice() {
    totalPrice = cost["idly"]! * idlyQty +
        cost["vadai"]! * vadaiQty +
        cost["poori"]! * pooriQty +
        cost["tomato"]! * tomatoQty;
    _paymentItems.add(
      PaymentItem(
        amount: totalPrice.toString(),
        label: "Vcet Canteen purchase",
        status: PaymentItemStatus.final_price,
      ),
    );
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: FirebaseAuth.instance.signOut,
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 100,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          child: Image.asset(
                            './assets/images/idly.jpg',
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              " Idly ".toUpperCase(),
                              style: TextStyle(fontSize: 25),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.white38,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              height: 40,
                              width: 120,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (idlyQty < 1) {
                                            idlyQty = 0;
                                          } else {
                                            idlyQty--;
                                          }
                                        });
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                    Text(
                                      idlyQty.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          idlyQty++;
                                        });
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '₹ ' + cost["idly"].toString(),
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              '₹ ' + (cost["idly"]! * idlyQty).toString(),
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 100,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          child: Image.asset(
                            './assets/images/poori.jpg',
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              " poori ".toUpperCase(),
                              style: TextStyle(fontSize: 25),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.white38,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              height: 40,
                              width: 120,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (pooriQty < 1) {
                                            pooriQty = 0;
                                          } else {
                                            pooriQty--;
                                          }
                                        });
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                    Text(
                                      pooriQty.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          pooriQty++;
                                        });
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '₹ ' + cost["poori"].toString(),
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              '₹ ' + (cost["poori"]! * pooriQty).toString(),
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 100,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          child: Image.asset(
                            './assets/images/vadai.jpg',
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              " vadai ".toUpperCase(),
                              style: TextStyle(fontSize: 25),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.white38,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              height: 40,
                              width: 120,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (vadaiQty < 1) {
                                            vadaiQty = 0;
                                          } else {
                                            vadaiQty--;
                                          }
                                        });
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                    Text(
                                      vadaiQty.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          vadaiQty++;
                                        });
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '₹ ' + cost["vadai"].toString(),
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              '₹ ' + (cost["vadai"]! * vadaiQty).toString(),
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    height: 100,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 75,
                          width: 75,
                          child: Image.asset(
                            './assets/images/tomato rice.jpg',
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              " tomato rice ".toUpperCase(),
                              style: TextStyle(fontSize: 25),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.white38,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              height: 40,
                              width: 120,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (tomatoQty < 1) {
                                            tomatoQty = 0;
                                          } else {
                                            tomatoQty--;
                                          }
                                        });
                                      },
                                      icon: Icon(Icons.remove),
                                    ),
                                    Text(
                                      tomatoQty.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          tomatoQty++;
                                        });
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '₹ ' + cost["tomato"].toString(),
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              '₹ ' + (cost["tomato"]! * tomatoQty).toString(),
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Total cost to Pay : ₹ " + calculateTotalPrice().toString(),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                    ),
                  ),
                  totalPrice == 0
                      ? Container()
                      : GooglePayButton(
                          paymentConfigurationAsset: 'gpay.json',
                          paymentItems: _paymentItems,
                          width: 200,
                          height: 50,
                          type: GooglePayButtonType.pay,
                          margin: const EdgeInsets.only(top: 15.0),
                          onPaymentResult: (data) {
                            print(data);
                          },
                          loadingIndicator: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
