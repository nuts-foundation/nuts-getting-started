# Generate CA
openssl ecparam -genkey -name prime256v1 -noout -out ca.key
openssl req -x509 -new -nodes -key ca.key -sha256 -days 1825 -out ca.pem -subj "/CN=Root CA"

function generateCertificate {
  HOST=$1
  TARGET=$2
  echo Generating key and certificate for $HOST
  openssl ecparam -genkey -name prime256v1 -noout -out $HOST.key
  openssl req -new -key $HOST.key -out $HOST.csr -subj "/CN=${HOST}"

  local_openssl_config="
  authorityKeyIdentifier=keyid,issuer
  basicConstraints=CA:FALSE
  keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
  extendedKeyUsage = serverAuth, clientAuth

  [alt_names]
  subjectAltName = DNS:${HOST}
  "
  cat <<< "$local_openssl_config" > node.ext
  openssl x509 -req -in $HOST.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out $HOST-cert.pem -days 825 -sha256 \
    -extfile node.ext \
    -extensions alt_names

  cat $HOST-cert.pem > $TARGET
  cat $HOST.key >> $TARGET
  rm $HOST-cert.pem
  rm $HOST.key
  rm $HOST.csr
  rm node.ext
}

# Generate certificates for nodes. The first argument is the hostname, the second argument the file name where the certificate and key will be stored.
generateCertificate vendorA-nuts vendorA/certificate.pem
generateCertificate vendorB-nuts vendorB/certificate.pem

# Cleanup
rm ca.key
rm ca.srl
mv ca.pem truststore.pem