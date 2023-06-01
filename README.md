# MPV-Change-OSC-Switcher
## 前言：

之前和大佬[hooke007](https://github.com/hooke007)交流的时候,就提到过OSC模式切换.

UOSC用久了可以尝试换下口味,本人喜欢折腾,就写出了此脚本.🤣可配合[懒人包](https://github.com/hooke007/MPV_lazy/releases/download/)使用.

---

## 目录

- [设计思路](#设计思路)
- [批处理脚本介绍](#Batch脚本介绍)
    - [脚本用法](#脚本用法)
    - [Batch代码](#Batch代码)
    - [脚本须知](#脚本须知)
- [MPV配置](#MPV配置) 
    - [OSC_Plus快捷键](#OSC_Plus快捷键)
    - [下载地址](#下载地址)

---

## 设计思路:

处理过程并不复杂,首次使用会进行初始化,并切换到OSC_Plus模式,之后再运行该脚本会在两个模式间互切.
![Xmind](https://github.com/hooke007/MPV_lazy/assets/104602119/8333da24-7449-4fe0-93ab-57c86f153583)


---

## Batch脚本介绍:

使用批处理脚本,主要是利用写入和挪动功能实现[不更改当前模式配置]的前提下,快速又丝滑地切换到另一个模式.

---

### **脚本用法**:

解压覆盖到[mpv-lazy]目录中,双击[installer]目录下的`mpv-切换osc.bat`即可切换,

OSC_Plus效果:
![osc_plus](https://github.com/hooke007/MPV_lazy/assets/104602119/f46a49ae-ba23-4ac2-957e-3a8c7ab57783)

主要文件:
![Mian](https://github.com/hooke007/MPV_lazy/assets/104602119/a06eb29f-0e4c-41b4-bf37-e73404765938)

---

### **Batch代码**:


[mpv-切换osc.bat](https://github.com/sunjanesy/mpv-change-osc-switcher/tree/main/installer/mpv-%E5%88%87%E6%8D%A2osc.bat)


### **脚本须知**:

请勿删除[OscBak]文件夹下的文件,避免后续无法正常切换.

快捷键,可以在input*.conf文件里查看.两种模式下,滤镜和着色器的快捷键相同.

---

## MPV配置：

对配置文件进行了少量修改.

1. OSC_Plus模式下[ontextmenu_gui]的main.lua,配套的input_osc_p.conf和script-opts.conf
2. UOSC模式下的input_uosc.conf,为了使两模式下的滤镜和着色器的快捷键相同,降低学习成本.

---

### **OSC_Plus快捷键**：  

建议看看OSC_Plus模式下的快捷键,与UOSC模式有所不

[input_osc_p.conf](https://github.com/sunjanesy/mpv-change-osc-switcher/blob/main/installer/OscBak/portable_config_osc_p/input_osc_p.conf)

---

### **下载地址**:

[mpv-lazy.zip](https://github.com/hooke007/MPV_lazy/files/11612460/mpv-lazy.zip)

希望脚本能助力使用MPV更加便捷.😊
