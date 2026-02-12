require "../src/crystal_clear"

CrystalClear::Spinner.start "Loading something... "

# Working on something for 5 sec...
sleep 5.seconds

CrystalClear::Spinner.stop "done!\n"
