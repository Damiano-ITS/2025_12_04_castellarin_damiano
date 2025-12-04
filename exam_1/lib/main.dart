import "package:flutter/material.dart";
import "package:its_aa_pn_2025_cross_platform/form.dart";
import "package:its_aa_pn_2025_cross_platform/input.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recensioni",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
      ),
      home: const MyHomePage(title: "Recensioni"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _displayText = "Nessuna recensione, aggiungi ora!";
  final reviews = <Personal>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            if (reviews.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    _displayText,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            for (final review in reviews)
              ListTile(
                leading: Text(review.rating),
                title: Text(review.name),
                subtitle: Text(review.comment ?? ""),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _editReview();
                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addReview,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _addReview() async {
    final result = await showDialog<Personal>(
      context: context,
      builder: (context) {
        return const AddFormDialog();
      },
    );

    if (result == null) return;

    setState(() {
      reviews.add(result);
      _displayText = "";
    });
  }

  void _editReview() {
  }
}