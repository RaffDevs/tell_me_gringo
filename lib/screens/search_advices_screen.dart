import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tell_me_gringo/services/advice_service.dart';
import 'package:tell_me_gringo/shared/constants.dart';

class SearchAdvicesScreen extends StatefulWidget {
  const SearchAdvicesScreen({super.key});

  @override
  State<SearchAdvicesScreen> createState() => _SearchAdvicesScreen();
}

class _SearchAdvicesScreen extends State<SearchAdvicesScreen> {
  String? _advice = null;
  final AdviceService _adviceService = AdviceService();

  Future<void> _getAdvice() async {
    try {
      final adviceReponse = await _adviceService.getAdvice();
      setState(() {
        _advice = adviceReponse.slip.advice;
      });
    } catch (e) {
      setState(() {
        _advice = "Error!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(Constants.app_name),
      ),
      child: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CupertinoButton(
                onPressed: () {
                  _getAdvice();
                },
                child: const Text("Get an advice")),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Text(
                    _advice ?? "Press the button to get an advice",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  if (_advice != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CupertinoButton(
                          child: const Icon(CupertinoIcons.heart),
                          onPressed: () {},
                        ),
                        CupertinoButton(
                          child: const Icon(CupertinoIcons.share),
                          onPressed: () {},
                        ),
                      ],
                    ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
