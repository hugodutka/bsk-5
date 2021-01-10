### Generate a private key:

```bash
openssl genrsa -out ca.key 4096
```

### Encrypt the key:

```bash
openssl aes-256-cbc -pbkdf2 -in ca.key -out ca.key.encrypted
```

The password I used is: `notsecure`.

### Decrypt the key:

```bash
openssl aes-256-cbc -pbkdf2 -d -in ca.key.encrypted -out ca.decrypted.key
```

### Generate a Certificate Authority

```bash
openssl req -new -x509 -days 2920 -key ca.key -out ca.crt
```

### Generate a CSR

```bash
openssl genrsa -out prac.gfb.intra.key 4096
openssl req -new -key prac.gfb.intra.key -out prac.gfb.intra.csr
```

### Generate a Certificate

```bash
openssl x509 -req -days 540 -in prac.gfb.intra.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out prac.gfb.intra.crt
```
