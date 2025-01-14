# backend_agent
This is an entire mobile App with  AI embedded in it.

You will notice that there are two folder. 

  1. the lib is the front-end. " we couldn't download the entire app ".
       - Download Flutter
       - Create a Flutter Project
       - Go to your project
       - Replace the lib of your new prject with This lib 
       - Run the app
  
  2. myprject is actually the backend of the app.
       - install all the requirements by running  "  pip install -r .\requirements.txt "
       - Make sure you have Ollama already installed, if not run this on the command line " curl -fsSL https://ollama.com/install.sh | sh"
       - then " pip install ollama "
       - and pull the mistral model by running in the command line " ollama pull mistral "
       - Now you'll be able to run " python manage.py runserver "
       - and " Voila ! "  your site is now alive. 
       - copy the Url  http://127.0.0.1:8000/   then add  api/user/agent  at the end in your browser , you'll have something like http://127.0.0.1:8000/api/user/agent
       - and 'Yes ! ' you are now having your endpoint. you can now ask  Mistral AI model everthing you want like
          . type the following prompt.
          . let's say:
                     {
                        "role": "user",
                        "content": "what is 10 things to do in paris"
                      }
           
         - you shoudl by now be able to communicate with the model via an endpoint.
         - you can now copy the whole url http://127.0.0.1:8000/api/user/agent:
               .  go to your flutter project if you have already create one, specially lib/custompage.dart
               .  replace this one "http://myproject_endpoitds_IP_or_domaine/api/user/agent/"  with the real end point, this time  http://127.0.0.1:8000/api/user/agent
               .  and also the other just domaine and you're good.
               .  run the app with the backend server running.
               .  you're now able to run a full mobile app backend and front-end combine. 
