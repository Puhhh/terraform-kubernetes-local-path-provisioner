# How to use

* Change S3 values 

```bash
terraform init
```
```bash
terraform plan
```
```bash
terraform apply
```

## Optional 

* If you need to change the default values of variables, add them to the *terraform.tfvars* file.
* If the value of *helm-custom-values* is *true*, *values.yaml* will be used. You can modify *values.yaml*.
* If 
```YAML
storageclass:
  defaultClass: true
```
doesn't work then try
```bash
kubectl patch storageclass local-path-provisioner -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```