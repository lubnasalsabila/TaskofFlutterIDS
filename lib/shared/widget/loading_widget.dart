import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 14, 65, 106)), // Warna indikator
      ),
    );
  }
}
