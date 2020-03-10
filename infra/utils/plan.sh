operate(){
  terraform plan $@
}
source `git rev-parse --show-toplevel`/infra/utils/.operate.sh
