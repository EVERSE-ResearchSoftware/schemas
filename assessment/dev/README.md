# RS Quality Assessment metadata schema

- Version: dev (next release, not yet published)
- Identifier: https://w3id.org/everse/rsqa#
- Version identifier: https://w3id.org/everse/rsqa/dev
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

Required keys: `@context`, `@type`, `name`, `dateCreated`, `assessedSoftware` and `checks` (at least one check result). `dateCreated` is an ISO 8601 date-time with a time zone, e.g. `2025-06-19T17:52:00Z`.

### Check Result (rsqa:CheckResult)

Represents the outcome of a specific check performed as part of a software quality assessment. It is a subclass of schema:Action, capturing the process and result of evaluating a particular quality indicator.

The following metadata attributes define a Check Result:

| Attribute          | Key (JSON-LD)     | Term (mapping)                                                           | Expected value                                                                               |
| ------------------ | ----------------- | ------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| Assesses indicator | assessesIndicator | [rsqa:assessesIndicator](https://w3id.org/everse/rsqa#assessesIndicator) | [rsqi:SoftwareQualityIndicator](https://w3id.org/everse/rsqi#SoftwareQualityIndicator) (URL) |
| Checking software  | checkingSoftware  | [rsqa:checkingSoftware](https://w3id.org/everse/rsqa#checkingSoftware)   | [rs:SoftwareApplication](https://w3id.org/everse/rs#SoftwareApplication)                     |
| Process            | process           | [schema:actionProcess](https://schema.org/actionProcess)                 | [schema:Text](https://schema.org/Text) (String)                                              |
| Status             | status            | [schema:actionStatus](https://schema.org/actionStatus)                   | [schema:ActionStatusType](https://schema.org/ActionStatusType) (URL)                         |
| Output             | output            | [rsqa:checkOutput](https://w3id.org/everse/rsqa#checkOutput)             | One of `pass`, `fail`, `not_applicable` (String). See [Check output values](#check-output-values) |
| Evidence           | evidence          | [rsqa:checkEvidence](https://w3id.org/everse/rsqa#checkEvidence)         | [schema:Text](https://schema.org/Text)  (String)                               |
| Raw value          | raw_value         | [rsqa:checkRawValue](https://w3id.org/everse/rsqa#checkRawValue)         | [schema:Text](https://schema.org/Text)  (String)                               |
| Threshold          | threshold         | [rsqa:checkThreshold](https://w3id.org/everse/rsqa#checkThreshold)       | [schema:Text](https://schema.org/Text)  (String)                               |

Required keys: `@type`, `assessesIndicator`, `checkingSoftware`, `status`, and `output` when the status is `schema:CompletedActionStatus`.

When `checkingSoftware` has an `@id`, it must follow the pattern `https://w3id.org/everse/tools/<name>`.

### Check output values

`output` holds the verdict of the check. The schema fixes its values so that results from different tools can be compared and aggregated. A tool must map its own result (`true`, `valid`, a score above a threshold...) to one of these values:

| Value            | Meaning                                                                                                                              |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `pass`           | The check ran and the software meets the indicator.                                                                                  |
| `fail`           | The check ran and the software does not meet the indicator.                                                                          |
| `not_applicable` | The indicator does not apply to this software, for example a Python linter run on a project with no Python code. Aggregators should leave these checks out of scores rather than count them as failures. |

Values are lowercase strings. Do not use `true`/`false` or JSON booleans.

`output` and `status` answer two different questions:

- `status` tells whether the check ran. Use `schema:CompletedActionStatus` when the tool ran to the end, and `schema:FailedActionStatus` when it could not run (network error, service down, tool crash).
- `output` gives the verdict. It is required when `status` is `schema:CompletedActionStatus` and must be absent otherwise, since a check that did not run has no verdict. Put the reason for the failure in `evidence`.

The raw measurement (a percentage, a count, a score) goes in `raw_value`, and the criterion used to turn it into a verdict goes in `threshold`.

A value for checks that ran but could not reach a conclusion (`indeterminate`) is under discussion in [issue #61](https://github.com/EVERSE-ResearchSoftware/schemas/issues/61).

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

The normalised verdict of the check: `pass`, `fail` or `not_applicable`. See [Check output values](#check-output-values).

- Domain: rsqa:CheckResult
- Range: schema:Text (restricted to `pass`, `fail`, `not_applicable`)
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

## Validation

[`assessment_schema_validator.json`](assessment_schema_validator.json) is a [JSON Schema](https://json-schema.org/) (draft 2020-12) that checks an assessment file against this specification: required keys, allowed `output` and `status` values, date and URI formats. It validates the JSON document as written and does not expand the JSON-LD.

With Python and [`jsonschema`](https://pypi.org/project/jsonschema/) (install `jsonschema[format]` so that date and URI formats are checked too):

```python
import json
from jsonschema import Draft202012Validator, FormatChecker

schema = json.load(open("assessment_schema_validator.json"))
assessment = json.load(open("example.json"))
Draft202012Validator(schema, format_checker=FormatChecker()).validate(assessment)
```

Or from the command line with [`check-jsonschema`](https://pypi.org/project/check-jsonschema/):

```
check-jsonschema --schemafile assessment_schema_validator.json example.json
```

The latest version of the vocabulary is accessible at [https://w3id.org/everse/rsqa](https://w3id.org/everse/rsqa).

To obtain the JSON-LD context, just perform content negotiation as follows:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rsqa
```

The vocabulary has versioning enabled. To get a particular version add the version number in the URL:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rsqa/0.0.3
```
