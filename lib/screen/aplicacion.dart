import 'package:flutter/material.dart';

class Aplicacion extends StatelessWidget {
  const Aplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF075E54),
          secondary: Colors.tealAccent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          actions: const [
            Icon(Icons.search),
            SizedBox(width: 16),
            Icon(Icons.more_vert),
            SizedBox(width: 10),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: 'CHATS'),
              Tab(text: 'ESTADO'),
              Tab(text: 'LLAMADAS'),
            ],
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              Center(child: Text('esperese que todavia no llego a la camara :()')),
              ChatsPage(),
              StatusPage(),
              CallsPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'Familia <3',
        'message': 'Hay comida en la casa?',
        'seen': true,
        'image': 'lib/assets/1.jpg',
      },
      {
        'name': 'Astrid <3',
        'message': 'Vamos a salir a cenar?',
        'seen': false,
        'image': 'lib/assets/6.jpg',
      },
      {
        'name': 'Dimarco la kbra',
        'message': 'Tu eres el mas guapo ',
        'seen': true,
        'image': 'lib/assets/2.jpg',
      },
      {
        'name': 'Into rg4',
        'message': 'Pagame mi fon ',
        'seen': true,
        'image': 'lib/assets/3.jpg',
      },
      {
        'name': 'Campeooooooonesssssss ',
        'message': 'Potra mañana?',
        'seen': false,
        'image': 'lib/assets/4.jpg',
      },
       {
        'name': 'Kbp el Alienigena',
        'message': 'Nuevo tema pronto ',
        'seen': false,
        'image': 'lib/assets/5.jpg',
      },
    ];

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(chat['image']),
          ),
          title: Text(chat['name']),
          subtitle: Row(
            children: [
              Icon(
                chat['seen'] == true ? Icons.done_all : Icons.done,
                size: 16,
                color: chat['seen'] == true ? Colors.blue : Colors.grey,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  chat['message'],
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          trailing: const Text('Ayer'),
        );
      },
    );
  }
}
class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/assets/2.jpg'),
          ),
          title: Text('Mi estado'),
          subtitle: Text('Subido hace 1 hora'),
          trailing: Icon(Icons.edit),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text('Estados vistos recientes'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('lib/assets/6.jpg'),
          ),
          title: Text('Astrid <3'),
          subtitle: Text('Hace 2 horas'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text('Estados silenciados'),
        ),
      ],
    );
  }
}
class CallsPage extends StatelessWidget {
  const CallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('igual no me llama nadie :()'),
    );
  }
}