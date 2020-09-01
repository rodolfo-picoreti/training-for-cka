
## Running

```shell
./generate-certs.sh

./generate-kubeconfigs.sh

# Do not rerun this command if already in use. Otherwhise etcd content will be encrypted with another
# key and we will not be able to read it.
./generate-secret-encryption-config.sh

vagrant up

# Allow Api server to access kubelet Api so we can perform actions like logs/exec.
./create-kubelet-rbac.sh

./create-coredns.sh
```

## References
**Components**: https://kubernetes.io/docs/concepts/overview/components/
