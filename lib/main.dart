import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// without annotations
import 'without_annotation/flutter_riverpod_page.dart' as woa_frp;
import 'without_annotation/hooks_riverpod_page.dart' as woa_hrp;
import 'without_annotation/flutter_hooks_page.dart' as woa_fhp;
import 'without_annotation/riverpod_list_page.dart' as woa_rlp;
import 'without_annotation/stateful_page.dart' as woa_sp;

// with annotations
import 'with_annotation/flutter_riverpod_page.dart' as wa_frp;
import 'with_annotation/hooks_riverpod_page.dart' as wa_hrp;
import 'with_annotation/flutter_hooks_page.dart' as wa_fhp;
import 'with_annotation/riverpod_list_page.dart' as wa_rlp;

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Riverpod Demo Home Page'),
      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              // with annotations
              case wa_frp.FlutterRiverpodPage.routeName:
                return const wa_frp.FlutterRiverpodPage(
                    title: wa_frp.FlutterRiverpodPage.pageName);
              case wa_hrp.HooksRiverpodPage.routeName:
                return const wa_hrp.HooksRiverpodPage(
                    title: wa_hrp.HooksRiverpodPage.pageName);
              case wa_fhp.FlutterHooksPage.routeName:
                return const wa_fhp.FlutterHooksPage(
                    title: wa_fhp.FlutterHooksPage.pageName);
              case wa_rlp.RiverpodListPage.routeName:
                return wa_rlp.RiverpodListPage(
                    title: wa_rlp.RiverpodListPage.pageName);
              // without annotations
              case woa_frp.FlutterRiverpodPage.routeName:
                return const woa_frp.FlutterRiverpodPage(
                    title: woa_frp.FlutterRiverpodPage.pageName);
              case woa_hrp.HooksRiverpodPage.routeName:
                return const woa_hrp.HooksRiverpodPage(
                    title: woa_hrp.HooksRiverpodPage.pageName);
              case woa_fhp.FlutterHooksPage.routeName:
                return const woa_fhp.FlutterHooksPage(
                    title: woa_fhp.FlutterHooksPage.pageName);
              case woa_rlp.RiverpodListPage.routeName:
                return woa_rlp.RiverpodListPage(
                    title: woa_rlp.RiverpodListPage.pageName);
              case woa_sp.StatefulPage.routeName:
              default:
                return const woa_sp.StatefulPage(
                    title: woa_sp.StatefulPage.pageName);
            }
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'without annotations:',
            ),
            TextButton(
              child: new Text(woa_frp.FlutterRiverpodPage.pageName),
              onPressed: () {
                Navigator.restorablePushNamed(
                    context, woa_frp.FlutterRiverpodPage.routeName);
              },
            ),
            TextButton(
              child: new Text(woa_hrp.HooksRiverpodPage.pageName),
              onPressed: () {
                Navigator.restorablePushNamed(
                    context, woa_hrp.HooksRiverpodPage.routeName);
              },
            ),
            TextButton(
              child: new Text(woa_fhp.FlutterHooksPage.pageName),
              onPressed: () {
                Navigator.restorablePushNamed(
                    context, woa_fhp.FlutterHooksPage.routeName);
              },
            ),
            TextButton(
              child: new Text(woa_rlp.RiverpodListPage.pageName),
              onPressed: () {
                Navigator.restorablePushNamed(
                    context, woa_rlp.RiverpodListPage.routeName);
              },
            ),
            TextButton(
              child: new Text(woa_sp.StatefulPage.pageName),
              onPressed: () {
                Navigator.restorablePushNamed(
                    context, woa_sp.StatefulPage.routeName);
              },
            ),
            const Text(
              'with annotations:',
            ),
            TextButton(
              child: new Text(wa_frp.FlutterRiverpodPage.pageName),
              onPressed: () {
                Navigator.restorablePushNamed(
                    context, wa_frp.FlutterRiverpodPage.routeName);
              },
            ),
            TextButton(
              child: new Text(wa_hrp.HooksRiverpodPage.pageName),
              onPressed: () {
                Navigator.restorablePushNamed(
                    context, wa_hrp.HooksRiverpodPage.routeName);
              },
            ),
            TextButton(
              child: new Text(wa_fhp.FlutterHooksPage.pageName),
              onPressed: () {
                Navigator.restorablePushNamed(
                    context, wa_fhp.FlutterHooksPage.routeName);
              },
            ),
            TextButton(
              child: new Text(wa_rlp.RiverpodListPage.pageName),
              onPressed: () {
                Navigator.restorablePushNamed(
                    context, wa_rlp.RiverpodListPage.routeName);
              },
            ),
            // TextButton(
            //   child: new Text(wa_sp.StatefulPage.pageName),
            //   onPressed: () {
            //     Navigator.restorablePushNamed(
            //         context, wa_sp.StatefulPage.routeName);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
