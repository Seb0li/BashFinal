if [ $# -eq 0 ]; then

#INTERACTIVE MODEEEE

        while true; do
                echo "How can I help you ? Type a command maaaan ! Or type 'exit' if you're tired of seeing my ugly face :D"
                read command

                if [ "$command" = "today" ]; then
                        date
		elif [ "$command" = "help" ]; then
			echo "Existing Commands:"
			echo "date - displays date and time"
			echo "weather - displays weather predictions"
			echo "crack me up - displays a random, and allegedly pretty shitty, joke."
			echo "math - use it, then type an equation and we'll solve it for ya! Or use your brain, like a real badass !"
			echo "exit - leaving so soon ? >:("
		elif [ "$command" = "weather" ]; then
			weather_info=$(curl -s wttr.in/Charleroi)
			echo "Weather in Charlouze:"
			echo "$weather_info"
                elif [ "$command" = "crack me up" ]; then
                        joke=$(shuf -n 1 "jokes.txt")
                        echo "$joke"
                        espeak "$joke" #watch yo ears :D
                elif [ "$command" = "math" ]; then
                        echo "mattthhssss bro? WHYYY :("
                        read -p "Gimme da math! Syntax is as follows: number <space> operand <space> number  " calcul
                        result=$(expr $calcul)
                        echo "There, I did it for you: $result"

                elif [ "$command" = "exit" ]; then
                        break

                else
                        echo "That's not a command, ya dummy !"
                fi
        done
else

#NON-INTERACTIVE MODEEEEEE

        for command in "$@"; do
                case "$command" in
                        "today")
                                date
                                ;;
			"help")
	                        echo "Existing Commands:"
        	                echo "date - displays date and time"
        	                echo "weather - displays weather predictions"
        	                echo "crack me up - displays a random, and allegedly pretty shitty, joke."
        	                echo "math - use it, then type an equation and we'll solve it for ya! Or use your brain, like a real badass !"
        	                echo "exit - leaving so soon ? >:("
				;;
			"weather")
				weather_info=$(curl -s wttr.in/Charleroi)
				echo "Weather in Charlouze:"
				echo "$weather_info"
				;;
                        "math")
                                echo "non-interactive mode has limited funcionalities :( turn on interactive mode for MATTTTTTHS"
                                ;;
                        "crack me up")
                                joke=$(shuf -n 1 "jokes.txt")
                                echo "$joke"
                                espeak "$joke" #watch yo ears :D
                                ;;
                        *)
                                echo "That's not a command, ya dummy !"
                                ;;
                esac
        done
fi
