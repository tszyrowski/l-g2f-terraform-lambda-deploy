
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
6289 ± terraform plan                                                                                                                 
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_role.lambda_role will be created
  + resource "aws_iam_role" "lambda_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "lambda.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "iam_for_lambda"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy {
          + name   = (known after apply)
          + policy = (known after apply)
        }
    }

  # aws_iam_role_policy.lambda_policy will be created
  + resource "aws_iam_role_policy" "lambda_policy" {
      + id     = (known after apply)
      + name   = "test_policy"
      + policy = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = "*"
                      + Effect   = "Allow"
                      + Resource = "*"
                      + Sid      = "Stmt1655040980170"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role   = (known after apply)
    }

  # aws_lambda_function.test_lambda will be created
  + resource "aws_lambda_function" "test_lambda" {
      + architectures                  = (known after apply)
      + arn                            = (known after apply)
      + filename                       = "outputs/functionbasic.zip"
      + function_name                  = "functionbasic"
      + handler                        = "functionbasic.hello"
      + id                             = (known after apply)
      + invoke_arn                     = (known after apply)
      + last_modified                  = (known after apply)
      + memory_size                    = 128
      + package_type                   = "Zip"
      + publish                        = false
      + qualified_arn                  = (known after apply)
      + reserved_concurrent_executions = -1
      + role                           = (known after apply)
      + runtime                        = "python3.8"
      + signing_job_arn                = (known after apply)
      + signing_profile_version_arn    = (known after apply)
      + source_code_hash               = (known after apply)
      + source_code_size               = (known after apply)
      + tags_all                       = (known after apply)
      + timeout                        = 3
      + version                        = (known after apply)

      + ephemeral_storage {
          + size = (known after apply)
        }

      + tracing_config {
          + mode = (known after apply)
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```

## Terraform apply

```
aws_iam_role.lambda_role: Creating...
╷   
│ Error: failed creating IAM Role (iam_for_lambda): InvalidClientTokenId: The security token included in the request is invalid 
│       status code: 403, request id: 6147ada5-13ad-4f4d-8d28-99c97823e9dc  
│  
│   with aws_iam_role.lambda_role,     
│   on lambda-iam.tf line 8, in resource "aws_iam_role" "lambda_role":   
│    8: resource "aws_iam_role" "lambda_role" {  
│                                                
```
**(Explanation)[https://github.com/99designs/aws-vault/issues/266]**

AWS requires to use an MFA to perform IAM operation with an assume-role