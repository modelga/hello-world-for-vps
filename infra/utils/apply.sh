operate(){
  terraform apply $@
}
source `git rev-parse --show-toplevel`/infra/utils/.operate.sh