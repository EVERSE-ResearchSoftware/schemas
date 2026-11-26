# RS Metadata
A repository to describe the RS metadata schema used in the EVERSE project and RSQKit.

This schema builds on CodeMeta and Schema.org.

The `dev` folder contains the latest version under development of the vocabulary.

The folders with numbers refer to the the different available releases.

The latest version of the vocabulary is accessible at [https://w3id.org/everse/rs](https://w3id.org/everse/rs)

To obtain the JSON-LD context, just perform content negotiation as follows:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rs
```

The vocabulary has versioning enabled. To get a particular version add the version number in the URL:

```
curl -sH "accept:application/ld+json" -L https://w3id.org/everse/rs/0.0.1
```

