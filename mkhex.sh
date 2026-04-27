set -e

makecode --hw mbcodal -f size
makecode --hw mbcodal -c mkc-yahboomtinybit.json -f size
cp ./built/mbcodal-binary.hex ./assets/vyse-s1-for-microbit-v2.hex

cd protocol
makecode --hw mbcodal
