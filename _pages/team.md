---
title: "CHEST-Lab - Team"
layout: gridlay
excerpt: "CHEST-Lab: Team members"
sitemap: false
permalink: /team/
---

# Group Members

**We are  looking for new PhD students, Postdocs, and Master students to join the team** [(see openings)]({{ site.url }}{{ site.baseurl }}/vacancies) **!**


Jump to [staff](#staff), [master and bachelor students](#master-and-bachelor-students), [alumni](#alumni), [lab visitors](#lab-visitors).

## Staff
{% assign number_printed = 0 %}
{% for member in site.data.team_members %}

{% assign even_odd = number_printed | modulo: 2 %}

{% if even_odd == 0 %}
<div class="row">
{% endif %}

<div class="col-sm-6 clearfix" style="text-align: left;">
  {% if member.photo != "" %}
  <img src="{{ site.url }}{{ site.baseurl }}/images/teampic/{{ member.photo }}" class="img-responsive" width="25%" style="float: left" />
  {% endif %}  
  <h4>{{ member.name }}</h4>
  <i>{{ member.info }}<br>email: <{{ member.email }}></i>
  <ul style="overflow: hidden">

  {% if member.number_educ == 1 %}
  <li> {{ member.education1 }} </li>
  {% endif %}

  {% if member.number_educ == 2 %}
  <li> {{ member.education1 }} </li>
  <li> {{ member.education2 }} </li>
  {% endif %}

  {% if member.number_educ == 3 %}
  <li> {{ member.education1 }} </li>
  <li> {{ member.education2 }} </li>
  <li> {{ member.education3 }} </li>
  {% endif %}

  {% if member.number_educ == 4 %}
  <li> {{ member.education1 }} </li>
  <li> {{ member.education2 }} </li>
  <li> {{ member.education3 }} </li>
  <li> {{ member.education4 }} </li>
  {% endif %}

  {% if member.number_educ == 5 %}
  <li> {{ member.education1 }} </li>
  <li> {{ member.education2 }} </li>
  <li> {{ member.education3 }} </li>
  <li> {{ member.education4 }} </li>
  <li> {{ member.education5 }} </li>
  {% endif %}

  </ul>
</div>

{% assign number_printed = number_printed | plus: 1 %}

{% if even_odd == 1 %}
</div>
{% endif %}

{% endfor %}

{% assign even_odd = number_printed | modulo: 2 %}
{% if even_odd == 1 %}
</div>
{% endif %}



## Thesis Students
<style>
	th, td {
	  padding-left: 26px;
	  padding-right: 26px;
	}
</style>

<table style="width:100%; text-align: left;">
  <tr>
    <th style="width:50%">Master students</th>
    <th>Bachelor Students</th>
  </tr>
  <tr>
	<td>
		{% for member in site.data.alumni_msc %}
		{{ member.name }}, {{ member.year }}<br>
		<i>{{ member.thesis }}</i><br><br>
		{% endfor %}
	</td>
	<td>
		{% for member in site.data.alumni_bsc %}
		{{ member.name }}, {{ member.year }}<br>
		<i>{{ member.thesis }}</i><br><br>
		{% endfor %}
	</td>
  </tr>
</table>