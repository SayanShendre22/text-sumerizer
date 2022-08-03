<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Summaryzer</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="views/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="views/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
        integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>
</head>

<body>
    <div class="navbar-fixed">
        <nav class="grey darken-4" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="#" class="brand-logo">TSummaryzer</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="{{url_for('index')}}">Home</a></li>
                    <li><a href="{{url_for('compare_summary')}}">compare</a></li>
                    <li><a href="#aboutapp">About</a></li>
                </ul>
            </div>
        </nav>
    </div>

    <!--Slider -->
    <section class="slider">
        <div id="index-banner" class="parallax-container">
            <li>
                <div class="caption center-align">
                    <h2>Text Summarization Simplified</h2>
                    <h5 class="light grey-text text-lighten-3 hide-on-small-only">
                        Using SpaCy,NLTK and Sumy
                    </h5>
                    <div class="row center">
                        <a href="" action="/" id="download-button"
                            class="btn-large waves-effect waves-light blue lighten-1">Refresh</a>
                    </div>
                </div>
            </li>
        </div>


        <!-- Start of Main Section -->
        <div class="container">
            <div class="section">

                <!--   Icon Section   -->
                <div class="row">
                    <div class="input-field col s12 m10">
                        <div class="icon-block">
                            <h2 class="center brown-text"><i class="material-icons">chrome_reader_mode</i></h2>
                            <form method="POST" action="/analyze">
                                <textarea name="rawtext" cols="3" rows="5" class="form-control" required="true"
                                    placeholder="Enter Text Here"></textarea>

                                <br />
									<textarea name="N" cols="1" rows="1" class="form-control" required="false"
                                    placeholder="Frequency"></textarea>

                                 <br />
                                
                                <button class="btn btn-small waves-effect waves-light light-blue lighten-1"
                                    type="reset">Clear</button>
                                <button class="btn btn-small waves-effect waves-light blue lighten-1"
                                    type="submit">Summarize</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="input-field col s12 m10">
                        <div class="icon-block">
                            <h2 class="center brown-text"><i class="material-icons"></i></h2>
                            <form method="POST" action="/analyze_url">
                                <input type="text" name="user_url" placeholder="Enter URL Here" required="true">
                                <button class="btn btn-small waves-effect waves-light light-blue lighten-1"
                                    type="reset">Clear</button>
                                <button class="btn btn-small waves-effect waves-light  #0076bd lighten-1"
                                    type="submit">Summarize</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End -->

    <!-- Result Display-->
    <section class="section section-solutions-about grey darken-2">
        <div class="container white-text">

            <!--   Icon Section   -->
            <div class="row">
                <div class="col s12 m6">
                    <div class="icon-block">
                        <h2 class="center brown-text"><i class="material-icons">group</i></h2>
                        <h5 class="center">Your Text</h5>
                        <p>Reading Time: <span style="color:#0091EA;">${ orignial_time } min </span></p>
                        <p class="light">${originalText}</p>
                        <div class="alert alert-info" role="alert">
                            <p>Time Elapsed: <span style="color:#0091EA;">{{ final_time }} mins </span></p><br />
							 <p>Total Words: <span style="color:#0091EA;">${ originl_words } </span></p>
							
                        </div>
                    </div>
                </div>

                <div class="col s12 m6 grey darken-3">

                    <h2 class="center brown-text"><i class="material-icons">chrome_reader_mode</i></h2>
                    <h5 class="center">Summarized</h5>
                    <div class="" role="alert">
                        <p>Reading Time: <span style="color:#0091EA;">${ final_reading_time } min </span></p>
                    </div>
                    <p class="light">${Sumerzed_text}</p>
					 <p>Total Words: <span style="color:#0091EA;">${ final_words } </span></p>

                </div>

            </div>


        </div>
    </section>



    <footer class="page-footer black darken-4">
        <div class="container" id="aboutapp">
            <div class="row">
                <div class="col l6 s12">
                    <h5 class="white-text">About Summary App</h5>
                    <p class="grey-text text-lighten-4">Using Spacy and NLTk for Text Summarization
                        .</p>


                </div>

                <div class="col l3 s12">
                    <h5 class="white-text">Connect With Me</h5>
                    <ul>
                        <a href="https://www.instagram.com/iampra6157/" target="_blank" class="white-text">
                            <i class="fab fa-instagram fa-4x"></i>
                        </a>
                        <a href="https://www.linkedin.com/in/prachi-goje-368837208/" target="_blank" class="white-text">
                            <i class="fab fa-linkedin fa-4x"></i>
                        </a>
                        <a href="https://github.com/prachie6157" target="_blank" class="white-text">
                            <i class="fab fa-github-square fa-4x"></i>
                        </a>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer-copyright">

        </div>
    </footer>



    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="views/materialize.js"></script>
    <script src="views/init.js"></script>

</body>

</html>
<!-- 
title: Text and URL data Summarization
opportunity:  There is a problem of searching for relevant documents from the number of available documents and With ever growing digit media, it's time consuming to go through entire blog/e-book/article and decide whether it is useful or not. Many times the available data is unstructured and we can't do much more than read through a few pages.
description: Project aims to build Deep learning based solution that generates an Abstractive Text summary of content. After submitting text data or URL user will get summary data in output box. its also show time required to read the previous text and summaries text.
Technology: web app vsc
-->