require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Cedet < Formula
  homepage 'http://cedet.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/cedet/cedet/cedet-1.1.tar.gz'
  md5 'a570ed74bfe8b5690e48d01518c2bd29'
  depends_on 'emacs'

  def install                       
    system "emacs -Q --batch -l cedet-build.el -f cedet-build -f save-buffers-kill-terminal"
    prefix.install Dir["*"]
    ohai 'Configure CEDET in your .emacs file by adding code like this:'
    ohai "  (load-file \"/usr/local/Cellar/cedet/" << version << "/common/cedet.el\")"
    ohai '  (global-ede-mode 1)                      ; Enable the Project management system'
    ohai '  (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion'
    ohai '  (global-srecode-minor-mode 1)            ; Enable template insertion menu'
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test cedet`.
    system "true"
  end
end
