import 'package:flutter/material.dart';
import 'package:restaurant/components/main_drawer.dart';
import 'package:restaurant/models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings; // nasce parametro e vive como atrituto para manter o estado das configurações
  final Function(Settings) onSettingsChanged; // (idem acima)parametro que é uma função que recebe as configurações atualizadas como parâmetro

  const SettingsScreen({ super.key, required this.onSettingsChanged, required this.settings });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  
  late Settings settings; // atributo para manter o estado das configurações na tela.
    /* Explicação: Ele é inicializado no initState. Eu não posso inicializar ele diretamente
    com widget.settings porque o widget ainda não está disponível no momento da declaração dos
    atributos.

    Outra coisa importante é que eu uso "late" para indicar que esse atributo será inicializado
    posteriormente, mas antes de ser usado.

    Dessa forma, evito problemas de null safety. eu preciso manter esse atributo separado de
    widget.settings porque eu quero que as mudanças feitas na tela de configurações só sejam
    aplicadas quando o usuário interagir com os switches. Se eu usasse widget.settings
    diretamente, qualquer mudança feita nos switches seria refletida imediatamente
    no objeto original, o que não é o comportamento desejado.
    
    Portanto, uso o método initState para fazer essa inicialização assim que o estado for criado.
    */

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subbtitle,
    bool value,
    Function(bool) onChanged, // função que recebe um bool como parâmetro
  ) {
     return SwitchListTile.adaptive( // SwitchListTile.adaptive se adapta ao sistema operacional
      title: Text(title),
      subtitle: Text(subbtitle),                                                                                                
      value: value,
      onChanged: (value) { // função chamada quando o switch for alterado
        onChanged(value); // atualiza o valor do switch
        widget.onSettingsChanged(settings); // notifica a mudança de configurações
     }, // indiquei o tipo de função esperada
     ); 

  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Configurações'),),
           drawer: MainDrawer(),
           body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Configurações',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _createSwitch(
                      'Sem Glúten',
                      'Apenas exibe refeições sem glúten',
                      settings.isGlutenFree,
                      (value) => setState(() => settings.isGlutenFree = value),
                    ),
                    _createSwitch(
                      'Sem Lactose',
                      'Apenas exibe refeições sem lactose',
                      settings.isLactoseFree,
                      (value) => setState(() => settings.isLactoseFree = value),
                    ),
                    _createSwitch(
                      'Vegana',
                      'Apenas exibe refeições veganas',
                      settings.isVegan,
                      (value) => setState(() => settings.isVegan = value),
                    ),
                    _createSwitch(
                      'Vegetariana',
                      'Apenas exibe refeições vegetarianas',
                      settings.isVegetarian,
                      (value) => setState(() => settings.isVegetarian = value),
                    ),
                  ],
                ),
              )
            ],
           )
       );
  }
}