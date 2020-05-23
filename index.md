---
layout: page
title: code2line!
tagline: 爱生活爱自己
keywords: youngniu, codeniu, 分享
description: code2line,
categories: [index]
---

{% include codepiano/setup %}

## 个人信息

    title : code2line
    author :codeniu
    name : niuniuniu
    email : jingxiangniu@gmail.com
    github : Codeniu
    twitter : youngniu

## 文章

<ul class="posts">
  {% for post in site.posts %}
    <li>
    	<span>{{ post.date | date_to_string }}</span> &raquo; 
    	<a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
