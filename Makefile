create-avd:
	cd /usr/lib/android-sdk/emulator
	echo no | avdmanager create avd -n Android28 -k "system-images;android-28;google_apis;x86"

start-avd:
	emulator -avd Android28
