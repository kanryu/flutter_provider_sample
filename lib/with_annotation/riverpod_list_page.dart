import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:english_words/english_words.dart';

import '../model/todo.dart';

part 'riverpod_list_page.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    final wordPair = WordPair.random();
    return [Todo(id: 1, content: wordPair.asPascalCase, completed: false)];
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(int id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void toggleCompleted(int id) {
    state = state
        .map((todo) => Todo(
              id: todo.id,
              content: todo.content,
              completed: (id != todo.id) ? todo.completed : !todo.completed,
            ))
        .toList();
  }
}

class RiverpodListPage extends ConsumerWidget {
  RiverpodListPage({Key? key, required this.title}) : super(key: key);
  final todoContentTextController = TextEditingController();
  final todoContentTextFocusNode = FocusNode();
  static const pageName = 'Riverpod Todo List with annotations Page';
  static const routeName = '/with_annotation/riverpod_list_page';
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TodoListProvider
    List<Todo> todoList = ref.watch(todoListProvider);

    // 追加ボタン押下
    onPressedAddButton() {
      String content = todoContentTextController.text;
      todoContentTextController.clear();
      final wordPair = WordPair.random();
      content = content.isEmpty ? wordPair.asPascalCase : content;

      // 新規TodoアイテムのidはListの最後の要素のid+1とする。ただし、空の場合は1とする。
      int id = (todoList.isEmpty) ? 1 : todoList.last.id + 1;

      // 新規Todoアイテム
      Todo todo = Todo(
        id: id,
        content: content,
        completed: false,
      );

      ref.read(todoListProvider.notifier).addTodo(todo);

      // Todoリストを追加したあと、TextFieldにFocusを移動
      FocusScope.of(context).requestFocus(todoContentTextFocusNode);
    }

    // 削除ボタン押下
    onPressedDeleteButton(int index) {
      ref.read(todoListProvider.notifier).removeTodo(todoList[index].id);
    }

    // 切替ボタン押下
    onPressedToggleButton(int index) {
      ref.read(todoListProvider.notifier).toggleCompleted(todoList[index].id);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: todoContentTextController,
                    focusNode: todoContentTextFocusNode,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.face),
                        hintText: 'Input title of the new todo'),
                  ),
                ),
                ElevatedButton(
                  onPressed: onPressedAddButton,
                  child: const Text('add a todo'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Text(todoList[index].id.toString()),
                      const SizedBox(width: 20),
                      Text(todoList[index].content),
                      const SizedBox(width: 20),
                      Text(todoList[index].completed.toString()),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () => onPressedDeleteButton(index),
                        child: const Text('delete'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () => onPressedToggleButton(index),
                        child: const Text('change status'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
