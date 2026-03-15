require "./spec_helper"

describe CrystalClear do

  # ensure shard version and CrystalClear version is the same
  it "checks shard vs lib version" do
    shard_version = ""
    if File.read("shard.yml") =~ /version: ([0-9\.]+)/
      shard_version = $1
    end
    shard_version.should eq(CrystalClear::VERSION)
  end

  # runs examples and check raw output
  it "checks colors example output" do
    Process.run("crystal", args: ["run", "example/colors.cr"], output: stdout = IO::Memory.new)
    stdout.to_s.should eq(File.read("spec/colors.raw"))
  end

  # hyperlink
  it "checks hyperlink" do
    link = CrystalClear::Hyperlink.new("https://github.com/bitmand/crystal_clear", "CrystalClear Github page")
    link.print.should eq(File.read("spec/hyperlink.raw"))
  end

  # spinner
  it "checks spinner example output" do
    Process.run("crystal", args: ["run", "example/spinner.cr"], output: stdout = IO::Memory.new)
    stdout.to_s.should eq(File.read("spec/spinner.raw"))
  end

  # terminal size
  it "checks terminal size" do
    term = CrystalClear::Terminal.new
    term.size.cols.should be > 0
    term.size.cols.should be < 1000
    term.size.rows.should be > 0
    term.size.rows.should be < 1000
    term.size.width.should be > 0
    term.size.width.should be < 10000
    term.size.height.should be > 0
    term.size.height.should be < 10000
  end

end
