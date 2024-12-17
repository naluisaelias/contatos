import 'package:flutter/material.dart';
import 'package:contatos/contato.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hearts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
      ),
      home: ListaPage(),
    );
  }
}

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  // Lista de contatos
  final List<Contato> contatos = [
    Contato(nome: 'Ana Carolina', email: 'anacarolina@gmail.com'),
    Contato(nome: 'Ana Luísa', email: 'analuisa@gmail.com'),
    Contato(nome: 'Gabriel Castilho', email: 'gabrielcastilho@ttpd.com'),
    Contato(nome: 'Lucas Proença', email: 'lucasproenca@hotmail.com'),
    Contato(nome: 'Prof. Diego Vieira', email: 'profDiego@fiap.com'),
    Contato(nome: 'Rafael da Silva', email: 'rafaelsilva@uol.com.br')
  ];

  int cont = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'Contatos favoritos -> $cont',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=$index'),
              ),
              title: Text(contatos[index].nome),
              subtitle: Text(contatos[index].email),
              trailing: IconButton(
                icon: contatos[index].fav
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    if (contatos[index].fav) {
                      cont--; // Desfavoritar
                    } else {
                      cont++; // Favoritar
                    }
                    contatos[index].fav = !contatos[index].fav;
                  });
                },
              ));
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
