require 'fileutils'
require 'tempfile'

class FileWriter
  DEFAULT_ENCODING = 'UTF-8'

  def initialize destination_dir:, filename:, encoding: DEFAULT_ENCODING
    @destination_dir = destination_dir
    @filename = filename
    @encoding = encoding

    @tempfile = Tempfile.new(@filename)
  end

  def write chunk
    @tempfile.write encode(chunk)
  end

  def finalize
    @tempfile.close
    copy_tempfile
    @tempfile.unlink
  end

  private

  def encode chunk
    chunk.to_s.force_encoding(@encoding)
  end

  def copy_tempfile
    create_destination_directory
    FileUtils.copy_file @tempfile.path, File.join(@destination_dir, @filename)
  end

  def create_destination_directory
    FileUtils.mkdir_p(@destination_dir) unless File.exist?(@destination_dir)
  end
end
