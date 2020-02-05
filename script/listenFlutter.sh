echo 'start listen flutter'
#nohup ${FLUTTER_ROOT}/bin/flutter listen & 
#${FLUTTER_ROOT}/bin/flutter listen > stdout.txt 2> stderr.txt < /dev/null &

${FLUTTER_ROOT}/bin/flutter listen  --app-id=com.gujitao.helloFlutter  --vscode-path=/Users/gujitao001/Documents/github/hello_flutter/.vscode/launch.json > stdout.txt 2> stderr.txt < /dev/null &


echo 'already started listen'

