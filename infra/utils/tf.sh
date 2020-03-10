operate(){
  terraform $@
}
source `git rev-parse --show-toplevel`/infra/utils/.operate.sh
