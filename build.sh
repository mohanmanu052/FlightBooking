# flutter doctor
# flutter clean

project_root=$(pwd)
temp_build_dir="${project_root}/tempbuild"
asset_dir="${project_root}/assets"

# Create the temporary build directory if it doesn't exist
mkdir -p "${temp_build_dir}"

# Exclude asset folder and copy other folders to temp_build_dir
find "${project_root}" -maxdepth 1 -type d ! -path "${temp_build_dir}" ! -path "${asset_dir}" ! -path "${project_root}" |
while read -r dir; do
    cp -r "$dir" "${temp_build_dir}"
done

# Copy pubspec.yaml to temp_build_dir
cp "${project_root}/pubspec.yaml" "${temp_build_dir}"

# Change directory to temp_build_dir
cd "${temp_build_dir}" || exit

# Install dependencies
flutter pub get

# Build the APK using Flutter
flutter build apk

# Move the built APK back to the project root
mv "${temp_build_dir}/build/app/outputs/flutter-apk/app-release.apk" "${project_root}/app-release.apk"

# Clean up: Remove the temporary build directory
cd "${project_root}" || exit
rm -rf "${temp_build_dir}"

# mkdir temp_build

# # Copy necessary files to the temporary directory
# cp -r lib/ temp_build/
# # ...copy any other required files/folders

# # Exclude the assets folder
# mkdir -p temp_build/assets
# # ...copy other required assets, if any

# # Build APK using the temporary directory as the source
# flutter build apk --target=temp_build/main.dart

# # Clean up the temporary directory
# rm -rf temp_build
# # Build App module
# flutter pub get
# flutter build apk
# flutter pub run build_runner build --delete-conflicting-outputs

# Build Book Solutions module
# cd features/book_solutions
# flutter pub get
# flutter pub run build_runner build --delete-conflicting-outputs

# # Build Base module
# cd ../base
# flutter pub get
# flutter pub run build_runner build --delete-conflicting-outputs

# cd ../..

# # Building PWF plugin
# cd plugins/pwf
# sh build_pwf_plugin.sh