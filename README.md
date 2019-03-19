# figures
Draw some figures(with description)

- How to generate the png file?
Install graphviz, then run
```sh
dot -Tpng test1.gv > test1.png
```
__NOTE__

The subgraph's name has to start with "cluster", otherwise it wont work as expected.
