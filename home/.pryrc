# 
# Configuration for Pry
#
Pry.config.editor = "mvim -f"

Pry.config.commands.alias_command "c", "continue"
Pry.config.commands.alias_command "s", "step"
Pry.config.commands.alias_command "n", "next"
Pry.config.commands.alias_command "@", "whereami"

Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]
