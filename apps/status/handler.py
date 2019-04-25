import json


def endpoint(event, context):
    body = {
        'message': 'Hello world!'
    }

    response = {
        'statusCode': 200,
        'body': json.dumps(body)
    }

    return response
