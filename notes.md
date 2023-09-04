## Nigerian scrapper Azeez Salu
https://github.com/azeezsalu

Argh this is 14 videos-- but we can skip a whole bunch of them

VPC load balancing RDS EC2
10 .tf files

- [ ] [How to Install Terraform on a Windows Computer](https://www.youtube.com/watch?v=8uxxf2HoAX0)
- [ ] [How to Install Visual Studio Code on a Windows Computer](https://www.youtube.com/watch?v=S2RvmFMFjRs)
- [ ] [How to Create an IAM User with Programmatic Access.](https://www.youtube.com/watch?v=5YnTstk3RxM)
- [ ] [How to Install the AWS Command Line (CLI) on a Windows Computer](https://www.youtube.com/watch?v=Gc4KKVWl6TI)
- [x] [Terraform File Structure](https://www.youtube.com/watch?v=6P5LjvrhiJc)
- [x] [Use Terraform Module to Build a 3 Tier AWS Network VPC](https://www.youtube.com/watch?v=ZP_vAbjfFMs&list=PL184oVW5ERMCxA4336x_TM7q1Cs8y0x1s&index=6)
- [x] [Use Terraform Module to Create Nat Gateways](https://www.youtube.com/watch?v=PWoXb9MONrU&list=PL184oVW5ERMCxA4336x_TM7q1Cs8y0x1s&index=7)
- [x] [Use Terraform Module to Create Security Groups](https://www.youtube.com/watch?v=oohXRXjahFA&list=PL184oVW5ERMCxA4336x_TM7q1Cs8y0x1s&index=8)
- [x] [How to Create ECS Task Execution Role with Terraform Modules](https://www.youtube.com/watch?v=vEfAFVDguko)
- [x] [How to Request an SSL Certificate from AWS Certificate Manager with Terraform Modules](https://www.youtube.com/watch?v=RRdYFwlCHic)



### Terraform File Structure
#### resource
* ```resource``` is a kind of object. The first term after  resource is a known terraform object. 
* Search to find the details. You are looking for a Terraform Registry page
  * [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc.html) is found here, and gives several examples from basic usage to specifying every detail. 
    * For example (2nd example from that page )
```.tf
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}
  ```

  * The second value is the local name
  * To reference any thing just connect resource.name
    * ```aws_vpc.main.id``` for example
  #### data
  * A terraform managed data source. search ```data source <name>```
  * [aws_availability_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones)


### Use Terraform Module to Build a 3 Tier AWS Network VPC
This one is over an hour, set video speed 
Creating
  * jupiter-website-ecs
    * [backend.tf](./jupiter-website-ecs/backend.tf)
    * [main.tf](./jupiter-website-ecs/main.tf)
    * [terraform.tfvats](./jupiter-website-ecs/terraform.tfvars)
    * [variables.tf](./jupiter-website-ecs/variables.tf)
* modules
  * acm
    * [main.tf](./modules/acm/main.tf)
    * [outputs.tf](./modules/acm/outputs.tf)
    * [variables.tf](./modules/acm/variables.tf)
  * ecs-tasks-execution-role
    * [main.tf](./modules/ecs-tasks-execution-role/main.tf)
    * [outputs.tf](./modules/ecs-tasks-execution-role/outputs.tf)
    * [variables.tf](./modules/ecs-tasks-execution-role/variables.tf)
  * nat-gateway
    * [main.tf](./modules/nat-gateway/main.tf)
    * [output.tf](./modules/nat-gateway/variables.tf)
  * security-groups
    * [main.tf](./modules/security-groups/main.tf)
    * [outputs](./modules/security-groups/outputs.tf)
    * [variables.tf](./modules/security-groups/variables.tf)
  * vpc
    * [main.tf](./modules/vpc/main.tf)
    * [variables.tf](./modules/vpc/variables.tf)
    * [output.tf](./modules/vpc/output.tf)
##### Built and destroyed the thing, moving on
#### Added the nat-gateway module, built and destroyed
#### Added security-groups Built
#### Added iam creation for tasks execution role
#### Added route53 domain name in acm module
#### Request a certificate
To complete this required a domain name
a whois zerosubstance.org found the domain unowned so I registered it with Route53 but the certificate is still pending
```whois zerosubstance.org```
In the certificate manager on aws found these 4 nameservers working on it

* zerosubstance.org	NS	Simple
  * ns-1977.awsdns-55.co.uk.
  * ns-677.awsdns-20.net.
  * ns-424.awsdns-53.com.
  * ns-1429.awsdns-50.org.
	
  
  
* zerosubstance.org	SOA	Simple
  * ns-1977.awsdns-55.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400
* _1bd6faa92f36ae033d40b9e1ca006f2e.zerosubstance.org	CNAME	Simple	
  * _2cefb8037ac6592ffa1e67f408cef4d1.vpgtsqjbxb.acm-validations.aws.
* _67a12c064ed9291a7a09ad2f36f3fd33.zerosubstance.com.zerosubstance.org	CNAME	Simple
  * _4b56fd0d87d38c91f52fe88b9c684da3.vpgtsqjbxb.acm-validations.aws.

Then dig the ns retrieves a NOERROR
```dig @ns-1977.awsdns-55.co.uk.  zerosubstance.org```
```dig @8.8.8.8 zerosubstance.org ns |grep -i status``````
Still I wait for status pending from the certificate manager with Amazon issued pending validation
