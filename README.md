# mpv-change-osc-switcher
## 前言：

之前和大佬[hooke007](https://github.com/hooke007)交流的时候,就提到过模式切换的脚本.
本人喜欢折腾,就写出了此脚本🤣UOSC用久了可以尝试换下口味.可配合[懒人包](https://github.com/hooke007/MPV_lazy/releases/download/)使用.

---

## 目录

- [设计思路](#设计思路)
- [批处理脚本介绍](#Batch脚本介绍)
    - [脚本用法](#脚本用法)
    - [Batch代码](#Batch代码)
    - [脚本须知](#脚本须知)
- [MPV配置](#MPV配置) 
    - [input配置](#input_osc_p.conf配置)
    - [下载地址](#下载地址)

---

## 设计思路:

处理过程并不复杂,首次使用会进行初始化,并切换到OSC_PLUS模式,之后再运行该脚本会在两个模式间互切.
![Xmind](https://github.com/hooke007/MPV_lazy/assets/104602119/8333da24-7449-4fe0-93ab-57c86f153583)


---

## Batch脚本介绍:

使用批处理脚本,主要是利用写入和挪动功能实现[不更改当前模式配置]的前提下,快速又丝滑地切换到另一个模式.

---

### **脚本用法**:

解压覆盖到[mpv-lazy]目录中,双击[installer]目录下的`mpv-切换osc.bat`即可切换,

OSC_PLUS效果:
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

对配置文件进行了少量修改,仅展示input_osc_p.conf方便查看.

1. OSC_PLUS模式下[ontextmenu_gui]的main.lua,配套的input_osc_p.conf和script-opts.conf
2. UOSC模式下的input_uosc.conf,为了使两模式下的滤镜和着色器的快捷键相同,降低学习成本.

---

### **input_osc_p.conf配置**：  

```
 # 绑定右键菜单
 MOUSE_BTN2 	   script-message-to contextmenu_gui contextmenu_tk
 # 用windows文件浏览器,打开文件
 w                 script-binding load_plus/import_files
 W                 script-binding load_plus/import_files
 # 播放剪切板内容[本地文件路径或网页链接]
 Ctrl+v            script-binding input_plus/load_cbd
 Ctrl+V            script-binding input_plus/load_cbd
 # 将剪切板内容加载到播放列表中
 Alt+v             script-binding input_plus/load_cbd_add
 Alt+V             script-binding input_plus/load_cbd_add
 # 打开播放列表
 Shift+l  	   script-binding playlist_osd/display
 Shift+L  	   script-binding playlist_osd/display
 # 播放器常规操作
 Alt+q             quit
 Alt+Q             quit
 Ctrl+Alt+SPACE    stop
 ESC               set fullscreen no
 ENTER             cycle fullscreen
 SPACE             cycle pause
 LEFT              seek -1 exact
 RIGHT             seek  1 exact  
 Ctrl+UP           playlist-prev
 Ctrl+DOWN         playlist-next
 MBTN_LEFT_DBL     cycle fullscreen
 UP                add volume  1
 DOWN              add volume -1
 Wheel_UP          add volume  1
 Wheel_DOWN        add volume -1
 # 播放速度调整,每次改变0.05倍
 -                 add speed -0.05
 =                 add speed  0.05
 # 重新播放
 Shift+r           seek 0 absolute
 Shift+R           seek 0 absolute
 # 打开控制台
 `                 script-binding console/enable
 # 查看当前播放信息，可按1/2/3/4/0切换分页
 i                 script-binding display-stats-toggle
 I                 script-binding display-stats-toggle
 # 上一帧与下一帧
 d                 frame-back-step
 D                 frame-back-step
 f                 frame-step
 F                 frame-step
 # 音频同步 预载100ms
 c                 add audio-delay -0.1
 C                 add audio-delay -0.1
 # 音频同步 延迟100ms
 v                 add audio-delay  0.1
 V                 add audio-delay  0.1
 # 字幕同步 预载100ms
 z                 add sub-delay -0.1
 Z                 add sub-delay -0.1
 # 字幕同步 延迟100ms
 x                 add sub-delay +0.1
 X                 add sub-delay +0.1
 # 截屏（有字幕、有OSD） 输出原始分辨率
 s                 screenshot
 # 截屏（无字幕、无OSD） 输出原始分辨率
 S                 screenshot video
 # 截屏（有字幕、有OSD） 输出实际分辨率
 Ctrl+s            screenshot window
 # 对比度 -
 1                 add contrast -1
 # 对比度 +
 2                 add contrast 1
 # 亮度/明度 -
 3                 add brightness -1
 # 亮度/明度 +
 4                 add brightness 1
 # 伽马 -
 5                 add gamma -1
 # 伽马 +
 6                 add gamma 1
 # 饱和度/纯度 -
 7                 add saturation -1
 # 饱和度/纯度 +
 8                 add saturation 1
 # 色相 -
 9                 add hue -1
 # 色相 +
 0                 add hue 1

 # 滤镜 清空
 ~                 show-text "视频滤镜已清空"; no-osd vf clr ""
 # 滤镜 MTV_倍帧
 !                 show-text "MTV_倍帧"; no-osd vf set vapoursynth="~~/vs/MEMC_MVT_LQ.vpy"
 # 滤镜 MTV_60帧
 @                 show-text "MTV_60帧"; no-osd vf set vapoursynth="~~/vs/MEMC_MVT_STD.vpy"
 # 滤镜 SVP_倍帧
 SHARP             show-text "SVP_倍帧"; no-osd vf set vapoursynth="~~/vs/MEMC_SVP_LQ.vpy"
 # 滤镜 SVP_60帧
 $                 show-text "SVP_60帧"; no-osd vf set vapoursynth="~~/vs/MEMC_SVP_PRO.vpy"
 # 滤镜 RIFE_倍帧
 %                 show-text "RIFE_倍帧"; no-osd vf set vapoursynth="~~/vs/MEMC_RIFE_STD.vpy"
 # 滤镜着色器组合:A4K-DTDD + MTV_60帧
 ^                 show-text "A4K-DTDD + MTV_60帧"; no-osd vf set vapoursynth="~~/vs/MEMC_MVT_STD.vpy"; no-osd change-list glsl-shaders set  "~~/shaders/Anime4K_Darken_HQ.glsl;~~/shaders/Anime4K_Thin_HQ.glsl;~~/shaders/Anime4K_Denoise_Bilateral_Mode.glsl;~~/shaders/Anime4K_Deblur_DoG.glsl"
 # 滤镜着色器组合:AA-Fast + SVP_60帧
 &                 show-text "AA-Fast + SVP_60帧"; no-osd vf set vapoursynth="~~/vs/MEMC_SVP_PRO.vpy"; no-osd change-list glsl-shaders set  "~~/shaders/Anime4K_Clamp_Highlights.glsl;~~/shaders/Anime4K_Restore_CNN_M.glsl;~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl;~~/shaders/Anime4K_AutoDownscalePre_x2.glsl;~~/shaders/Anime4K_AutoDownscalePre_x4.glsl;~~/shaders/Anime4K_Upscale_CNN_x2_S.glsl"
 # 滤镜着色器组合:AA-HQ + RIFE_倍帧
 *                 show-text "AA-HQ + RIFE_倍帧"; no-osd vf set vapoursynth="~~/vs/MEMC_RIFE_STD.vpy"; no-osd change-list glsl-shaders set "~~/shaders/Anime4K_Clamp_Highlights.glsl;~~/shaders/Anime4K_Restore_CNN_VL.glsl;~~/shaders/Anime4K_Upscale_CNN_x2_VL.glsl;~~/shaders/Anime4K_Restore_CNN_M.glsl;~~/shaders/Anime4K_AutoDownscalePre_x2.glsl;~~/shaders/Anime4K_AutoDownscalePre_x4.glsl;~~/shaders/Anime4K_Upscale_CNN_x2_M.glsl"

 # 着色器 清空
 Ctrl+`            show-text "着色器已清空"; no-osd change-list glsl-shaders clr ""
 # 着色器 Krig
 Ctrl+1            show-text "Krig"; no-osd change-list glsl-shaders toggle "~~/shaders/KrigBilateral.glsl"
 # 着色器 AMD_FSR
 Ctrl+2            show-text "AMD_FSR"; no-osd change-list glsl-shaders toggle "~~/shaders/AMD_FSR_rgb.glsl"
 # 着色器 Ravu_zoom
 Ctrl+3            show-text "Ravu_zoom"; no-osd change-list glsl-shaders toggle "~~/shaders/ravu_zoom_r2.glsl"
 # 着色器 A4K_重建_CNN_M
 Ctrl+4            show-text "A4K_重建_CNN_M"; no-osd change-list glsl-shaders toggle "~~/shaders/Anime4K_Restore_CNN_M.glsl"
 # 着色器 A4K_放大_GAN_M
 Ctrl+5            show-text "A4K_放大_GAN_M"; no-osd change-list glsl-shaders toggle "~~/shaders/Anime4K_Upscale_GAN_x2_M.glsl"
 # 着色器 FSRCNNX_16
 Ctrl+6            show-text "FSRCNNX_16"; no-osd change-list glsl-shaders toggle "~~/shaders/FSRCNNX_x2_16_0_4_1.glsl"
 # 着色器 自适应锐化_后
 Ctrl+7            show-text "自适应锐化_后"; no-osd change-list glsl-shaders toggle "~~/shaders/adaptive_sharpen.glsl"
 # 着色器 nneid3_128_8x4
 Ctrl+8            show-text "nneid3_128_8x4"; no-osd change-list glsl-shaders toggle "~~/shaders/nnedi3_nns128_win8x4.glsl"
 # 着色器 Anime4k[DTDD]组合
 Ctrl+9            show-text "Anime4k[DTDD]组合"; no-osd change-list glsl-shaders toggle "~~/shaders/Anime4K_Darken_HQ.glsl;~~/shaders/Anime4K_Thin_HQ.glsl;~~/shaders/Anime4K_Denoise_Bilateral_Mode.glsl;~~/shaders/Anime4K_Deblur_DoG.glsl"
 # 着色器 双SSIM组合
 Ctrl+0            show-text "双SSIM组合"; no-osd change-list glsl-shaders toggle "~~/shaders/SSimSuperRes.glsl;~~/shaders/SSimDownscaler.glsl"
```
---

### **下载地址**:

[mpv-lazy.zip](https://github.com/hooke007/MPV_lazy/files/11612460/mpv-lazy.zip)
希望脚本能助力使用MPV更加便捷.😊
