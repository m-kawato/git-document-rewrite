#!/usr/bin/ruby
# -*- coding: utf-8 -*-

SRCDIR_BASE = 'git-doc-orig'
DSTDIR_BASE = 'git-doc'
DIRS = ['.', 'technical', 'howto']

DIRS.each {|dir|
  srcdir = "#{SRCDIR_BASE}/#{dir}"
  dstdir = "#{DSTDIR_BASE}/#{dir}"

  Dir.glob("#{srcdir}/*.html") {|infile|
    outfile = "#{dstdir}/#{File.basename(infile)}"
    puts "#{infile} -> #{outfile}"

    fout = open(outfile, 'w')
    open(infile) {|fin|
      fin.each {|line|
        line.gsub!(/: serif/, ": DejaVu Sans, Verdana, sans-serif")
        line.gsub!(/: sans-serif/, ": DejaVu Sans, Verdana, sans-serif")
        if line =~ /^tt \{/
          line << "  font-family: Courier New, monospace;\n"
        end
        fout.write(line)
      }
    }
    fout.close
  }
}
