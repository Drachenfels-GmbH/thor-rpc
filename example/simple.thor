class Simple < Thor
  desc "foobar", "useless method"
  def foobar
    "useless method"
  end

  desc "fooarg NUMBER", "useless method with parameter"
  def fooarg(num)
    "fooarg #{num}"
  end
end