---
title: "CHEST-Lab - Research"
layout: textlay
excerpt: "CHEST-Lab -- Research"
sitemap: false
permalink: /research/
---

# Research

The rapid nascence of data availability, powerful algorithms, and quantitative methodology are necessitating novel conceptualisations of „digital“, serving both as an applied means of constructing information and as an arena for critical inquiry into emergent modes of representation. With a broad focus on the interplays between human health and social/built/natural environments, the Digital Health Geographies Research Group explores the confluence of applied machine learning and the analysis of situated, community-scale sociocultural practice through empirical study.

Here are some themes and techniques that we currently work on:
<p style="font-size:80%; line-height: 1;">(Click an image for more information)</p>


<head>
  <script type="text/javascript"
		  src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script type="text/javascript" 
		  src="../js/jquery.connections.js"></script>

  <style>
  *,
  *::after,
  *::before {
    margin: 0;
    padding: 0;
    box-sizing: inherit; 
  }
  
  .container {
    width: 60%;
    margin: 2rem auto; 
  }
  
  html {
    box-sizing: border-box;
    font-size: 62.5%; 
  }

  </style>
  
  <script type="text/JavaScript">
    $(document).ready(function() {
	  $().connections({ from: '#img1', to: '#img4' });
      $().connections({ from: '#img3', to: '#img4' });
      $().connections({ from: '#img3', to: '#img1' });
      $().connections({ from: '#img1', to: '#img2' });
      $().connections({ from: '#img5', to: '#img2' });
      $().connections({ from: '#img6', to: '#img5' });
      $().connections({ from: '#img6', to: '#img2' });
      $().connections({ from: '#img6', to: '#img3' });
    });
  </script>
  
  <script type="text/JavaScript">
    $(document).ready(function() {
    	var globalResizeTimer = null;

      $(window).resize(function() {
          if(globalResizeTimer != null) window.clearTimeout(globalResizeTimer);
          globalResizeTimer = window.setTimeout(function() {
              $('#img1').connections('remove');
              $('#img2').connections('remove');
              $('#img3').connections('remove');
              $('#img4').connections('remove');
              $('#img5').connections('remove');
              $('#img6').connections('remove');
              $().connections({ from: '#img1', to: '#img4' });
              $().connections({ from: '#img3', to: '#img4' });
              $().connections({ from: '#img3', to: '#img1' });
              $().connections({ from: '#img1', to: '#img2' });
              $().connections({ from: '#img5', to: '#img2' });
              $().connections({ from: '#img6', to: '#img5' });
              $().connections({ from: '#img6', to: '#img2' });
              $().connections({ from: '#img6', to: '#img3' });
          }, 200);
      });
    });
  </script>
</head>

<body>
  <div class="container" style="width: 95%; aspect-ratio: 1 / 1; margin: 1em auto;" markdown="0">
    <div class="gallery" markdown="0">
      <figure class="gallery__item gallery__item--1" id="img1">
  	    <a href="{{ site.url }}{{ site.baseurl }}/research/covid19.html">
        <img src="{{ site.url }}{{ site.baseurl }}/images/projects/COVID_19.svg"
			 alt="Gallery image 1" class="gallery__img">
	    </a>
      </figure>
      <figure class="gallery__item gallery__item--2" id="img2">
	    <a href="{{ site.url }}{{ site.baseurl }}/research/covid19narratives.html">
        <img src="{{ site.url }}{{ site.baseurl }}/images/projects/COVID_19_Narratives.svg"
			 alt="Gallery image 2" class="gallery__img">
	    </a>
      </figure>
      <figure class="gallery__item gallery__item--3" id="img3">
	    <a href="{{ site.url }}{{ site.baseurl }}/research/gem.html">
        <img src="{{ site.url }}{{ site.baseurl }}/images/projects/GEM.svg"
             alt="Gallery image 3" class="gallery__img">
	    </a>
      </figure>
      <figure class="gallery__item gallery__item--4" id="img4">
	    <a href="{{ site.url }}{{ site.baseurl }}/research/purespace.html">
        <img src="{{ site.url }}{{ site.baseurl }}/images/projects/PURE_SPACE.svg"
             alt="Gallery image 4" class="gallery__img">
	    </a>
      </figure>
      <figure class="gallery__item gallery__item--5" id="img5">
	    <a href="{{ site.url }}{{ site.baseurl }}/research/stage.html">
        <img src="{{ site.url }}{{ site.baseurl }}/images/projects/STAGE.svg"
             alt="Gallery image 5" class="gallery__img">
	    </a>
      </figure>
      <figure class="gallery__item gallery__item--6" id="img6">
	    <a href="{{ site.url }}{{ site.baseurl }}/research/vibrance.html">
        <img src="{{ site.url }}{{ site.baseurl }}/images/projects/VIBRANCE.svg"
             alt="Gallery image 6" class="gallery__img">
	    </a>
      </figure>
    </div>
  </div>
</body>