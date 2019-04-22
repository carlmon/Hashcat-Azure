[![Deploy to Azure](https://azuredeploy.net/deploybutton.svg)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcarlmon%2FHashcat-Azure%2Fmaster%2Fazuredeploy.json) [![Visualize](http://armviz.io/visualizebutton.png)](http://armviz.io/#?load=https%3A%2F%2Fraw.githubusercontent.com%2Fcarlmon%2FHashcat-Azure%2Fmaster%2Fazuredeploy.json)

# Hashcat Azure

This is a template for setting up and deploying [hashcat](https://hashcat.net/) on Azure using NV-series virtual machines and GRID drivers. Click above button to deploy on [Microsoft Azure](https://azure.microsoft.com/) (requires an Azure subscription).

## Usage
Once deployed, connect to the server with SSH and use hashcat from the commandline. See the [Hashcat Wiki](https://hashcat.net/wiki/) for details and examples.

## Benchmarks
* [NV6 Standard](benchmarks/Standard_NV6.txt)
* [NV12 Standard](benchmarks/Standard_NV12.txt)