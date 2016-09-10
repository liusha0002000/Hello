#!/usr/bin/ruby

def FileSwapStr(filename, old_str, new_str)
    if !File::exist?(filename)
        return nil
    end
    bakFile = File.new(filename+"~", "w+")
    if bakFile == nil
        return false
    end
    
    IO.foreach(filename) { |line|
        puts line
        newline = line.gsub(old_str, new_str)
        puts newline
        bakFile.puts(newline)
    }
    
    bakFile.close
    return true
end

if ARGV.length == 2
    ret = FileSwapStr("D:\\testSource\\ruby\\testfile.txt", ARGV[0], ARGV[1])
    if ret == nil
        puts "file does not exist"
    elsif ret == false
        puts "file string swap failed"
    else
        puts "file string swap successfully"
    end
else
    puts "arguments fault"
end

