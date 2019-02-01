function _git_branch --description 'Custom function get branch'
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
end

function fish_prompt --description 'Write out the prompt'

    # removed ifs for efficiency
    set -l last_status $status
    set -g __fish_prompt_normal (set_color normal)

    set -l color_cwd
    set -l prefix
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '$'
    end

    # PWD
    set_color $color_cwd
    echo -n (prompt_hostname):  # CUSTOM
    echo -n (prompt_pwd)
    set_color normal

    printf '%s ' (_git_branch)

    if not test $last_status -eq 0
        set_color $fish_color_error
        echo -n "[$last_status] "
        set_color normal
    end

    echo -n "$suffix "
end
