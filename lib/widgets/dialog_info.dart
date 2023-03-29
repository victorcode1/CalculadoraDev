import 'package:calculadora_1/responsive.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDialog {
  void mostrarDialogo(BuildContext? ctx) {
    showDialog(
        context: ctx!,
        builder: (_) {
          return Dialog(
              elevation: 5,
              backgroundColor: Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              clipBehavior: Clip.antiAlias, //  add clipBehavior
              child: SizedBox(
                  height: MediaQuery.of(ctx).size.height / 1.8,
                  child: const DialogInfo()));
        });
  }
}

class DialogInfo extends StatelessWidget {
  const DialogInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey[900],
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              child: const Center(
                child: Text('Victor Flores',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: CircleAvatar(
                      radius: 50, // Personalice el tamaño del avatar aquí
                      backgroundColor: Colors.grey[
                          200], // Personalice el color de fondo del avatar aquí
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://www.itmplatform.com/wp-content/uploads/33664005_m-300x300.jpg', // URL de la imagen de Internet aquí
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(), // Personalice el indicador de carga aquí
                          errorWidget: (context, url, error) => const Icon(Icons
                              .error), // Personalice el widget de error aquí
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      'Como desarrollador de aplicaciones móviles en Flutter junior, tengo experiencia en la creación de aplicaciones móviles para Android y iOS utilizando el lenguaje de programación Dart. Tengo conocimientos básicos en el uso de Flutter para el diseño y desarrollo de interfaces de usuario atractivas y dinámicas.',
                      maxLines: 25,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: Responsive.isPhone(context) ? 18 : 25,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: IconButton(
                    padding: const EdgeInsets.only(left: 20),
                    icon: const Icon(Icons.code, color: Colors.white, size: 35),
                    onPressed: () async {
                      final Uri url =
                          Uri.parse('https://github.com/victorcode1');
                      _launchInBrowser(url);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: IconButton(
                    padding: const EdgeInsets.only(left: 20),
                    icon:
                        const Icon(Icons.phone, color: Colors.white, size: 35),
                    onPressed: () async {
                      final Uri url =
                          Uri.parse('https://wa.me/message/AIIXIUGVS24JO1');
                      _launchInBrowser(url);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
                color: Colors.grey[900],
                height: 50,
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'ok',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
