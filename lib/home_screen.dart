import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController amountController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  final _razorpay = Razorpay();
  int selectedAmount = 100;

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('Payment Success');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log(response.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('Payment ExternalWallet');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Razor Pay Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(80.0),
            //   child: TextFormField(
            //     keyboardType: TextInputType.number,
            //     controller: amountController,
            //     decoration: const InputDecoration(hintText: "Amount", border: OutlineInputBorder()),
            //   ),
            // ),
            // const SizedBox(height: 50),
            Column(
              children: [
                RadioListTile<int>(
                  title: Text('100Rs'),
                  value: 100,
                  groupValue: selectedAmount,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('200Rs'),
                  value: 200,
                  groupValue: selectedAmount,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('300Rs'),
                  value: 300,
                  groupValue: selectedAmount,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('400Rs'),
                  value: 400,
                  groupValue: selectedAmount,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('500Rs'),
                  value: 500,
                  groupValue: selectedAmount,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('1000Rs'),
                  value: 1000,
                  groupValue: selectedAmount,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('10000Rs'),
                  value: 10000,
                  groupValue: selectedAmount,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
                RadioListTile<int>(
                  title: Text('33333Rs'),
                  value: 33333,
                  groupValue: selectedAmount,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
                RadioListTile<int>(
                  title:  Text('100000Rs'),
                  value: 100000,
                  groupValue: selectedAmount,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAmount = value!;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                var options = {
                  'key': 'rzp_test_PE5sLdsgdrG2Fj',
                  'amount': (selectedAmount * 100).toString(),
                  'name': 'Ashmine',
                  'description': 'Fine T-Shirt',
                  'prefill': {
                    'contact': '8888888888',
                    'email': 'test@razorpay.com',
                  }
                };
                _razorpay.open(options);
              },
              child: const Text(
                'Pay',
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
