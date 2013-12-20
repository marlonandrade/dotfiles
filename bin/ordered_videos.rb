#!/usr/bin/env ruby

videos = Dir.glob('*.webm').sort_by { |filename| `stat -f %B "#{filename}"` }

videos.each_with_index do |video, index|
  File.rename(video, sprintf('%03d %s', index + 1, video))
end
