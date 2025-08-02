def lambda_handler(event, context):
    return {
        "statusCode": 200,
        "body": "Olá do Lambda em container!"
    }