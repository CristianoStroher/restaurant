import 'package:flutter/material.dart';
import 'package:restaurant/components/main_drawer.dart';
import 'package:restaurant/models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Function(Settings) onSettingsChanged;

  const SettingsScreen({ super.key, required this.onSettingsChanged });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  var settings = Settings();

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