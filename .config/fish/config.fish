if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    if set -q HYPRLAND_INSTANCE_SIGNATURE;; \
        else; hyprland; \
    end
end

alias neofetch=fastfetch

