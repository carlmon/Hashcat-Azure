[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcarlmon%2FHashcat-Azure%2Fmaster%2Fazuredeploy.json) [![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg)](http://armviz.io/#?load=https%3A%2F%2Fraw.githubusercontent.com%2Fcarlmon%2FHashcat-Azure%2Fmaster%2Fazuredeploy.json)

# Hashcat Azure

This is a template for setting up and deploying [hashcat](https://hashcat.net/) and [John the Ripper](https://www.openwall.com/john/) on Azure using NV-series virtual machines and GRID drivers. Click above button to deploy on [Microsoft Azure](https://azure.microsoft.com/) (requires an Azure subscription).

## Usage
Once deployed, connect to the server with SSH and use hashcat from the commandline. See the [Hashcat Wiki](https://hashcat.net/wiki/) for details and examples.

## How it works
The deployment will create an Ubuntu Server 18.10 LTS instance on an Azure NV-series virtual machine. The deployment process executes a custom script to [install NVIDIA GRID drivers](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/n-series-driver-setup#install-grid-drivers-on-nv-or-nvv2-series-vms) as well as the latest released version of hashcat.

## Benchmarks
* [Hashcat NV6 Standard](benchmarks/Hashcat_Standard_NV6.txt)
* [John NV6 Standard](benchmarks/John_Standard_NV6.txt)
* [Hashcat NV12 Standard](benchmarks/Hashcat_Standard_NV12.txt)