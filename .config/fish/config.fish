if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    if set -q HYPRLAND_INSTANCE_SIGNATURE;; \
        else; hyprland; \
    end
end

###########
# ALIASES #
###########
alias py=python3
alias bohr-curl="curl -u \"chau2962:qCg&QUDDWT*2K7\" -Ss"
alias 264-build="clang -c src/*.c && clang -o main *.o && rm *.o"
alias 264-test="clang -c src/*.c && clang -o main *.o && rm *.o && ./main"
alias 264-run="clang -c src/*.c && clang -o main *.o && rm *.o && ./main && rm main"
alias neofetch=fastfetch
alias neofetch=fastfetch

