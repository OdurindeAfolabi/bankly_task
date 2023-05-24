import 'package:bankly_task/presentation/screens/transaction_entry_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bankly transactions',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            color: Color(0xFFFFFFFF),
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color(0xFFFFFFFF),
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            )),
      ),
      home: const TransactionEntryView(),
    );
  }
}


