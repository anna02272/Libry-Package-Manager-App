import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internship_2024_app/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_internship_2024_app/keys.dart';

class SearchInput extends StatefulWidget {
  final ValueChanged<String>? onTextChanged;
  const SearchInput({super.key, this.onTextChanged});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _controller = TextEditingController();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller.clear();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 400,
      height: 60,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.light
            ? const Color.fromRGBO(239, 245, 243, 1)
            : const Color.fromARGB(255, 33, 35, 33),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                key: K.searchInputField,
                autofocus: true,
                controller: _controller,
                focusNode: _focusNode,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (text) {
                  if (widget.onTextChanged != null) {
                    widget.onTextChanged!(text);
                  }
                },
                onSubmitted: (searchText) {
                  _submitSearch(context, searchText);
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                _controller.clear();
                context.read<SearchBloc>().add(ResetSearch());
                _focusNode.unfocus();
              },
              child: Icon(
                key: K.removeBtn,
                Icons.close,
                color: theme.colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitSearch(BuildContext context, String searchText) {
    if (searchText.isNotEmpty) {
      context.read<SearchBloc>().add(LibrariesSearched(searchText, "rank", 1));
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
