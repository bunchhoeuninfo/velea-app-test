import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/firebase_options.dart';

class VeleaTestAppHomeScreen  extends StatefulWidget {
  const VeleaTestAppHomeScreen({super.key});
  
  @override
  State<VeleaTestAppHomeScreen> createState() => _VeleaTestAppHomeScreen();

}

class _VeleaTestAppHomeScreen extends State<VeleaTestAppHomeScreen> {

  late DatabaseReference _radioChnDbRef;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('called build');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Velea Test App'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }

  Future<void> _getRadioChannel() async {
    print('called _getRadioChannel');
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.firebaseOptions);
    _radioChnDbRef = FirebaseDatabase.instance.ref('/KHFMRadio/ChannelsInfo');
    final _database = FirebaseDatabase.instance;
    _database.setLoggingEnabled(false);
    _database.setPersistenceEnabled(true);
    try {
      final _radioChnSnapshot = await _radioChnDbRef.get();
      print('snapshot: $_radioChnSnapshot');
    } catch (e) {
      print("Exception here....:: $e");
    }
    
  }

  @override
  void dispose() {
    super.dispose();
  }

}