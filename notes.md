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
    * [variables.tf](./jupiter-website-ecs/variables.tf)
    * [variables.tf](./jupiter-website-ecs/variables.tfvars)
* modules
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

