# styleapp

This environment is designed to deploy a scalable, containerized application infrastructure, with full monitoring and serverless capabilities.

Summary of the Cloud Environment:
   - Resource Group: A container for all Azure resources, dynamically created using variables for name and location.
   - Networking: The network module configures virtual networks, subnets, and gateways needed for the AKS cluster and other services.
   - AKS Cluster: A Kubernetes cluster is set up to run containerized workloads, using the network resources established in the Network module.
   - Monitoring: Implements monitoring services to track the health and performance of the environment, with a storage account for log and metric data and Azure Data Factory and Log Analytics Workspace resources to provide complex
          querying of data.
   - Function App: A serverless application environment for running functions, using the monitoring storage account for data.
