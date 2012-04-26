require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Cedet < Formula
  homepage 'http://cedet.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/cedet/cedet/cedet-1.1.tar.gz'
  md5 'a570ed74bfe8b5690e48d01518c2bd29'
  depends_on 'emacs'
 
  if ARGV.include? "--use-git-head"
    head 'http://git.randomsample.de/cedet.git'
  else
    head 'bzr://cedet.bzr.sourceforge.net/bzrroot/cedet/code/trunk'
  end
  
  def options
    [
      ["--use-git-head", "Use randomsample.de git mirror for HEAD builds"],
    ]
  end

  def install
   
    if ARGV.build_head?
      # Highly experimental and will make you sad
      system "make EMACS=/usr/local/Cellar/emacs/HEAD/emacs"
      prefix.install Dir["*"]
    else
       system "emacs -Q -batch -l cedet-build.el -f cedet-build -f save-buffers-kill-terminal"
       prefix.install Dir["*"]
    end
    
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test cedet`.
    system "true"
  end
end
