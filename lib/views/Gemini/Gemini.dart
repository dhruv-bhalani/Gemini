import 'package:flutter/material.dart';
import 'package:gemini/views/Gemini/gemini_provider.dart';
import 'package:provider/provider.dart';

class Gemini extends StatefulWidget {
  const Gemini({super.key});

  @override
  State<Gemini> createState() => _GeminiState();
}

class _GeminiState extends State<Gemini> {
  late GeminiProvider geminiProviderR;
  late GeminiProvider geminiProviderW;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    geminiProviderW = context.watch<GeminiProvider>();
    geminiProviderR = context.read<GeminiProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(16),
          child: Image(image: AssetImage('assets/gemini.png'), height: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: context.watch<ChatGptProvider>().getList.length,
            //     itemBuilder: (context, index) {
            //       return Container(
            //         padding: const EdgeInsets.all(8),
            //         margin: const EdgeInsets.all(8),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           boxShadow: const [
            //             BoxShadow(
            //               color: Colors.grey,
            //               offset: Offset(0, 3),
            //               blurRadius: 5,
            //             ),
            //           ],
            //           gradient: const LinearGradient(
            //             begin: Alignment.topLeft,
            //             end: Alignment.bottomRight,
            //             colors: [
            //               Colors.purple,
            //               Colors.pink,
            //             ],
            //           ),
            //         ),
            //         child: Center(
            //           child: Text(
            //             context.watch<ChatGptProvider>().getList[index],
            //             style: const TextStyle(color: Colors.white),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<GeminiProvider>().postList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // boxShadow: [
                            //   BoxShadow(
                            //     // color: Colors.primaries
                            //     //     .elementAt(index % Colors.primaries.length),
                            //     color: Colors
                            //         .accents[index % Colors.accents.length],
                            //     offset: const Offset(0, 3),
                            //     blurRadius: 5,
                            //   ),
                            // ],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            context.watch<GeminiProvider>().postList[index],
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  geminiProviderW
                                      .speak(geminiProviderW.getList[index]);
                                },
                                icon: const Icon(Icons.volume_up_outlined),
                              ),
                              Text(
                                context.watch<GeminiProvider>().getList[index],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: (val) {
                      controller.text = val;
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: 'Hello Gemini ',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<GeminiProvider>().sendText = controller.text;
                    context.read<GeminiProvider>().getApi();
                    controller.clear();
                  },
                  color: Colors.black54,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
