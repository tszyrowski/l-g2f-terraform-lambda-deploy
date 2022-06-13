
Before `terraform`:
```
6265 ± aws lambda list-functions --region eu-west-2
{
    "Functions": [
        {
            "FunctionName": "list-s3-buckets",
            "FunctionArn": "arn:aws:lambda:eu-west-2:572295492445:function:list-s3-buckets",
            "Runtime": "python3.8",
            "Role": "arn:aws:iam::572295492445:role/service-role/list-s3-buckets-role-2x0ormgg",
            "Handler": "lambda_function.lambda_handler",
            "CodeSize": 307,
            "Description": "",
            "Timeout": 3,
            "MemorySize": 128,
            "LastModified": "2022-06-12T12:40:41.000+0000",
            "CodeSha256": "eJsq9Fs2LvVg9vgTCdfTLDZxxIKiZ1kplzdWfjF/lws=",
            "Version": "$LATEST",
            "TracingConfig": {
                "Mode": "PassThrough"
            },
            "RevisionId": "ba651c52-76b3-4edb-9bea-66876031785d"
        },
        {
            "FunctionName": "lambda-test",
            "FunctionArn": "arn:aws:lambda:eu-west-2:572295492445:function:lambda-test",
            "Runtime": "python3.8",
            "Role": "arn:aws:iam::572295492445:role/service-role/lambda-test-role-3a3pxvpc",
            "Handler": "lambda_function.lambda_handler",
            "CodeSize": 296,
            "Description": "",
            "Timeout": 3,
            "MemorySize": 128,
            "LastModified": "2022-06-12T12:09:09.000+0000",
            "CodeSha256": "E9xGiSK97sa4pjYSVt4kslPuZ9cLLEqRyoFO4Yz02xY=",
            "Version": "$LATEST",
            "TracingConfig": {
                "Mode": "PassThrough"
            },
            "RevisionId": "5c577797-8bfe-4621-9a8a-815fc3768a26"
        }
    ]
}
```

## Terraform init
```
6275 ± terraform init                                                                                                                                                                  ✭

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/archive...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/archive v2.2.0...
- Installed hashicorp/archive v2.2.0 (signed by HashiCorp)
- Installing hashicorp/aws v4.18.0...
- Installed hashicorp/aws v4.18.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## Terraform plan

```
