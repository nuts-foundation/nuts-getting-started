This directory contains files needed to run a local development network with a bootstrap node and 2 others.

# Local Network

## Starting services
### Linux/MacOS/Cygwin

Run the following command to start a local network environment (or run `make` from the `local` directory):

```shell script
make -f local/Makefile
```

### Windows

TBD

## Applications

After the Docker services have started the applications can be accessed on the following URLs:

**Service Provider Administration**

Application for managing service provider registration and customers (care organizations).

URL (Vendor A): http://localhost:1303

URL (Vendor B): http://localhost:1403

Username: demo@nuts.nl

Password: demo

**Care Organization EHR**

Care organization's Electronic Health Record (EHR) application, used by care professionals to administer patient information.
Communicates with other EHRs via the vendor's Nuts Node to exchange health information. 

URL (Vendor A): http://localhost:1304

URL (Vendor B): http://localhost:1404

# Development Network
To start a node and connect to the remote development network, use to commands above (for the local network) but replace the directory `local` with `development`, e.g.:

```shell script
make -f development/Makefile
```

# Features

## Resetting

When you've produced s

## Demo EHR: IRMA authentication using `ngrok`
You can log into Demo EHR using IRMA using the IRMA app when your registered care organization's `Domain` matches the domain of the IRMA e-mail attribute.
For this flow to work the IRMA app needs to communicate with the IRMA services within the Nuts Node, which normally doesn't work when running locally.
To allow external access to the Nuts Node (for development purposes) you can use `ngrok`.
If you want to authenticate using IRMA, just make sure `ngrok` is running when you start the Docker containers.
The `run.sh` (or Makefile) will configure the Nuts Node with the hostname served by `ngrok`.

`ngrok` will need to proxy port 1323:

```shell script
ngrok http 1323
```