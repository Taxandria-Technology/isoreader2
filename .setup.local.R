cat('\t\tChecking installation of pkgbuild\n')
if (!requireNamespace('pkgbuild', quietly = FALSE)) {
  cat('\t\t\tpkgbuild not installed. Installing now...\n')
  install.packages('pkgbuild')
  cat('\t\t\tpkgbuild installed.\n')
}
cat('\t\t\tpkgbuild checking build tools...\n')
pkgbuild::check_build_tools()

cat('\t\tChecking installation of pak...\n')
if (!requireNamespace('pak', quietly = FALSE)) {
  cat('\t\t\tpak not installed. Installing now...\n')
  install.packages('pak')
  cat('\t\t\tpak installed.\n')
}

cat('\t\tbuilding isoreader locally...\n')
# Build isoreader2 locally
pak::pak('.')
cat('\t\tisoreader built.\n')
library('isoreader2')
cat('\t\tInstalling isoextract...\n')
isoreader2::ir_check_isoextract(ask_permission = FALSE, install_if_missing = TRUE)
cat('\t\tisoextract installed.\n')
cat('\t\tSetup finished.\n')
