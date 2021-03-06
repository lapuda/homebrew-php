require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php72Maxminddb < AbstractPhp72Extension
  init
  desc "Extension for MaxMind DB file format"
  homepage "https://github.com/maxmind/libmaxminddb"
  url "https://github.com/maxmind/MaxMind-DB-Reader-php/archive/v1.1.0.tar.gz"
  sha256 "0c80f55bc56dd8f26b04358b5533f78adcb060f721b4347f510cbf43f32848b4"
  revision 1

  bottle do
    cellar :any
    sha256 "ad55f4906b073caabd06b530b05180bb0968f5daa4dd7b727a417083e3c9d43b" => :sierra
    sha256 "a7999d555e190762dcb77d086420793a8f192bdb4f6f1ddd4c920d17bd434249" => :el_capitan
    sha256 "9506c848d7d88fb783f77cca748bd5330cd3d0a282529ce91162f351e388cff0" => :yosemite
  end

  depends_on "libmaxminddb"

  def install
    Dir.chdir "ext"

    safe_phpize
    system "./configure", "--prefix=#{prefix}", "--with-maxminddb=#{Formula["libmaxminddb"].opt_prefix}", phpconfig
    system "make"
    prefix.install "modules/maxminddb.so"
    write_config_file if build.with? "config-file"
  end
end
