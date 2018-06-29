#/bin/sh
function USAGE(){
	echo "usage: ./docker_operation.sh [-s <servername>] [-t <servername>]"
	echo "Enter the container's shell environment"
	echo "	-s servername	servername：The name of the currently running container, fuzzy match"
	echo ""
	echo "Connect directly to the service in the container"
	echo "	-t servername   servername: The name of the currently running container, fuzzy match"
}
function USAGE_T() {
	echo "Available Server Name: mysql/mcd/mcq/redis"
}
while getopts :s::t: opt
do
	case "$opt" in
		s)
			echo "Enter docker-$OPTARG's shell"
			c=`docker ps -a | grep $OPTARG | awk '{print $1}' | wc -l`
			if [ $c -gt 1 ]
			then
				echo "Error: The command returns more than one value "
				docker ps -a | grep $OPTARG
				exit 1
			fi
			docker exec -it $(docker ps -a | grep $OPTARG | awk '{print $1}') /bin/sh
			;;
		t)
			case "$OPTARG" in
		        "mysql")
		                echo "/usr/local/mysql/bin/mysql -P3310 -udev -p123456"
		                ;;
		        "mcd")
						echo "telnet localhost 11221"
		                telnet localhost 11221
		                ;;
		        "mcq")
						echo "telnet localhost 22300"
		                telnet localhost 22300
		                ;;
		        "redis")
						echo "redis-cli -h localhost -p 6780"
		                redis-cli -h localhost -p 6780
		                ;;
		        *)
					echo "Server $OPTARG Not Found"
					USAGE_T
					exit 1
					;;
			esac
			;;
		:)
			echo "The option -$OPTARG requires an argument"
			exit 1
			;;
		?)
			echo "Invalid option"
			USAGE
			exit 1
			;;
	esac
done