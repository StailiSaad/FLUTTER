import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String gender = 'Homme';
  bool codage = false;
  bool design = false;
  bool gaming = false;
  double niveau = 0.0;
  String formation = 'Informatique';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: Colors.blue[300], 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            const Text(
              'Saisir votre nom',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Entrez votre nom',
                border: OutlineInputBorder(), 
                isDense: true,
              ),
            ),
            const SizedBox(height: 16),

            
            const Text(
              'Saisir votre Age',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Entrez votre Age',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 16),

            
            const Text(
              'Genre :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Homme',
                  groupValue: gender,
                  onChanged: (String? value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                const Text('Homme'),
                const SizedBox(width: 20),
                Radio<String>(
                  value: 'Femme',
                  groupValue: gender,
                  onChanged: (String? value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),
                const Text('Femme'),
              ],
            ),
            const SizedBox(height: 16),

          
            const Text(
              'Centre d\'interet :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            
            Transform.translate(
              offset: const Offset(-8, 0),
              child: CheckboxListTile(
                title: const Text('Codage'),
                value: codage,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                onChanged: (bool? value) {
                  setState(() {
                    codage = value!;
                  });
                },
              ),
            ),
            Transform.translate(
              offset: const Offset(-8, 0),
              child: CheckboxListTile(
                title: const Text('Design'),
                value: design,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                onChanged: (bool? value) {
                  setState(() {
                    design = value!;
                  });
                },
              ),
            ),
            Transform.translate(
              offset: const Offset(-8, 0),
              child: CheckboxListTile(
                title: const Text('Gaming'),
                value: gaming,
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                onChanged: (bool? value) {
                  setState(() {
                    gaming = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),

          
            const Text(
              'Niveau en programmation :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Débutant', style: TextStyle(fontSize: 12),),
                Expanded(
                  child: Slider(
                    value: niveau,
                    min: 0,
                    max: 100,
                    onChanged: (double value) {
                      setState(() {
                        niveau = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

           
            const Text(
              'Formation :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: formation,
              isExpanded: false,
              underline: const SizedBox(),  
              items: <String>['Informatique', 'Réseaux', 'Design', 'Autre']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  formation = newValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
