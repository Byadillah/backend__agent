from django.shortcuts import render
from ollama import chat, ChatResponse

from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from .models import Student, Agent,Translate
from .serializer import StudentSerializer, AgentSerializer, KeepMessageSerializer, TranslateSerializer



# this was an experiment, 

@api_view(['GET'])
def get_user(request):
    return Response(StudentSerializer({'firstname':'Dave','lastname':'Ilya'}).data)


@api_view(['POST'])
def create_user(request):
    check_firstname = Student.objects.filter(firstname=request.data['firstname']).values()
    serializer = StudentSerializer(data=request.data)
    print(request.data['firstname'])
    if serializer.is_valid():
        if  check_firstname.exists():
            value = StudentSerializer(data=check_firstname[0])
            print(check_firstname[0])
            if value.is_valid():
                print(value.data)
                return Response(value.data, status=status.HTTP_201_CREATED)
            else:
                return Response(value.errors, status= status.HTTP_400_BAD_REQUEST )
        elif  not check_firstname.exists():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
    else:
        return Response(serializer.errors, status= status.HTTP_400_BAD_REQUEST )


@api_view(['POST'])
def chat_agent(request):
    response: ChatResponse = chat(model='mistral', messages = [ {'role':request.data['role'],'content':request.data['content'] } ])
    message = response.message
    serializer = AgentSerializer(
            {
                'role': message['role'],
                'content':message['content']
                })
    
    keep_copy_message = KeepMessageSerializer(data = {'question': request.data['content'], 'answer':message['content']} )
    if keep_copy_message.is_valid():
        keep_copy_message.save()
    
   # if keep_copy_message.is_valid():
    #    keep_copy_message.save()

    return Response(serializer.data, status=status.HTTP_201_CREATED);




# Here I use RAG  to retreive information from Databases before send it to the model

@api_view(['POST'])
def translate(request):
    get_comorian = request.data['content'].split()
    join_word = ''
    for word in get_comorian:
        check_word = Translate.objects.filter(comorian=word).values()
        if check_word.exists():
            join_word =  join_word + ' ' + check_word[0]['french']



    response: ChatResponse = chat(
            model='mistral',
            messages = [ 
                        {'role':request.data['role'],
                         'content':join_word 
                         }
                        ])
    message = response.message
    serializer = AgentSerializer({'role': message['role'],'content':message['content']})

    keep_copy_message = KeepMessageSerializer(data = {'question': join_word, 'answer':message['content']} )
    if keep_copy_message.is_valid():
        keep_copy_message.save()

   # if keep_copy_message.is_valid():
    #    keep_copy_message.save()

    return Response(serializer.data, status=status.HTTP_201_CREATED);




# Create your views here.
