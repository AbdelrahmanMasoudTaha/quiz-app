import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Summery extends StatelessWidget {
  const Summery({super.key, required this.summeryData});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox( height: 480,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summeryData.map((e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(

                    backgroundColor: e['user_answer'] == e['answer']
                        ? const Color(0xc757e869)
                        : const Color(0xc8f64172),
                    foregroundColor: Colors.white,
                    radius: 16,
                    child: Text(
                      ((e['question_index'] as int) + 1).toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e['question'].toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xAFFFFFFF),
                          ),
                        ),
                        Text(
                          e['user_answer'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFCABFF1),
                          ),
                        ),
                        Text(
                          e['answer'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF003CD4),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
