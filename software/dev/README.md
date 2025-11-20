# EVERSE Research Software metadata schema
- Version: dev
- Identifier: https://w3id.org/everse/rs#
- Version identifier: https://w3id.org/everse/rs/dev
- Date: 

A repository to describe the Research Software metadata, for the tools described within the EVERSE project.
This metadata schema relies heavily on [CodeMeta](https://codemeta.github.io/terms/) and [Schema.org](http://schema.org/)), extending them when needed to 
acommodate the project needs. The requirements for this vocabulary come from the D3.1 (Technology Watch) and
the RSQKit collection of tools.

## Namespaces used in this document

| Namespace prefix | Namespace URI |
|---|---|
|schema|[http://schema.org/](http://schema.org/)|
|codemeta|[https://codemeta.github.io/terms/](https://codemeta.github.io/terms/)|
|rsqd|[https://w3id.org/everse/rsqd#](https://w3id.org/everse/rsqd#)|
|rsqi|[https://w3id.org/everse/rsqi#](https://w3id.org/everse/rsqi#)|
|rs|[https://w3id.org/everse/rs#](https://w3id.org/everse/rs#)|

## Attributes

The following attributes describe a RS tool (please note that not all are mandatory): 

| Attribute | Vocabulary term | Expected value | Recognized terminology |
|---|---|---|---|
| Application category | schema:applicationCategory | schema:Text (string) | AnalysisCode, PrototypeTool, ResearchInfrastructureSoftware |
| Applies to Programming language | rs:appliesToProgrammingLanguage | schema:Text (string)| N/A |
| Author | schema:author | schema:Person or schema:Organization (URL) | N/A |
| Description | schema:description | schema:Text (string)| N/A |
| How to use the tool? | rs:howToUse | schema:Text (string) | online-service, CI/CD, command-line, library |
| Name of the tool | schema:name | schema:Text (string)| N/A |
| Identifier | schema:identifier | schema:URL (string)| N/A |
| Is accessible for free? | schema:isAccessibleForFree | schema:Boolean| N/A |
| Quality indicator(s) the tool addresses | rs:hasQualityIndicator | rsqi:SoftwareQualityIndicator (URL) | N/A |
| Quality dimension(s) the tool addresses | rs:hasQualityDimension | rsqd:SoftwareQualityDimension (URL) | See https://everse.software/indicators/website/dimensions.html |
| License | schema:license | schema:License (URL or CreativeWork)| N/A |
| Maintainer | codemeta:maintainer | schema:Person or schema:Organization | N/A |
| URL | schema:url | schema:URL (string)| N/A |
| Cluster/Community using the tool, if specific | rs:usedBy | schema:Text (string) | ENVRI, ESCAPE, LS-RI, PaNOSC, SSHOC |

### Application categories
The type of applications categories recognized are:
- `AnalysisCode`: Software tier type used to categorize scripts and tools designed to support a research publication or investigation, with a low level of maturity
- `PrototypeTool`: Software tier type used to categorize tools designed to support a research publication or investigation that have reached a level of maturity and reuse among the community
- `ResearchInfrastructureSoftware`: Software tier type used to categorize mature tools that are used by one or several Research Infrastructures and/or science communities

Each of the categories have an identifier: `https://w3id.org/everse/rs#{id}` where the id is one of the keys used in the list above (e.g., `https://w3id.org/everse/rs#PrototypeTool`)

### Quality dimensions

The dimensions recognized are described in https://w3id.org/everse/i/dimensions/

Each of the dimensions has an identifier: `https://w3id.org/everse/rs#{id}` where the id is one of the keys used in the list above (e.g., `https://w3id.org/everse/rs#FAIRness`)

### How to use

The values for this property indicate how a software application can be used (can be a list if several are applicable).
The recognized values are:
- `online-service`: The software is available as an online service, e.g., via a web interface or API
- `CI/CD`: The software is available as part of a continuous integration and/or continuous deployment pipeline
- `command-line`: The software is available as a command line interface, e.g., via a command line tool or script
- `library`: The software is available as a library to be included in other software applications

### Custer/Community

The clusters are described in https://everse.software/RSQKit/research_clusters_and_infrastructures. If the community is not part of these clusters, it can be added as free text.

## Example

To see an example of a tool, see [the example JSON-LD file](./example.json) in this repository.

The latest version of the vocabulary is accessible at [https://w3id.org/everse/rs](https://w3id.org/everse/rs).

To obtain the JSON-LD context, just perform content negotiation as follows:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rs
```

The vocabulary has versioning enabled. To get a particular version add the version number in the URL:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rs/0.0.1
```

