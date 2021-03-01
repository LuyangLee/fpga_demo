# 文件说明
针对systemVerilog建立的一个项目demo，主要用于FPGA的开发规范示例。

## 文件结构
role    --- 项目的名称，可以定义自己的名字
├--prj  --- vivado工程生成处
├--sim  --- testbench编写文件放置处
└--src  --- verilog/system verilog文件放置处

## 项目建立
使用vscode开发完src文件和仿真文件之后，使用图形界面建立工程，文件夹选择prj，然后把编写好的文件添加到vivado工程里即可。