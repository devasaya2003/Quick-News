import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final String imageUrl;
  final String? date;

  const NewsWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Tapped on item');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(-6, 7),
              blurRadius: 2,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              // child: Image.network(
              //   imageUrl ?? 'https://via.placeholder.com/150',
              //   height: 100,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    'assets/Quick News.png',
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title ?? 'Title',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description ?? 'Description',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
