# RS Quality dimensions
- Version: 0.0.2
- Identifier (latest version): https://w3id.org/everse/rsqd#
- Version identifier: https://w3id.org/everse/rsqd/0.0.2
- Previus version: https://w3id.org/everse/rsqd/0.0.1
- Date: April 1st, 2025
- Author: Daniel Garijo, Thomas Vuillaume, EVERSE Consortium

This repository describes the RS quality dimensions used in the EVERSE project.

Namespaces used in this document:

| Namespace prefix | Namespace URI |
|---|---|
|rsqd|[http://purl.org/dc/terms/](https://w3id.org/everse/rsqd#)|
|schema|[http://schema.org/](http://schema.org/)| 
|dcterms|[http://purl.org/dc/terms/](http://purl.org/dc/terms/)|
|vivo|[http://vivoweb.org/ontology/core#](http://vivoweb.org/ontology/core#)|

### Definitions
#### Research Software Quality Dimension (rsqd:ResearchSoftwareQualityDimension) 
A research software quality dimension represents criteria relevant for assessing software quality (e.g., Documentation, Performance, etc.). Each quality dimension must have one or more indicator to measure it. Dimensions may be defined in a hierarchy.

This definition inspired by W3C Data Quality Vocabulary (https://www.w3.org/TR/vocab-dqv/#dqv:Dimension) 

The following metadata attributes define a Research Software Quality dimension:

| Attribute | Key (YAML) | Term (mapping) | Expected value |
|---|---|---|---|
|Persistent identifier |identifier|[schema:identifier](https://schema.org/identifier)|[schema:Text](https://schema.org/Text) (String)|
|Name|name|[schema:name](https://schema.org/name)|[schema:Text](https://schema.org/Text) (String)|
|Brief description|description|[schema:description]((https://schema.org/description))|[schema:Text](https://schema.org/Text) (String)|
|Is part of another dimension (in case there is a hierarcy)|isPartOf|[schema:isPartOf](https://schema.org/isPartOf)|[rsqd:SoftwareQualityDimension](https://w3id.org/everse/rsqd#research-software-quality-dimension) (URL)|
|Definition source (in case the quality dimension is defined elsewhere, e.g., ISO standard)|source|[dcterms:source](http://purl.org/dc/terms/source)|[schema:URL](https://schema.org/URL) (URL)|
|Abbreviation|abbreviation|[vivo:abbreviation](http://vivoweb.org/ontology/core#abbreviation)|[schema:Text](https://schema.org/Text) (String)|

To see an example of a dimension, see the [JSON file](example.json) or the [the YAML file](example.yaml) stored in this repository.

The latest version of the vocabulary is accessible at [https://w3id.org/everse/rsqd](https://w3id.org/everse/rsqd)

To obtain the JSON-LD context, just perform content negotiation as follows:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rsqd
```

The vocabulary has versioning enabled. To get a particular version add the version number in the URL:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rsqd/0.0.2
```