---
layout: post
title:  "关于build failed"
date:   2018-06-10 9:45:00 +0800
tags: [Cursor]
categories: [post]
---

### 1、build failed

从昨天晚上到现在提交了不下于10次，

然而我收到了不下于 10次 Build Failed 邮件，

嗯，检查了下代码，发现前两天删除了一个 _include 

里的一个文件 _duoshuo.html

但是没有把引用它的地方给删除，因此就出现了这个错误。

