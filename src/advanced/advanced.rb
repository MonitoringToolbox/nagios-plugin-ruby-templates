#!/usr/bin/env ruby

# -------------------------------------------------------------------------------- #
# Description                                                                      #
# -------------------------------------------------------------------------------- #
# This Nagios check script serves as a more sophisticated example that uses        #
# utility functions to guarantee the accuracy of the output and exit code.         #
#                                                                                  #
# Unlike the basic version, this one utilizes command-line parameters to override  #
# the default hard-coded values, thereby enabling more advanced or portable        #
# scripting. Nevertheless, we also supply a basic version suitable for checks that #
# don't demand parameters.                                                         #
# -------------------------------------------------------------------------------- #

require 'optparse'

# -------------------------------------------------------------------------------- #
# Main()                                                                           #
# -------------------------------------------------------------------------------- #
# This function is where you add all of the check related code. You can define     #
# additional functions and call them as needed.                                    #
#                                                                                  #
# For this template we simply generate a random number and demonstrate how to      #
# call the core functions to handle the various states. Real tests will be more    #
# complex and involved but should follow the same basic pattern.                   #
# -------------------------------------------------------------------------------- #

def main(options)
    test_value = rand(1..100)

    if test_value >= options[:critical_level]
        handle_critical("Test Value = #{test_value}")
    elsif test_value >= options[:warning_level]
        handle_warning("Test Value = #{test_value}")
    elsif test_value >= 0
        handle_ok("Test Value = #{test_value}")
    else
        handle_unknown("Test Value = #{test_value}")
    end
end

# -------------------------------------------------------------------------------- #
# Process Arguments                                                                #
# -------------------------------------------------------------------------------- #
# This function handles the input from the command line. In this template, we've   #
# included an illustration of how to retrieve and process fresh warning and        #
# critical values. All the inputs are stored in the 'options' hash and then passed #
# on to main().                                                                    #
#                                                                                  #
# You can add as many fresh inputs as your check requires.                         #
# -------------------------------------------------------------------------------- #

def process_arguments
    # Default values - which will be overridden by command line inputs
    options = { :warning_level => 75, :critical_level => 90 }

    optparse = OptionParser.new do |opts|
        opts.banner = "Usage: #{$PROGRAM_NAME}"

        opts.on('-h', '--help', 'Display this screen') do
            puts opts
            exit(1)
        end

        opts.on('-c', '--critical value', "Critical level [Default: #{options[:critical_level]}]") do |critical|
            options[:critical_level] = critical.to_f
        end

        opts.on('-w', '--warning value', "Warn level [Default: #{options[:warning_level]}]") do |warning|
            options[:warning_level] = warning.to_f
        end
    end
    optparse.parse!

    handle_unknown('Warn level MUST be lower than Critical level') if options[:warning_level] >= options[:critical_level]

    main(options)
end

# -------------------------------------------------------------------------------- #
# STOP HERE!                                                                       #
# -------------------------------------------------------------------------------- #
# The functions listed below are integral to the template and do not necessitate   #
# any modifications to use this template. If you intend to make changes to the     #
# code beyond this point, please make certain that you comprehend the consequences #
# of those alterations!                                                            #
# -------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------- #
# Handle OK                                                                        #
# -------------------------------------------------------------------------------- #
# If provided with a message, this function will show it with the 'OK' prefix and  #
# subsequently terminate the script with the requisite exit code of 0.             #
# -------------------------------------------------------------------------------- #

def handle_ok(message = '')
    puts("OK - #{message}") unless message.to_s.strip.empty?
    exit 0
end

# -------------------------------------------------------------------------------- #
# Handle Warning                                                                   #
# -------------------------------------------------------------------------------- #
# If provided with a message, this function will show it with the 'WARNING' prefix #
# and subsequently terminate the script with the requisite exit code of 1.         #
# -------------------------------------------------------------------------------- #

def handle_warning(message = '')
    puts("WARNING - #{message}") unless message.to_s.strip.empty?
    exit 1
end

# -------------------------------------------------------------------------------- #
# Handle Critical                                                                  #
# -------------------------------------------------------------------------------- #
# If provided with a message, this function will show it with the 'CRITICAL'       #
# prefix and subsequently terminate the script with the requisite exit code of 2.  #
# -------------------------------------------------------------------------------- #

def handle_critical(message = '')
    puts("CRITICAL - #{message}") unless message.to_s.strip.empty?
    exit 2
end

# -------------------------------------------------------------------------------- #
# Handle Unknown                                                                   #
# -------------------------------------------------------------------------------- #
# If provided with a message, this function will show it with the 'UNKNOWN' prefix #
# and subsequently terminate the script with the requisite exit code of 3.         #
# -------------------------------------------------------------------------------- #

def handle_unknown(message = '')
    puts("UNKNOWN - #{message}") unless message.to_s.strip.empty?
    exit 3
end

# -------------------------------------------------------------------------------- #
# The Core                                                                         #
# -------------------------------------------------------------------------------- #
# This is the central component of the script.                                     #
# -------------------------------------------------------------------------------- #

process_arguments

# -------------------------------------------------------------------------------- #
# End of Script                                                                    #
# -------------------------------------------------------------------------------- #
# This is the end - nothing more to see here.                                      #
# -------------------------------------------------------------------------------- #
