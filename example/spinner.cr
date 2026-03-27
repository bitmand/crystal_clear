require "../src/crystal_clear"

spinner = CrystalClear::Spinner.new(text: "Loading something... ")

# Working on something else for 5 sec...
sleep 5.seconds

spinner.stop "done!"

sleep 1.second / 2
