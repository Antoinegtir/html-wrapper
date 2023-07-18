// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:html_wrapper/html_wrapper.dart' as wrapp;
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter to HTML Wrapper',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            backgroundColor: Colors.black,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: const SeoPage()));
  }
}

class SeoPage extends StatefulWidget {
  const SeoPage({super.key});

  @override
  State<SeoPage> createState() => _SeoPageState();
}

class _SeoPageState extends State<SeoPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const wrapp.Image(
              src: './assets/assets/wrapp.png',
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                wrapp.Text(
                  'Hello Seo!',
                  style: TextStyle(
                      fontFamily: 'arial',
                      fontSize: MediaQuery.of(context).size.width / 6,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                  tag: wrapp.Tag.h1,
                ),
                const SizedBox(
                  height: 300,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    wrapp.Image(
                      src: './assets/assets/github.png',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.width / 20,
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    wrapp.Text(
                      'Download',
                      href: 'https://github.com/Antoinegtir',
                      style: TextStyle(
                          fontFamily: 'arial',
                          fontSize: MediaQuery.of(context).size.width / 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                      tag: wrapp.Tag.h1,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                    ),
                    wrapp.Image(
                      height: MediaQuery.of(context).size.width / 20,
                      width: MediaQuery.of(context).size.width / 20,
                      borderRadius: BorderRadius.circular(200),
                      href: 'https://github.com/Antoinegtir',
                      src:
                          'https://avatars.githubusercontent.com/u/114834504?v=4',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 20,
                    ),
                    wrapp.Text(
                      'By Antoine Gonthier',
                      href: 'https://github.com/Antoinegtir',
                      style: TextStyle(
                          fontFamily: 'arial',
                          fontSize: MediaQuery.of(context).size.width / 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                      tag: wrapp.Tag.h1,
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
