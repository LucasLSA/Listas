import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  List _itens = [];

  void _carregarItens(){

    for(int i=1; i<=10; i++){

      Map<String, dynamic> item = Map();
      item["titulo"] = "Opção ${i} Lorem ipsum dolor sit amet";
      item["descricao"] = "Descrição ${i} Lorem ipsum dolor sit amet";
      _itens.add(item);

    }
    print("resultado  "+ _itens.toString());

  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, n){

              //Map<String, dynamic> item = _itens[n];asdasda
              //print("numero ${_itens[n]["titulo"]}");sa

              return ListTile(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(_itens[n]["titulo"]),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.blue
                          ),
                          content: Text(_itens[n]["descricao"]),
                          backgroundColor: Colors.grey,
                          actions: [
                            ElevatedButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Sim"),
                            ),
                            ElevatedButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Não")
                            ),
                          ],
                          //contentPadding:
                          //contentTextStyle:
                        );
                      }
                  );
                },
                title: Text( _itens[n]["titulo"] ),
                subtitle: Text(_itens[n]["descricao"]),
              );
            }
        )
      ),
    );
  }
}
