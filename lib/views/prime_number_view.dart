import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/prime_number_controller.dart';

class PrimeNumberView extends StatefulWidget {
  const PrimeNumberView({
    Key? key,
  }) : super(key: key);

  @override
  _PrimeNumberViewState createState() => _PrimeNumberViewState();
}

class _PrimeNumberViewState extends State<PrimeNumberView> {
  final _formKey = GlobalKey<FormState>();
  final _number1 = TextEditingController();
  final _number2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _number1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Start",
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _number2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "End",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<PrimeNumberController>().getPrimeNumbers(
                      int.tryParse(_number1.text) ?? 0,
                      int.tryParse(_number2.text) ?? 0,
                    );
              },
              child: const Text("Get Primary Number"),
            ),
            const SizedBox(height: 20),
            Text(
              context
                  .watch<PrimeNumberController>()
                  .state
                  .listPrimeNumbers
                  .toString(),
            ),
          ],
        ),
      ),
    );
  }
}
