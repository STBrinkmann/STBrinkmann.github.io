---
title: "CHEST-Lab - Publications"
layout: gridlay
excerpt: "CHEST-Lab -- Publications."
sitemap: false
permalink: /publications/
---

<script type="text/JavaScript">
	var isMobile = window.innerWidth <= 800
	
    window.onload = function(){
		if(isMobile){
        document.getElementById("rowElement").className = "row";		
		}else{
        document.getElementById("rowElement").className = "row row-flex row-flex-wrap";		
		}
    }
</script>
# Publications

## Group highlights

(For a full list of publications see [below](#full-list-of-publications) or go to [Google Scholar](https://scholar.google.ca/citations?hl=en&user=X-eZF2wAAAAJ&view_op=list_works&sortby=pubdate))

{% assign n = 0 %}
{% for publi in site.data.publist %}
{% if publi.highlight == 1 %}
{% assign n = n | plus: 1 %}
{% endif %}
{% endfor %}

{% assign number_printed = 0 %}
{% for i in (1..n) %}

{% for publi in site.data.publist %}
{% assign even_odd = number_printed | modulo: 2 %}
{% if publi.position == i %}

{% if even_odd == 0 %}
<div class="row">
{% endif %}

<div class="col-sm-6 clearfix">
 <div class="well">
  <pubtit>{{ publi.title }}</pubtit>
  <img src="{{ site.url }}{{ site.baseurl }}/images/pubpic/{{ publi.image }}" class="img-responsive" width="33%" style="float: left" />
  <p>{{ publi.description }}</p>
  <p><em>{{ publi.authors }}</em></p>
  <p><strong><a href="{{ publi.link.url }}">{{ publi.link.display }}&nbsp;&#040;{{ publi.year }}&#041;</a></strong></p>
  <p class="text-danger"><strong> {{ publi.news2 }}</strong></p>
 </div>
</div>

{% assign number_printed = number_printed | plus: 1 %}

{% if even_odd == 1 %}
</div>
{% endif %}

{% endif %}
{% endfor %}

{% endfor %}

{% assign even_odd = number_printed | modulo: 2 %}
{% if even_odd == 1 %}
</div>
{% endif %}

<p> &nbsp; </p>

## Full List of publications
{% for this_year in (2018..2021) reversed %}
<h4>{{ this_year }}</h4>
    
{% for publi in site.data.publist %}

{% if publi.year == this_year %}

{% if publi.link.url != "" %}
{{ publi.title }} <br />
<em>{{ publi.authors }} </em><br /><a href="{{ publi.link.url }}">{{ publi.link.display }}</a>
{% endif %}
{% if publi.link.url == "" %}
{{ publi.title }} <br />
<em>{{ publi.authors }} </em><br />{{ publi.link.display }}
{% endif %}

{% endif %}
{% endfor %}

{% endfor %}

#### Before 2018
{% for publi in site.data.publist %}

{% if publi.year < 2018 %}

{% if publi.link.url != "" %}
{{ publi.title }} <br />
<em>{{ publi.authors }} </em><br /><a href="{{ publi.link.url }}">{{ publi.link.display }}</a>
{% endif %}
{% if publi.link.url == "" %}
{{ publi.title }} <br />
<em>{{ publi.authors }} </em><br />{{ publi.link.display }}
{% endif %}

{% endif %}

{% endfor %}
