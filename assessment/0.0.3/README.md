# RS Quality Assessment metadata schema

- Version: 0.0.3
- Identifier: https://w3id.org/everse/rsqa#
- Version identifier: https://w3id.org/everse/rsqa/0.0.3
- Author: Faruk Diblen, EVERSE Consortium

A repository to describe the Research Software Quality Assessment results used in the EVERSE project. This schema allows for capturing the outcomes of software quality assessments, including individual check results and their associated evidence.

## Namespaces used in this document

| Namespace prefix | Namespace URI                                                  |
| ---------------- | -------------------------------------------------------------- |
| rsqa             | [https://w3id.org/everse/rsqa#](https://w3id.org/everse/rsqa#) |
| rsqi             | [https://w3id.org/everse/rsqi#](https://w3id.org/everse/rsqi#) |
| rs               | [https://w3id.org/everse/rs#](https://w3id.org/everse/rs#)     |
| schema           | [http://schema.org/](http://schema.org/)                       |
| dcterms          | [http://purl.org/dc/terms/](http://purl.org/dc/terms/)         |

## Definitions

### Software Quality Assessment (rsqa:SoftwareQualityAssessment)

A software quality assessment represents the result of measured indicators for a piece of software. It aggregates multiple check results that evaluate different quality indicators.

The following metadata attributes define a Software Quality Assessment:

| Attribute         | Key (JSON-LD)    | Term (mapping)                                                         | Expected value                                                                                       |
| ----------------- | ---------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Name              | name             | [schema:name](https://schema.org/name)                                 | [schema:Text](https://schema.org/Text) (String)                                                      |
| Description       | description      | [schema:description](https://schema.org/description)                   | [schema:Text](https://schema.org/Text) (String)                                                      |
| Creator           | creator          | [schema:creator](https://schema.org/creator)                           | [schema:Person](https://schema.org/Person) or [schema:Organization](https://schema.org/Organization) |
| Date created      | dateCreated      | [schema:dateCreated](https://schema.org/dateCreated)                   | [schema:DateTime](https://schema.org/DateTime) (String)                                              |
| Version           | version          | [schema:version](https://schema.org/version)                           | [schema:Text](https://schema.org/Text) (String)                                                      |
| License           | license          | [schema:license](https://schema.org/license)                           | [schema:URL](https://schema.org/URL) (URL)                                                           |
| Assessed software | assessedSoftware | [rsqa:assessedSoftware](https://w3id.org/everse/rsqa#assessedSoftware) | [rs:SoftwareApplication](https://w3id.org/everse/rs#SoftwareApplication) (URL)                       |
| Check results     | checks           | [rsqa:hasCheckResult](https://w3id.org/everse/rsqa#hasCheckResult)     | [rsqa:CheckResult](https://w3id.org/everse/rsqa#CheckResult) (Array)                                 |

### Check Result (rsqa:CheckResult)

Represents the outcome of a specific check performed as part of a software quality assessment. It is a subclass of schema:Action, capturing the process and result of evaluating a particular quality indicator.

The following metadata attributes define a Check Result:

| Attribute          | Key (JSON-LD)     | Term (mapping)                                                           | Expected value                                                                               |
| ------------------ | ----------------- | ------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| Assesses indicator | assessesIndicator | [rsqa:assessesIndicator](https://w3id.org/everse/rsqa#assessesIndicator) | [rsqi:SoftwareQualityIndicator](https://w3id.org/everse/rsqi#SoftwareQualityIndicator) (URL) |
| Checking software  | checkingSoftware  | [rsqa:checkingSoftware](https://w3id.org/everse/rsqa#checkingSoftware)   | [rs:SoftwareApplication](https://w3id.org/everse/rs#SoftwareApplication)                     |
| Process            | process           | [schema:actionProcess](https://schema.org/actionProcess)                 | [schema:Text](https://schema.org/Text) (String)                                              |
| Status             | status            | [schema:actionStatus](https://schema.org/actionStatus)                   | [schema:ActionStatusType](https://schema.org/ActionStatusType) (URL)                         |
| Output             | output            | [rsqa:checkOutput](https://w3id.org/everse/rsqa#checkOutput)             | [schema:Text](https://schema.org/Text)  (String)                               |
| Evidence           | evidence          | [rsqa:checkEvidence](https://w3id.org/everse/rsqa#checkEvidence)         | [schema:Text](https://schema.org/Text)  (String)                               |

## Properties

### rsqa:assessedSoftware

Links a SoftwareQualityAssessment to the SoftwareApplication that was assessed.

- Domain: rsqa:SoftwareQualityAssessment
- Range: rs:SoftwareApplication

### rsqa:hasCheckResult

Links a software quality assessment to its individual check results.

- Domain: rsqa:SoftwareQualityAssessment
- Range: rsqa:CheckResult
- SubPropertyOf: schema:hasPart

### rsqa:checkingSoftware

The software that was used to perform the check.

- Domain: rsqa:CheckResult
- Range: rs:SoftwareApplication
- SubPropertyOf: schema:agent

### rsqa:assessesIndicator

The specific quality indicator that this check assesses.

- Domain: rsqa:CheckResult
- Range: rsqi:SoftwareQualityIndicator
- SubPropertyOf: schema:object

### rsqa:checkOutput

The result value of the check (e.g., true / false / indeterminate).

- Domain: rsqa:CheckResult
- Range: schema:Text
- SubPropertyOf: schema:result

### rsqa:checkEvidence

Additional information or evidence on how the check status was concluded.

- Domain: rsqa:CheckResult
- Range: schema:Text
- SubPropertyOf: schema:result

### rsqa:checkRawValue

The raw value or measurement obtained from the check, before any interpretation or thresholding. This is different from the checkOutput property, which declares if the test is passed or not.

- Domain: rsqa:CheckResult
- Range: schema:Text
- SubPropertyOf: schema:result

### rsqa:checkThreshold

The threshold or criteria used to interpret the raw value of the check. For example, documentation coverage passes under a tool if at least 50 percent of the functions are documented.

- Domain: rsqa:CheckResult
- Range: schema:Text


## Example

To see an example of an assessment, see the [JSON-LD file](example.json) stored in this repository.

The latest version of the vocabulary is accessible at [https://w3id.org/everse/rsqa](https://w3id.org/everse/rsqa).

To obtain the JSON-LD context, just perform content negotiation as follows:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rsqa
```

The vocabulary has versioning enabled. To get a particular version add the version number in the URL:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rsqa/0.0.3
```
