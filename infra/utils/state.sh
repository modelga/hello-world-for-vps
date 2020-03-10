operate(){
  terraform state $@
}
source `git rev-parse --show-toplevel`/infra/utils/.operate.sh
