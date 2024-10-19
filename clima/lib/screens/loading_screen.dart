import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Methods
  Future<void> _determinePosition() async {
    try {
      var location = await Location().DeterminePosition();
      // Navigate only if the widget is still mounted.
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/$KLocationScreen',
            arguments: location);
      }
    } catch (e) {
      print('Error getting location: $e');
      // Consider showing an error message to the user here.
      // You might use a SnackBar or aDialog.
    }
  }

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // Center the loading indicator.
        child: SpinKitRing(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
