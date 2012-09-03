require File.dirname(__FILE__) + '/../config/environment'

require 'yaml'

logfile = "/Users/mike/Dropbox/panopticon/log.txt"
#logfile = "/Users/mike/smttools/smt_config.yml"

log = YAML.load_file(logfile)

log.each do |l|
  puts l.inspect
  title = l['title']
  kind = l['kind']
  source = l['source']
  next if found = Entry.find(:first, :conditions => ['title = ? AND source = ? AND kind = ?',title,source,kind])
  e = Entry.new
  e.title = title
  e.kind = kind
  e.source = source
  e.date = Date.parse(l['date'])
  if l['url']
    e.url = l['url']
  end

  puts e.inspect
  e.save

end
