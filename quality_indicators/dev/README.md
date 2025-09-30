# RS Quality indicators metadata schema
- Version: 0.0.2
- Identifier: https://w3id.org/everse/rsqi#
- Version identifier: https://w3id.org/everse/rsqi/0.0.2
- Previous version: https://w3id.org/everse/rsqi/0.0.1
- Date: April 3rd, 2025
- Author: Daniel Garijo, Faruk Biden, Thomas Vuillaume, EVERSE Consortium


A repository to describe the RS quality indicators used in the EVERSE project, as well as a template for the RSQKit.

Namespaces used in this document:

| Namespace prefix | Namespace URI |
|---|---|
|dcat|[http://www.w3.org/ns/dcat#](http://www.w3.org/ns/dcat#)|
|dcterms|[http://purl.org/dc/terms/](http://purl.org/dc/terms/)|
|dqv|[http://www.w3.org/ns/dqv#](http://www.w3.org/ns/dqv#)|
|rsqd|[https://w3id.org/everse/rsqd#](https://w3id.org/everse/rsqd#)|
|vivo|[http://vivoweb.org/ontology/core#](http://vivoweb.org/ontology/core#)|

### Definitions
#### Research Software Indicator
A software quality indicator represents a specific aspect of software that can be measured (e.g., FAIRness, test coverage, documentation coverage, etc.)

This definition is inspired by the W3C Data Quality Vocabulary (https://www.w3.org/TR/vocab-dqv/#dqv:Dimension), where a “metric” reads as “Represents a standard to measure a quality dimension".

The figure below show an example on how indicators and dimensions are related to each other:
![overview indicators](img/overview.png)

In the example, let's assume we have a tool `howFairIs` (taken as an illustrative example) that measures two indicators, one about licenses being present in a repository, and another one about software metadata. Both indicators would be associated with their respective quality dimension (`R1.1` and `F2` respectively), which in this case are part of another higher level quality dimension (`FAIRness`).

The following metadata attributes define a Research Software Quality indicator:

| Attribute | Key (YAML) | Term (mapping) | Expected value |
|---|---|---|---|
| Contact (person or organization) for the indicator | contact | [dcat:contactPoint](https://www.w3.org/ns/dcat#contactPoint) | [schema:Person](https://schema.org/Person) or [schema:Organization](https://schema.org/Organization) |
| Author | author | [schema:author](https://schema.org/author) | [schema:Person](https://schema.org/Person) or [schema:Organization](https://schema.org/Organization) |
| Creation date | created | [schema:dateCreated](https://schema.org/dateCreated) | [schema:DateTime](https://schema.org/DateTime) (String) |
| Name of the indicator | name | [schema:name](https://schema.org/name) | [schema:Text](https://schema.org/Text) (String)|
| Description | description | [schema:description](https://schema.org/description) | [schema:Text](https://schema.org/Text) (String)|
| Indicator Status (active, deprecated, etc.) | status | [schema:creativeWorkStatus](https://schema.org/creativeWorkStatus) | [schema:Text](https://schema.org/Text) (String)|
| Keywords | keywords | [schema:keywords](https://schema.org/keywords) | [schema:Text](https://schema.org/Text) (String)|
| RS Quality Dimension  | qualityDimension | [dqv:inDimension](http://www.w3.org/ns/dqv#inDimension) | [rsqd:SoftwareQualityDimension](https://w3id.org/everse/rsqd#) (URL) |
| RS Quality Indicator Identifier | identifier | [schema:identifier](https://schema.org/identifier) | [schema:Text](https://schema.org/Text) (String) |
| Source (e.g., standard/tool where it came from) | source | [dcterms:source](http://purl.org/dc/terms/source) | [schema:URL](https://schema.org/URL) (URL) |
| Version | version | [schema:version](https://schema.org/version) | [schema:Text](https://schema.org/Text) (String)|
| Abbreviation | abbreviation | [vivo:abbreviation](https://vivoweb.org/ontology/core#abbreviation) | [schema:Text](https://schema.org/Text) (String)|
| Alternate name | alternateName | [schema:alternateName](https://schema.org/alternateName) | [schema:Text](https://schema.org/Text) (String)|
| Same as | sameAs | [schema:sameAs](https://schema.org/sameAs) | [schema:URL](https://schema.org/URL) (URL)|

The `description` of an indicator should address:
```
### What is being measured?
    Explain what you are measuring
### Why should we measure it?
    Explain why
### What must be provided for the measurement? 
    For example, a zenodo record, or a GitHub id.
### How is the measurement executed?
    Explain the exact process for assessing the indicator
### What is/are considered valid result(s)?
    What outcomes are pass/fail
```

To see an example of an indicator, see the [JSON file](example.json) or the [the YAML file](example.yaml) stored in this repository.

The latest version of the vocabulary is accessible at [https://w3id.org/everse/rsqi](https://w3id.org/everse/rsqi).

To obtain the JSON-LD context, just perform content negotiation as follows:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rsqi
```

The vocabulary has versioning enabled. To get a particular version add the version number in the URL:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rsqi/0.0.2
```

