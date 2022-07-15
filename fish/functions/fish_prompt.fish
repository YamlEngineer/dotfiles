function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    
    set_color green --bold
    set whoami (whoami)
    echo -n "Ξ "

    # PWD
    set_color cyan --bold
    set fullpath (pwd)
    if echo $fullpath | grep -q ^/home/
	set corrent (pwd | awk -F"/" '{ printf $NF }')
    	set previous (pwd | awk -F"/" '{ printf $(NF-1) }')
    	if [ "home/$USER" = "$previous/$corrent" ]
    		echo -n "~"
    	else
    		if [ $previous = $USER ]
			set previous "~"
		end
		echo -n "$previous/$corrent"
    	end
    end
    if ! echo $fullpath | grep -q ^/home/
        set corrent (pwd | awk -F"/" '{ printf $NF }')
        set previous (pwd | awk -F"/" '{ printf $(NF-1) }')
        if set -q corrent[1] && set -q previous[1]
     	    echo -n "$previous/$corrent"
        else
            echo -n $fullpath
        end
    end


    set_color blue --bold
    __terlar_git_prompt
    fish_hg_prompt

    if not test $last_status -eq 0
        set_color $fish_color_error
    end
    set_color green --bold
    echo -n ' $ '
    set_color normal
end
