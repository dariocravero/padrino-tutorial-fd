Gem::Specification.new do |s|
  s.name          = 'padrino-tutorial'
  s.version       = '0.0.1'
  s.authors       = ['Ankita Shukla', 'Divya Upadhyay', 'Darío Javier Cravero']
  s.email         = ['ankitashukla707@gmail.com', 'divyaupadhyay42@gmail.com', 'dario@uxtemple.com']
  s.summary       = %q{ Padrino tutorial }
  s.description   = %q{ This is series of tutorials trying to show how would you go about building
                        a chat platform on the Padrino Ruby Web Framework.}
  s.homepage      = ''
  s.license       = 'MIT'
  s.files         = Dir['LICENSE', 'README.md', 'Gemfile', 'Gemfile.lock', 'Rakefile',
                        'lib/**/*.rb', 'test/**/*.rb']

  ['bundler', 'cutest', 'rake', 'pry'].each { |dep| s.add_development_dependency dep }
end
