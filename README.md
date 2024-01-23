## Trino Gateway (by Trino) Integration

This repository contains a minimal docker compose setup to run Trino Gateway (by Trino) with Trino.

### Considerations

- I am using the **Version 4** of Trino Gateway (by Trino) which is the latest version at the time of writing this README.
- During the setup, I am following the instructions from the [Trino Gateway (by Trino) documentation](https://github.com/trinodb/trino-gateway/blob/main/docs/quickstart.md).

### Acknowledgements

- Trino Gateway Introdution on Trino Summit 2023. [YouTube](https://youtu.be/2qwBcKmQSn0)
- Trino Gateway (by Trino) documentation. [GitHub](https://github.com/trinodb/trino-gateway)

### Pre-requisites

- Cloudflare Tunnel. Please follow the steps mentioned [here](https://youtu.be/ey4u7OUAF3c) by NetworkChuck on YouTube. Get a `cloudflare access` token from Zero Trust.

### Running Trino Gateway Locally

#### Set Cloudflare Access Token

```bash
export CLOUDFLARE_TOKEN=<cloudflare access token>
```

#### Running with Docker Compose

```
docker-compose up -d
```

![Docker Compose](assets/image.png)

#### Add Trino Cluster to Trino Gateway

```json
{
  "name": "trino-1",
  "proxyTo": "{PUT YOUR TRINO COORDINATOR TUNNEL URL HERE}",
  "active": true,
  "routingGroup": "adhoc"
}
```

![Cloudflare Tunnel](assets/image-2.png)

```bash
./add-trino-cluster.sh
```

#### Check Trino Gateway UI

Access Trino Gateway UI at http://localhost:9081

![Trino Gateway UI](assets/image-1.png)

#### Executing Query with Trino CLI

Connect to Trino Gateway with Trino CLI (You can use `localhost:9080` or `tunnel URL`)

```bash
trino --server http://localhost:9080 --user nilanjan
```

![Trino CLI](assets/image-3.png)

---

Made with ❤️ by [nil1729](https://github.com/nil1729)
