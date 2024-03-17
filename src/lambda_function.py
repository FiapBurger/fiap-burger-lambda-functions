
import json

def lambda_handler(event, context):
    # Imprime o evento de entrada no CloudWatch Logs
    print("Received event: " + json.dumps(event, indent=2))

    # Processa o evento
    message = 'Hello from FiapBurger Lambda!'
    if 'name' in event:
        message = f"Hello {event['name']} from FiapBurger Lambda!"

    # Cria a resposta
    response = {
        'statusCode': 200,
        'body': json.dumps({'message': message})
    }

    return response
