import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: Builder(
          builder: (context) {
            return ResponsiveScaledBox(
              width: ResponsiveValue<double>(
                context,
                conditionalValues: [
                  const Condition.between(start: 0, end: 599, value: 420),
                  const Condition.between(start: 600, end: 849, value: 600),
                  const Condition.between(start: 850, end: 1023, value: 825),
                  const Condition.between(start: 1024, end: 1199, value: 1050),
                  const Condition.between(start: 1200, end: 1279, value: 1150),
                  const Condition.between(start: 1280, end: 1364, value: 1250),
                  const Condition.between(start: 1365, end: 1699, value: 1000),
                  const Condition.largerThan(breakpoint: 1700, value: 1200),
                ],
              ).value,
              child: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        ),
        breakpoints: [
          const Breakpoint(start: 0, end: 599, name: MOBILE),
          const Breakpoint(start: 600, end: 904, name: TABLET),
          const Breakpoint(start: 905, end: double.infinity, name: DESKTOP),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.secondaryContainer,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Lorem ipsum dolor sit amet'),
                        const Row(
                          children: [
                            Text('Lorem ipsum dolor sit amet'),
                          ],
                        ),
                        const Row(
                          children: [
                            Text('Lorem ipsum dolor sit amet'),
                          ],
                        ),
                        TextButton(
                          onPressed: () => {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                          ),
                          child: const Text('Lorem ipsum'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Scrollbar(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
                  child: Column(
                    children: [
                      Expanded(child: LayoutBuilder(
                        builder: (BuildContext buildContext,
                            BoxConstraints constraints) {
                          return SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: constraints.maxHeight,
                              ),
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 0,
                                    color: Colors.lightBlueAccent,
                                    margin: EdgeInsets.zero,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16,),
                                      child: Column(
                                        children: [
                                          const CircleAvatar(
                                            child: Icon(
                                              Icons.warning,
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            'Lorem Ipsum',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 4),
                                          const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae libero nec risus tristique ullamcorper in in risus.',
                                              textAlign: TextAlign.center),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 24.0),
                                            child: Text.rich(
                                              TextSpan(
                                                text:
                                                    'Lorem ipsum dolor',
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        ' sit amet',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                      Container(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text('Lorem ipsum'),
                            ),
                            ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text('Lorem ipsum'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
