# Terraform Templates for VPC module.
VPC module will create VPC with 3 subnets Public, Private and Protected and spans them across AZs, also their route tables, routes, SG, NATs, IGWs.

Route53 Zone will be associated with a VPC, and it will enable VPC flow log.
## Files Layout
```
.
├── README.md
├── data.tf
├── outputs.tf
├── variables.tf
└── main.tf
```
## Terraform Templates

-   [backend.tf](backend.tf): This terraform template saves the state file of `terraform apply` command in SVC account in `mgmresorts-sharedservices-devops-us-west-2` bucket.

-   [data.tf](data.tf): This terraform template get The Availability Zones using data source which allows access to the list of AWS Availability Zones that can be accessed by an AWS account within the region configured in the provider.

-   [outputs.tf](outs.tf): This template prints out IDs of VPC VPC, subnets, route tables, routes, NATs, IGWs.

-   [variables.tf](vars.tf): This template declares all the variables to be used, along with their types.

-   [main.tf](vpc.tf): This template describes VPC, subnets, route tables, routes, NATs, IGWs.

## How to Deploy


1.  Create S3 Bucket for state file.
2.  Use Jenkins Apply Job or Apply Terraform Commands:

```bash
terraform init
terraform plan
terraform apply
```

## How to Destroy
 Use Jenkins Destroy Job or manually Destroy Terraform AWS Resources:

```bash
terraform destroy
```
## Outputs Sample

```bash

Outputs:

default_security_group_id = sg-e7017f96
igw_id = igw-3856155e
private_nat_eip_ids = [
    eipalloc-f13f35c1,
    eipalloc-32383202
]
private_nat_gw_ids = [
    nat-0c32a585a24102a72,
    nat-05bcc00635ef4db79
]
private_route_table_ids = [
    rtb-81ccedf9,
    rtb-cccfeeb4
]
private_subnets_ids = [
    subnet-e5ec60bf,
    subnet-d9a94dbd
]
protected_route_table_ids = [
    rtb-42d4f53a,
    rtb-25d0f15d
]
protected_subnets_ids = [
    subnet-74e76b2e,
    subnet-97a044f3
]
public_route_table_ids = [
    rtb-62d5f41a,
    rtb-a7cbeadf
]
public_subnets_ids = [
    subnet-abed61f1,
    subnet-80aa4ee4
]
vpc_id = vpc-c862f0b1

```
