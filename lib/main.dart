import 'package:flutter/material.dart';

class UserProfile {
  final String nom;
  final String age;
  final String genre;
  final List<String> interets;
  final double niveauCompetence;
  final String formation;

  UserProfile({
    required this.nom,
    required this.age,
    required this.genre,
    required this.interets,
    required this.niveauCompetence,
    required this.formation,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gestion Profil DevOAM",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: "Formulaire d'Inscription"),
        '/profile': (context) => const ProfilePage(),
      },
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
  final TextEditingController _nomcontroller = TextEditingController();
  final TextEditingController _agecontroller = TextEditingController();

  UserProfile? _userProfile;

  String _genre = "Homme";
  bool _codage = false;
  bool _design = false;
  bool _gaming = false;
  double _competenceLevel = 1.0;
  String _formation = "Informatique";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Informations Personnelles"),
            const SizedBox(height: 10),
            TextField(
              controller: _nomcontroller,
              decoration: const InputDecoration(
                labelText: "Nom Complet",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _agecontroller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Âge",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.cake),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Enregistrer et Voir Profil"),
                onPressed: () {
                  List<String> listInterets = [];
                  if (_codage) listInterets.add('Codage');
                  if (_design) listInterets.add('Design');
                  if (_gaming) listInterets.add('Gaming');

                  _userProfile = UserProfile(
                    nom: _nomcontroller.text,
                    age: _agecontroller.text,
                    genre: _genre,
                    interets: listInterets,
                    niveauCompetence: _competenceLevel,
                    formation: _formation,
                  );

                  Navigator.pushNamed(
                    context,
                    '/profile',
                    arguments: _userProfile,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              _nomcontroller.text.isEmpty
                  ? "Étudiant ISTA"
                  : _nomcontroller.text,
            ),
            accountEmail: const Text("android.dev@safi.ma"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('Mon Profil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                '/profile',
                arguments: _userProfile,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nomcontroller.dispose();
    _agecontroller.dispose();
    super.dispose();
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profile =
        ModalRoute.of(context)?.settings.arguments as UserProfile?;

    return Scaffold(
      appBar: AppBar(title: const Text('Détails du Profil')),
      body: profile == null
          ? const Center(child: Text("Ma derti walo f-formulaire!"))
          : _buildProfileUI(profile),
    );
  }

  Widget _buildProfileUI(UserProfile p) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Center(
          child: CircleAvatar(
            radius: 60,
            child: Icon(Icons.person, size: 60),
          ),
        ),
        Card(
          elevation: 4,
          child: Column(
            children: [
              _buildInfoTile(Icons.badge, "Nom Complet", p.nom),
              _buildInfoTile(Icons.calendar_today, "Âge", "${p.age} ans"),
              _buildInfoTile(
                Icons.interests,
                "Centres d'intérêt",
                p.interets.join(' - '),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
    );
  }
}
