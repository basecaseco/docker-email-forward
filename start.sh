if [ -z "$POSTFIXETC" ]; then
    POSTFIXETC=/etc/postfix
fi
MAINCF=$POSTFIXETC/main.cf
VIRTUAL=$POSTFIXETC/virtual

if [ -z "$DOMAINS" ]; then
    echo 'DOMAINS environment variable missing'
    exit 1
fi
postconf virtual_alias_domains=$DOMAINS
postconf myhostname=`hostname`

if [ ! -z "$EMAILS" ]; then
    : > $VIRTUAL
    IFS=';'
    LINES=($EMAILS)
    for LINE in ${LINES[@]}; do
        echo "$LINE" >> $VIRTUAL
    done
    postmap $VIRTUAL
fi

echo 'starting postfix...'
postfix start
if [ $? -ne 0 ]; then
    echo 'postfix start failed'
    exit 1
fi

while true; do
    sleep 60
    postfix status
    if [ $? -ne 0 ]; then
        echo 'postfix stopped'
        exit 1
    fi
done
