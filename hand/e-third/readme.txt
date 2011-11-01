http://home.so-net.net.tw/tzuyichao/maven/memo.antlr.project.html
mvn exec:java -Dexec.mainClass=net.greenrivers.antlr.Main

mvn archetype:generate

选择 63


針對每一個rule透過operator設定產生AST的部份（這裡用了書上寫的Constructing ASTs Using Operators和Constructing ASTs with Rewrite Rules）。
看到->就是Constructing ASTs with Rewrite Rules；Constructing ASTs Using Operators的話則是透過兩個operator來設定，^表示這個token會是
subtree的root node，!則表示該token不需要放到node或subtree裡面。
