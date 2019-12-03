# Open Android emulator if it doesn't run already
cd $ANDROID_HOME/emulator
SERVICE="qemu-system-x86"
RESULT=`pgrep $SERVICE`
if [ "${RESULT:-null}" = null ]; then
    ./emulator -avd Pixel_XL_API_27 &
else
    echo "Emulator is already running!"
fi

# Change to imFootballNative directory
cd ~/Dokumente/React/WhatsAppReact

# Kill Storybook Native 
for pid in $(lsof -t -i:7007); do 
  NAME=`ps -p $pid -o comm=`
  if [ "$NAME" == "node" ]; then 
    kill -9 $pid
  fi
done

# Kill running Metro Bundler 
for pid in $(lsof -t -i:8081); do 
  NAME=`ps -p $pid -o comm=`
  if [ "$NAME" == "node" ]; then 
    kill -9 $pid
  fi
done

# Start a new Metro Bundler
#node ./rn-cli-config.js &
react-native start &

# Wait 5 seconds for the Metro Bundler to start
sleep 5

# Start React Native App
npx react-native run-android
