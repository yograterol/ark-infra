# Ark-infra

Ark Docker and built

## Build Ark in a single binary

**Requirements:**

- git
- node
- pkg https://github.com/zeit/pkg

```bash
$ ./ark-to-bin.sh
```

**NOTE:** It's important keeping the file called `addon.node` because pkg doesn't put into the binary the Node compiled modules.
