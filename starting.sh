PS3="Select the conteiner will be run: "

select opt in Ansible Terraform  I_want_quit; do

  case $opt in
    Ansible)
      cd ansible
      docker run --rm  \
      -v $(pwd)/playbook:/ansible/playbook \
      -v $(pwd)/hosts:/ansible/hosts \
      -it $(docker build -q .)
      ;;
    Terraform)
      cd terraform
      docker run --rm \
      -v $(pwd)/environment:/terraform/environment \
      -v $(pwd)/cloud-init:/terraform/cloud-init \
      -it $(docker build -q .)   
      ;;
    I_want_quit)
      break
      ;;
    *) 
      echo "Invalid option $REPLY"
      ;;
  esac
done
