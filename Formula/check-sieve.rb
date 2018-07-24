class CheckSieve < Formula
  desc "Syntax checker for mail sieve scripts"
  homepage "https://github.com/dburkart/check-sieve"
  url "https://github.com/dburkart/check-sieve/archive/check-sieve-0.5.tar.gz"
  sha256 "6a058d660de758aa4372ffb745d2bc8a9d4c39ddd136636f3541f2a0815dcfb2"
  head "https://github.com/dburkart/check-sieve.git"

  bottle do
  end

  def install
    system "make", "check-sieve"
    bin.install "check-sieve"
    lib.install "libchecksieve.a"
  end

  test do
    (testpath/"test.sieve").write <<~EOS
      require ["fileinto"];
      fileinto "INBOX";
    EOS
    system "#{bin}/check-sieve", "test.sieve"
  end
end
