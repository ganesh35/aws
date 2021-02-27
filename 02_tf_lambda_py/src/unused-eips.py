import boto3
import os

ec2Client = boto3.client('ec2')
sesClient = boto3.client('ses')

SOURCE_EMAIL = os.environ['SOURCE_EMAIL']
TARGET_EMAIL = os.environ['TARGET_EMAIL']

def lambda_handler(event, context):
    response = ec2Client.describe_addresses()
    eips = []
    for eip in response['Addresses']:
        if 'InstanceId' not in eip:
            eips.append(eip['PublicIp'])
    # print(eips)

    # send email using ses
    if eips:
        sesClient.send_email(
            Source=SOURCE_EMAIL,
            Destination={
                'ToAddresses': [
                    TARGET_EMAIL
                ]
            },
            Message={
                'Subject': {
                    'Data': 'Unused EIPS',
                    'Charset': 'utf-8'
                },
                'Body': {
                    'Text': {
                        'Data': str(eips),
                        'Charset': 'utf-8'
                    }
                }
            }
        )