import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = "ui_controls_screen";

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

// Enumeración para crear propiedad
enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true; //Valor que se asigna al Switch
  Transportation selectedTransportation = Transportation.car; //Selección por defecto
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        //Agrega un botón tipo "switch"
        SwitchListTile(
            title: Text("Developer mode"),
            subtitle: const Text("Controles adicionales"),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper =
                      !isDeveloper; //Se asigna el valor opuesto al inicial
                })),


        ExpansionTile(
          title: const Text("Vehiculo de transporte"),
          subtitle: Text("$selectedTransportation"),
          children: [
            // SI ES NECESARIO CAPTURAR EL VALOR, SIMPLEMENTE
            // SE SELECCIONA O DEVUELVE LA VARIABLE "SELECTEDTRANSPORTATION"

            RadioListTile(
              title: const Text("By car"),
              subtitle: const Text("Viajar por carro"),
              value: Transportation.car,
              groupValue: selectedTransportation, //Marca la opción seleccionada
              onChanged: (value) => setState(() {
                // setState crea el wdiget en tiempo real
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text("By boat"),
              subtitle: const Text("Viajar por barco"),
              value: Transportation.boat,
              groupValue: selectedTransportation, //Marca la opción seleccionada
              onChanged: (value) => setState(() {
                // setState crea el wdiget en tiempo real
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text("By plane"),
              subtitle: const Text("Viajar por avión"),
              value: Transportation.plane,
              groupValue: selectedTransportation, //Marca la opción seleccionada
              onChanged: (value) => setState(() {
                // setState crea el wdiget en tiempo real
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text("By submarine"),
              subtitle: const Text("Viajar por submarino alv"),
              value: Transportation.submarine,
              groupValue: selectedTransportation, //Marca la opción seleccionada
              onChanged: (value) => setState(() {
                // setState crea el wdiget en tiempo real
                selectedTransportation = Transportation.submarine;
              }),
            ), 
          ],
        ),
      
        // TODO: por aquí xdxd
        CheckboxListTile(
          title: const Text("¿Desayuno? "),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text("Almuerzo? "),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text("Cena? "),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),

      ],
    );
  }
}
