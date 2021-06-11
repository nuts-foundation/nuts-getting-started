## TLS configuration
There is a root CA which issues the TLS client- and server certificates for the nodes. The CA certificate is present
in the `truststore.pem` file. The TLS certificate and corresponding private keys of the nodes are present in their
respective directories in the `certificate.pem` file.

To regenerate the root CA certificate and reissue node certificates run the `generate.sh` script. You shouldn't need
to do this unless:

* the node or root CA certificates expire (1 year and 3 years),
* when a node is added,
* or when a node is renamed (because TLS certificates need to contain the right hostname).

The nodes to generate a certificate for are specified in `generate.sh`.