class Scan
  include Singleton

  def begin(path)
    Dir.glob("**/**").each do |file|
      next if File.directory?(file)

      content = Content.identify(file)
      if content && !content.moved?
        #We have a match for files.
      elsif content && content.moved?
        #We have moved or renamed the original file
        content.update_by_file(file)
      else
        #We don't have a match. It's a new file
        content = Content.create_by_file(file)
      end
    end
  end

end
