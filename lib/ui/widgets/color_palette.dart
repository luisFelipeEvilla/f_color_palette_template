import 'package:flutter/material.dart';
import '../../utils/color_utils.dart';

class ColorPalette extends StatefulWidget {
  const ColorPalette(
      {Key? key,
      // así se reciben en el constructor, por ejemplo
      //required this.baseColor,

      required this.baseColor,
      required this.baseColor1,
      required this.baseColor2,
      required this.callback})
      : super(key: key);

  final String baseColor;
  final String baseColor1;
  final String baseColor2;

  final Function(String) callback;
  // atributos de la clase, por ejemplo
  //final String baseColor;

  // también se puede tener como un atributo un callback, necesiario ya que es un
  // widget sin estado, por ejemplo
  //final Function(String) callback;

  @override
  State<ColorPalette> createState() => _ColorPalette();
}

class _ColorPalette extends State<ColorPalette> {
  int flex = 2, flex1 = 2, flex2 = 2;

  @override
  Widget build(BuildContext context) {
    // padding para crear espacio alrededor del widget
    return Padding(
        padding: const EdgeInsets.all(8.0),
        // vamos a mostrar los elementos en un row
        child: Row(
          children: [
            Expanded(
                flex: flex,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        flex = 6;
                        flex1 = 2;
                        flex2 = 2;
                      });
                      widget.callback(widget.baseColor);
                    },
                    child: Container(
                        height: 100,
                        color: ColorUtils.FromHex(widget.baseColor)))),
            Expanded(
                flex: flex1,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        flex = 2;
                        flex1 = 2;
                        flex2 = 6;
                      });
                      widget.callback(widget.baseColor1);
                    },
                    child: Container(
                        height: 100,
                        color: ColorUtils.FromHex(widget.baseColor1)))),
            Expanded(
                flex: flex2,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        flex = 2;
                        flex1 = 2;
                        flex2 = 6;
                      });
                      widget.callback(widget.baseColor1);
                    },
                    child: Container(
                        height: 100,
                        color: ColorUtils.FromHex(widget.baseColor2))))
          ],
        ));
  }
}
