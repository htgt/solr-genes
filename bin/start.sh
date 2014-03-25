set -e

PORT="8983"
JAVA_BIN=$(which java)

function usage_and_die {
        echo "Usage: $0 [-p port]"
        echo ""
        echo "-p :      Port (default: ${PORT})"
        echo ""
        echo "e.g. to start:"
        echo "$0 -p ${PORT}"
        echo ""
        exit 1
}

while getopts "p:h" opt; do
        case $opt in
        p)
                PORT=$OPTARG
                ;;
        h)
                usage_and_die
                ;;
        esac
done

set -x
#exec $JAVA_BIN -Dsolr.solr.home=multicore -Djetty.port=${PORT} -jar start.jar
exec $JAVA_BIN -Dsolr.solr.home=solr -Djetty.port=${PORT} -jar start.jar
