## AWS config file in ~/.aws/config ###
output= json/<text>

## To get a list of ec2 instances ##
aws ec2 describe-instances


# Launch an auto scaling group on stalluri's account ##
aws autoscaling create-auto-scaling-group --auto-scaling-group-name stalluri-asg-test1 --launch-configuration-name stalluri-asg-config --availability-zones us-east-1a --min-size 2 --max-size 10 --tag "Key=Cluster, Value=Webserver"

## Run a command on the current set of ec2 instances ###
for h in `aws ec2 describe-instances --filters "Name=tag-key,Values=Cluster,Name=tag-value,Values=Webserver" | grep PublicDnsName | cut -d "\"" -f4` ; do  ssh -i ~/.ssh/keypairs/keys.pem ec2-user@$h "dd if=/dev/zero of=/dev/null &"  ; done



# Disk fill workload
#$COUNT needs to be replaced with how big the file should grow in MiB, Below we are targetting 100MB
dd if=/dev/zero of=/tmp/tempFiller.deleteMe bs=1M count=100

# Make a bucket open to public for read
{
  "Version":"2012-10-17",
  "Statement":[{
	"Sid":"AddPerm",
        "Effect":"Allow",
	  "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::examplebucket/*"
      ]
    }
  ]
}


# Create an alarm on a set of instances
for host in `aws ec2 describe-instances --region us-east-1 --filters "Name=tag-key,Values=Name,Name=tag-value,Values=SatishASGSpotEast" | grep InstanceId | cut -d "\"" -f4` ; do

echo "Creating alarm on" $host

# Issue with AWS CLI : It doesnt let alarm action with SNS topics in regions other than us-east-1
 aws cloudwatch put-metric-alarm --region us-east-1 --alarm-name cpu_lt_30_on_$host --alarm-description "CPU utiliz is less than 30pct" --metric-name CPUUtilization --namespace AWS/EC2 --statistic Average  --period 60 --threshold 30 --comparison-operator LessThanThreshold --dimensions Name=InstanceId,Value=$host --evaluation-periods 1  --unit Percent #--alarm-actions arn:aws:sns:eu-west-1:32098423094830:aknalamalapu-sns-gamma --ok-actions arn:aws:sns:eu-west-1:32098423094830:aknalamalapu-sns-gamma

# aws cloudwatch put-metric-alarm --region eu-west-1 --alarm-name cpu_lt_42_on_$host --alarm-description "CPU utiliz lower than 42pct" --metric-name CPUUtilization --namespace AWS/EC2 --statistic Average  --period 60 --threshold 42 --comparison-operator LessThanThreshold --dimensions Name=InstanceId,Value=$host --evaluation-periods 1  --unit Percent --alarm-actions arn:aws:sns:eu-west-1:32098423094830:neptuneio-sns-gamma

# Force alarm state temporarily
# aws cloudwatch set-alarm-state --region eu-west-1 --alarm-name cpu_lt_42_on_$host --state-value OK --state-reason force

done

# To fill a dynamodb table
Create table : SatishTestTable
with only hash number : primarykey
read : 20 ; write 10



for serialno in {1..2000}
do
aws dynamodb put-item --table-name SatishTestTable --region us-west-1 --item '{ "primarykey" : {"N":"'$serialno'"}, "text1" : {"S": "NeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneioNeptuneio"}}'
done&

# Scan a dynamodb table
for i in {1..1000}
do
  aws dynamodb scan --table-name SatishTestTable --region us-west-1 > /dev/null
  aws dynamodb get-item --table-name SatishTestTable --key '{ "primarykey" : {"N" : "'$((RANDOM%2000))'"} }' --region us-west-1 >/dev/null
done&

# Create cpu alarms on a tagged instance group

for host in `aws ec2 describe-instances --region us-east-1 --filters "Name=tag-key,Values=Name,Name=tag-value,Values=SatishASGSpotEast" | grep InstanceId | cut -d "\"" -f4` ; do

echo "Creating alarm on" $host

# Issue with AWS CLI : It doesnt let alarm action with SNS topics in regions other than us-east-1
 aws cloudwatch put-metric-alarm --region us-east-1 --alarm-name asg_cpu_lt_35_on_$host --alarm-description "CPU utiliz is less than 35pct" --metric-name CPUUtilization --namespace AWS/EC2 --statistic Average  --period 60 --threshold 35 --comparison-operator LessThanThreshold --dimensions Name=InstanceId,Value=$host --evaluation-periods 1  --unit Percent --alarm-actions arn:aws:sns:us-east-1:32098423094830:neptuneio-sns-gamma --ok-actions arn:aws:sns:us-east-1:32098423094830:neptuneio-sns-gamma

# aws cloudwatch put-metric-alarm --region eu-west-1 --alarm-name cpu_lt_42_on_$host --alarm-description "CPU utiliz lower than 42pct" --metric-name CPUUtilization --namespace AWS/EC2 --statistic Average  --period 60 --threshold 42 --comparison-operator LessThanThreshold --dimensions Name=InstanceId,Value=$host --evaluation-periods 1  --unit Percent --alarm-actions arn:aws:sns:eu-west-1:32098423094830:neptuneio-sns-gamma

# Force alarm state temporarily
# aws cloudwatch set-alarm-state --region eu-west-1 --alarm-name cpu_lt_42_on_$host --state-value OK --state-reason force

done

# Push a message to sqs queue
for count in {1..5}
do

raw_command='yes > /dev/null'

var1='{"timestamp":1429860791437,"source":"neptune.io","hostname":"ip-10-0-0-18","agentId":"03cbbf82-2b4d-4110-adda-dbea73f02e3d","customerId":"b6e236d9-a4d7-4dd2-8f10-af63c317ce8c","ruleName":"DryRun","ruleId":"DryRun","inflightActionId":"49847346-e090-4c96-968b-bdba7174db16","actionGroupId":null,"actionId":"5efb565e-cf87-41b2-a57c-4198244692e2","actionType":"EXECUTE_SCRIPT","eventId":"'

var2='","timeout":15,"rawCommand":"' 

var3='","signature":"neptuneio-signature"}'

message=${var1}${count}${var2}${raw_command}${var3}

aws sqs send-message --queue-url https://sqs.us-east-1.amazonaws.com/32098423094830/neptuneio-agent-action-queue --message-body $message >/dev/null
done
