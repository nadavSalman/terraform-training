source conf.env

USER_INPUT=$1
echo "input:  $USER_INPUT"
case "$USER_INPUT" in
con)
    terragrunt refresh
    terragrunt console
    ;;
create)
    terraform validate
    terragrunt refresh
    terragrunt plan
    terragrunt apply
    ;;
kill)
    terraform validate
    terragrunt destroy
    ;;
*)
    echo "Unexpected param, allowed only [create] or [kill] or [con]-(console) "
    exit 0
    ;;
esac