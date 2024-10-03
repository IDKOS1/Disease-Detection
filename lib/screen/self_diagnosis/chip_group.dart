import 'package:flutter/material.dart';

class ChipGroup extends StatefulWidget {
  final List<String> options;

  const ChipGroup({required this.options, super.key});

  @override
  State<ChipGroup> createState() => _ChipGroupState();
}

class _ChipGroupState extends State<ChipGroup> {
  List<String> selectedChoices = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // 칩 사이의 가로 간격
      runSpacing: 4.0, // 칩 사이의 세로 간격
      children: widget.options.map((option) {
        final isSelected = selectedChoices.contains(option);
        final isFirstChip = widget.options.indexOf(option) == 0;

        return ChoiceChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (isFirstChip && selected) {
                // 첫 번째 칩이 선택된 경우, 모든 칩들의 선택을 해제하고 첫 번째 칩만 선택
                selectedChoices.clear();
                selectedChoices.add(option);
              } else if (!isFirstChip && selectedChoices.contains(widget.options[0])) {
                // 첫 번째 칩이 선택된 상태에서 다른 칩을 선택하려고 하면 첫 번째 칩 선택 해제
                selectedChoices.remove(widget.options[0]);
                if (selected) {
                  selectedChoices.add(option);
                } else {
                  selectedChoices.remove(option);
                }
              } else {
                // 일반적인 다중 선택 동작 (첫 번째 칩이 선택되지 않은 상태에서 다중 선택 가능)
                if (selected) {
                  selectedChoices.add(option);
                } else {
                  selectedChoices.remove(option);
                }
              }
            });
          },
          selectedColor: Colors.blue, // 선택된 칩의 색상
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ), // 텍스트 색상 변경
        );
      }).toList(),
    );
  }
}