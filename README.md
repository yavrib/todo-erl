# todo_list
Here's how to create a to do list (as I do, works on my machine.)

```sh
$ cd todo_list
$ rebar3 shell
# Beam starts
FirstIteration = todolist:todolist({create_list}).
SecondIteration = todolist:todolist({add_item, FirstIteration, "Hello world"}).
ThirdIteration = todolist:todolist({add_item, SecondIteration, "Hello world2"}).
FourthIteration = todolist:todolist({add_item, ThirdIteration, "Hello world3"}).
FifthIteration = todolist:todolist({add_item, FourthIteration, "Hello world3"}).
SixthIteration = todolist:todolist({remove_item, FourthIteration, 3}).
SeventhIteration = todolist:todolist({toggle_done, SixthIteration}).
EighthIteration = todolist:todolist({toggle_undone, SeventhIteration}).
NinethIteration = todolist:todolist({toggle_status, EighthIteration, 1}).
# You need to keep your list until I find a solution to keep it for you!
```
