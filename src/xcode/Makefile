default:
	xcodebuild -target "mobbl-core-lib" -configuration Release
	xcodebuild -target "mobbl-core-lib-universal" -configuration Release
	BUILD_DIR="build" BUILD_STYLE="Release" sh ../Scripts/CombineLibs.sh
	sh ../Scripts/iPhoneFramework.sh

# If you need to clean a specific target/configuration: $(COMMAND) -target $(TARGET) -configuration DebugOrRelease -sdk $(SDK) clean
clean:
	-rm -rf build/*

test:
	GHUNIT_CLI=1 xcodebuild -target mobbl-core-lib-universal -configuration Debug -sdk iphonesimulator4.3 build
