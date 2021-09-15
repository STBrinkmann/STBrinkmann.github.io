---
title: "CHEST-Lab - Publications"
layout: gridlay
excerpt: "CHEST-Lab -- Publications."
sitemap: false
permalink: /publications/
---


# Publications

## Group highlights2

(For a full list of publications see [below](#full-list-of-publications) or go to [Google Scholar](https://scholar.google.ca/citations?hl=en&user=X-eZF2wAAAAJ&view_op=list_works&sortby=pubdate))

<div class="container">
<div class="row">
{% for publi in site.data.publist %}
{% if publi.highlight == 1 %}
<div class="col-auto">
<div class="col-sm-6 clearfix">
 <div class="well">
  <pubtit>{{ publi.title }}</pubtit>
  <img src="{{ site.url }}{{ site.baseurl }}/images/pubpic/{{ publi.image }}" class="img-responsive" width="33%" style="float: left" />
  <p>{{ publi.description }}</p>
  <p><em>{{ publi.authors }}</em></p>
  <p><strong><a href="{{ publi.link.url }}">{{ publi.link.display }}&nbsp;&#040;{{ publi.year }}&#041;</a></strong></p>
  <p class="text-danger"><strong> {{ publi.news1 }}</strong></p>
  <p> {{ publi.news2 }}</p>
 </div>
</div>
</div>
{% endif %}
{% endfor %}
</div>
</div>


## Full List of publications
{% for this_year in (2020..2021) reversed %}
<h4>{{ this_year }}</h4>
    
{% for publi in site.data.publist %}

{% if publi.year == this_year %}
{{ publi.title }} <br />
<em>{{ publi.authors }} </em><br /><a href="{{ publi.link.url }}">{{ publi.link.display }}</a>
{% endif %}

{% endfor %}

{% endfor %}