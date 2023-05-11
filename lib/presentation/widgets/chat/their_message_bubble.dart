import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class TheirMessageBubble extends StatelessWidget {
  const TheirMessageBubble({
    required this.message,
    super.key
  });

  final Message message;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.secondary
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle(color: Colors.white)),
          )
        ),

        const SizedBox(height: 10),

        _ImageBubble(imageUrl: message.imageUrl!),

        const SizedBox(height: 10),

      ]
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({ 
    required this.imageUrl
  });

  final String imageUrl;


  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: size.width * 0.7,
            height: 150,
            child: const Center(child: CircularProgressIndicator())
          );
        }
      )
    );
  }
}