import 'package:calculadora_idade/enum/animais.dart';
import 'package:calculadora_idade/function/funcaoCalculo.dart';
import 'package:flutter/material.dart';

class PageMain extends StatefulWidget {
  const PageMain({Key? key}) : super(key: key);

  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  String? mesEscolhido;
  String? anoEscolhido;
  Animal _character = Animal.cachorro;
  String? idadeCalculada;
  int? indexMesEscolhido;

  final List listMeses = [
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final int anoAtual = new DateTime.now().year;
    final List listAnos = new List<String>.generate(
        anoAtual - 1999, (index) => (2000 + index).toString());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 114, 146, 207),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: EdgeInsets.only(right: width * 0.15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                " Idade animal",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Image.asset('images/Dog-swimming.png', scale: 10),
            ],
          ),
        ),
        Container(
          width: width,
          height: height * 0.8,
          padding: EdgeInsets.zero,
          child: Card(
              color: Color.fromARGB(255, 245, 246, 252),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              margin: EdgeInsets.zero,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Divider(color: Colors.transparent, height: 50),
                    Text(
                      "Selecione a data de Nascimento do seu pet",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Divider(color: Colors.transparent, height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton(
                          hint: Text(
                            "MM",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          value: mesEscolhido,
                          onChanged: (newValue) {
                            setState(() {
                              mesEscolhido = newValue.toString();
                              for (int i = 0; i < 12; i++) {
                                if (listMeses[i] == newValue.toString()) {
                                  indexMesEscolhido = i + 1;
                                }
                              }
                            });
                          },
                          items: listMeses.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                        DropdownButton(
                          hint: Text(
                            "AAAA",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          value: anoEscolhido,
                          onChanged: (newValue) {
                            setState(() {
                              anoEscolhido = newValue.toString();
                            });
                          },
                          items: listAnos.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Divider(color: Colors.transparent, height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: Animal.cachorro,
                              groupValue: _character,
                              onChanged: (Animal? value) {
                                setState(() {
                                  _character = value!;
                                });
                              },
                            ),
                            Text(
                              "Cachorro",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: Animal.gato,
                              groupValue: _character,
                              onChanged: (Animal? value) {
                                setState(() {
                                  _character = value!;
                                });
                              },
                            ),
                            Text(
                              "Gato",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(color: Colors.transparent, height: 50),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 150, 177, 229)),
                          elevation: MaterialStateProperty.all(2),
                        ),
                        onPressed: () {
                          setState(() {
                            if (indexMesEscolhido == null ||
                                anoEscolhido == null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Preencha os dados obrigatórios!"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 4),
                              ));
                            } else {
                              idadeCalculada = FuncaoCalculo(_character,
                                  indexMesEscolhido!, int.parse(anoEscolhido!));
                            }
                          });
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        )),
                    Divider(color: Colors.transparent, height: 50),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                          idadeCalculada == null
                              ? ""
                              : idadeCalculada! + " Anos!!",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87)),
                    ),
                    Divider(color: Colors.transparent, height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('images/Dog-newspaper.png', scale: 10),
                        Image.asset('images/Cat.png', scale: 10)
                      ],
                    )
                  ],
                ),
              )),
        ),
      ]),
    );
  }
}
