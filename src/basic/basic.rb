#!/usr/bin/env ruby

# -------------------------------------------------------------------------------- #
# Description                                                                      #
# -------------------------------------------------------------------------------- #
# The script presented here is a simple Nagios check example, employing a set of   #
# utility functions to guarantee accurate output and exit codes. Although this     #
# version uses fixed values, suitable for straightforward checks, we also offer a  #
# more sophisticated variant that demonstrates how to handle command-line          #
# arguments for more elaborate or flexible scripting.                              #
# -------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------- #
# Main()                                                                           #
# -------------------------------------------------------------------------------- #
# This function is where you can include all the code related to the check. You're #
# free to define additional functions and invoke them whenever necessary.          #
#                                                                                  #
# In this template, we've generated a random number to illustrate how to call the  #
# core functions that manage the different states. However, real tests will be     #
# more intricate and elaborate, but they should adhere to the same fundamental     #
# structure.                                                                       #
# -------------------------------------------------------------------------------- #

def main
    critcal_level = 90
    warning_level = 75

    test_value = rand(1..100)

    if test_value >= critcal_level
        handle_critical("Test Value = #{test_value}")
    elsif test_value >= warning_level
        handle_warning("Test Value = #{test_value}")
    elsif test_value >= 0
        handle_ok("Test Value = #{test_value}")
    else
        handle_unknown("Test Value = #{test_value}")
    end
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

main

# -------------------------------------------------------------------------------- #
# End of Script                                                                    #
# -------------------------------------------------------------------------------- #
# This is the end - nothing more to see here.                                      #
# -------------------------------------------------------------------------------- #
