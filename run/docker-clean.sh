data_path=`cd "$(dirname "$0")"; pwd`
if [[ "$1" = "stop" ]]; then
  docker stop $(docker ps -a -q)
elif [[ "$1" = "rm" ]]; then
  docker stop $(docker ps -a -q)
  docker rm `docker ps -a -q`
elif [[ "$1" = "rmi" ]]; then
  docker stop $(docker ps -a -q)
  docker rm `docker ps -a -q`
  docker rmi $(docker images -q)
elif [[ "$1" = "clean" ]]; then
  docker stop $(docker ps -a -q)
  docker rm `docker ps -a -q`
  docker rmi $(docker images -q)
  rm -rf $data_path/data0/nginx/logs
  rm -rf $data_path/data0/nginx/www
  rm -rf $data_path/data0/php_log
  rm -rf $data_path/data0/redis
  rm -rf $data_path/data0/mysql/
else
  echo ""
  echo "    stop : 停止运行的容器。"
  echo ""
  echo "    rm   : 删除所有容器。"
  echo ""
  echo "    rmi  : 删除所有的镜像。"
  echo ""
  echo "    clean: 清除所有数据：停止并删除所有容器与镜像，包括data0的内容。"
fi
