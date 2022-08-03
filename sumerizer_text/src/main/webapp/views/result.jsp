<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

    <!-- Result Display-->
    <section class="section section-solutions-about grey darken-2">
        <div class="container white-text">

            <!--   Icon Section   -->
            <div class="row">
                <div class="col s12 m6">
                    <div class="icon-block">
                        <h2 class="center brown-text"><i class="material-icons">group</i></h2>
                        <h5 class="center">Your Text</h5>
                        <p>Reading Time: <span style="color:#0091EA;">{{ final_reading_time }} min </span></p>
                        <p class="light">${originalText}</p>
                        <div class="alert alert-info" role="alert">
                            <p>Time Elapsed: <span style="color:#0091EA;">{{ final_time }} mins </span></p><br />

                        </div>
                    </div>
                </div>

                <div class="col s12 m6 grey darken-3">

                    <h2 class="center brown-text"><i class="material-icons">chrome_reader_mode</i></h2>
                    <h5 class="center">Summarized</h5>
                    <div class="" role="alert">
                        <p>Reading Time: <span style="color:#0091EA;">${ summary_reading_time } min </span></p>
                    </div>
                    <p class="light">${ Sumerzed_text }</p>


                </div>

            </div>


        </div>
    </section>
	


</body>
</html>