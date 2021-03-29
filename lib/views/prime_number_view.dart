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
  void dispose() { 
    _number1.dispose();
    _number2.dispose();
    super.dispose();
  }

  void _onAction() {
    FocusScope.of(context).unfocus();

    final number1 = int.tryParse(_number1.text);
    final number2 = int.tryParse(_number2.text);

    if (number1 == null || number2 == null) {
      return;
    }

    context.read<PrimeNumberController>().getPrimeNumbers(
          number1,
          number2,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
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
                  const SizedBox(width: 20),
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
            ),
            ElevatedButton(
              onPressed: _onAction,
              child: const Text("Get Primary Number"),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<PrimeNumberController>(
                builder: (context, controller, child) {
                  final listPrimeNumbers = controller.state.listPrimeNumbers;
                  if (listPrimeNumbers.isEmpty) {
                    return const Offstage();
                  }
                  return Text(
                    listPrimeNumbers.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
