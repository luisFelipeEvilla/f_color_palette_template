import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../utils/color_utils.dart';
import '../widgets/color_palette.dart';

class ColorSelectionPage extends StatelessWidget {
  const ColorSelectionPage({Key? key}) : super(key: key);

  void showDialog() {
    Get.dialog(const AlertDialog(
      title: Text('Flutter'),
      content: Text('Dialog'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Color palette app'),
          backgroundColor: ColorUtils.FromHex('#277BC0'),
          actions: [
            IconButton(onPressed: showDialog, icon: Icon(Icons.info_outline))
          ],
        ),
        // https://colorhunt.co/
        body: (SingleChildScrollView(
          child: Column(
            children: [
              ColorPalette(
                baseColor: '#F65A83',
                baseColor1: '#FF87B2',
                baseColor2: '#FFE898',
                callback: showColor,
              ),
              ColorPalette(
                baseColor: '#F37878',
                baseColor1: '#FAD9A1',
                baseColor2: '#D9F8C4',
                callback: showColor,
              ),
              ColorPalette(
                baseColor: '#6E85B7',
                baseColor1: '#B2C8DF',
                baseColor2: '#C4D7E0',
                callback: showColor,
              ),
              ColorPalette(
                baseColor: '#898AA6',
                baseColor1: '#C9BBCF',
                baseColor2: '#B7D3DF',
                callback: showColor,
              ),
              ColorPalette(
                baseColor: '#66BFBF',
                baseColor1: '#EAF6F6',
                baseColor2: '#FFFFFF',
                callback: showColor,
              )
            ],
          ),
        )));
  }

  // está es la función que será llamada con cada click a un ColorPalette
  void showColor(String value) {
    Clipboard.setData(ClipboardData(text: value));
    Get.snackbar(
      'Color palette',
      'Valor copiado',
      backgroundColor: ColorUtils.FromHex(value),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
