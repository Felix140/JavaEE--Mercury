<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="I<head>
        <meta charset=" ISO-8859-1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">


        <style>
            .risultati {
                background-color: wheat;
                height: 100px;

                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center;
            }


            .form__container {
                min-height: 200px;
                /* border: 3px solid red; */
                margin: auto;
                width: 600px;

                padding: 30px 0;

            }

            .footer {
                height: 500px;
            }
        </style>
        <title>Mercury</title>
    </head>

    <body>

        <header class="w3-container w3-theme w3-padding" id="myHeader">

            <div class="w3-center">
                <h4>GLI EVENTI COME NON LI AVEVI MAI CERCATI...</h4>
                <h1 class="w3-xxxlarge">MERCURY</h1>
            </div>
            </div>
        </header>

        <div class="risultati">
            <h2>LOGIN ADMIN</h2>
        </div>

        <main>

            <div class="form__container">
                <form action="LoginAdmin" method="Post">

                    <!-- Nome admin -->
                    <div class="mb-3 form-floating">
                        <input type="text" class="form-control" name="Nome_Admin" id="Nome_Admin"
                            placeholder="nome-admin">
                        <label for="nome">Nome Amministratore </label>
                    </div>


                    <div class="mb-3 form-floating">
                        <input type="password" class="form-control" name="Password" id="Password"
                            placeholder="Password">
                        <label for="Password">Password</label>
                    </div>

                    <div class="buttons text-center">

                        <input type="submit" name="" id="" class="btn btn-secondary ">

                    </div>
                </form>
            </div>
        </main>



        <!-- Footer -->
        <footer class="w3-container w3-theme-dark w3-padding-16 footer">
            <h3>Footer</h3>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>

    </body>SO-8859-1">
    <title>Insert title here</title>
    </head>

    <body>

    </body>

    </html>