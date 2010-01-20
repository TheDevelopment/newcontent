class Content < ActiveRecord::Base
  attr_accessor :moved
  def whats_new(limit = 10)
    Content.find(:all, :limit => limit, :order => "created_at desc")
  end

  def self.identify(file)
    md5 = Digest::MD5.hexdigest(File.read(file))
    path = File.dirname(File.expand_path(file))
    filename = File.basename(file)

    content = Content.find_by_md5_hash(md5)
    content.moved = true if content && (content.path != path || filename != content.filename)

    return content
  end

  def moved?
    return true if moved
  end

  def self.create_by_file(file)
    md5 = Digest::MD5.hexdigest(File.read(file))
    path = File.dirname(File.expand_path(file))
    filename = File.basename(file)

    content = Content.find_by_path(path)
    if content && content.filename == filename
      #our file has been modified
      content.md5_hash = md5
      content.save!
      puts "modified file #{content.filename}"

    else
      #we have unique content
      content = Content.create!(:filename => filename,
                                :path => path,
                                :md5_hash => md5)
      puts "new file #{content.filename}"
    end

    return content
  end

  def update_by_file(file)
    md5 = Digest::MD5.hexdigest(File.read(file))
    path = File.dirname(File.expand_path(file))
    filename = File.basename(file)

    self.filename = filename
    self.path = path
    self.md5_hash = md5
  end
end
