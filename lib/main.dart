import 'package:flutter/material.dart';

void main() => runApp(
    const MyApp()); //com const o Widget não é recriado toda vez que a tela é alterada

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key}); //diz ao flutter que vai usar o mesmo construtor da classe super

  @override
  Widget build(BuildContext context) {
    
    /*=============================== Título ================================*/

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      //linha com 3 filhos: texto, ícone, texto
      child: Row(children: [
        Expanded(
          //espaça os elementos em todo o espaço disponível
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                //usado para definir medidas como padding
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'UNIFENAS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Alfenas - MG',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /*3*/
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        const Text('Nota 5 no MEC'),
      ]),
    );

/*===================================Botões=================================*/
    Color color = Theme.of(context).primaryColor; // define a cor dos botões
    //uma linha com 3 colunas. Cada coluna contém um ícone e um texto descritivo
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CHAMAR'),
        _buildButtonColumn(color, Icons.near_me, 'COMO CHEGAR'),
        _buildButtonColumn(color, Icons.share, 'COMPARTILHAR'),
      ],
    );

    /*===============================Texto================================= */

    const Widget textSection = Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'A UNIFENAS é uma Universidade privada, localizada na cidade '
        'de Alfenas - MG. A Universidade oferece cursos presenciais e EAD em '
        'todas as áreas de conheciemnto, incluindo graduação e pós-graduação. '
        'Está entre as 10 melhores Universidades privadas do Brasil, sendo a '
        'primeira em Minas Gerais, de acordo com avaliação do Ministério da '
        'Educação. A UNIFENAS completou, em 2022, 50 anos de existência.',
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemplo de Layout',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Layout"),
        ),
        body: ListView( //container para rolagem da tela
          children: [
            Image.asset('images/unifenas.jpg',
                width: 600, height: 400, fit: BoxFit.cover),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }
}

/*====================Função para Construir Botões=========================*/

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}
