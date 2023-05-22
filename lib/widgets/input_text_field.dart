import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputTextWidget extends StatefulWidget {
  final TextInputType keyboardType;
  final String placeholderText;
  final bool isSecure;
  final Function(String) onChanged;

  const InputTextWidget({
    super.key,
    required this.keyboardType,
    required this.placeholderText,
    required this.onChanged,
    this.isSecure = false,
  });

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isSecure,
      enableSuggestions: false,
      autocorrect: false,
      textCapitalization: widget.keyboardType == TextInputType.name
          ? TextCapitalization.words
          : TextCapitalization.none,
      textInputAction: TextInputAction.done,
      keyboardType: widget.keyboardType == TextInputType.name
          ? TextInputType.text
          : widget.keyboardType,
      controller: myController,
      onChanged: (value) {
        widget.onChanged(value);
      },
      onTap: () async {
        if (widget.keyboardType == TextInputType.datetime) {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now().add(const Duration(days: -5840)),
            firstDate: DateTime(0),
            lastDate: DateTime.now().add(const Duration(days: -5840)),
          );
          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            setState(() {
              myController.text = formattedDate;
              widget.onChanged(formattedDate);
            });
          } else {}
        }
      },
      decoration: InputDecoration(
          hintText: widget.placeholderText,
          filled: true,
          fillColor: Colors.white,
          suffix: widget.keyboardType == TextInputType.datetime
              ? const Icon(
                  Icons.calendar_month,
                  color: Colors.black,
                  size: 24.0,
                )
              : null,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: Colors.grey),
            borderRadius: BorderRadius.circular(50.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: Colors.grey),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, color: Colors.grey),
            borderRadius: BorderRadius.circular(50.0),
          )),
    );
  }
}
