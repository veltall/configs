# -*- encoding: utf-8 -*-
#
# Author::  Christoph Kappel <unexist@subforge.org>
# Version:: $Id: data/subtle.rb,v 3182 2012/02/04 16:39:30 unexist $
# License:: GNU GPLv2
#
# = Subtle default configuration
#
# This file will be installed as default and can also be used as a starter for
# an own custom configuration file. The system wide config usually resides in
# +/etc/xdg/subtle+ and the user config in +HOME/.config/subtle+, both locations
# are dependent on the locations specified by +XDG_CONFIG_DIRS+ and
# +XDG_CONFIG_HOME+.
#

#
# == Options
#
# Following options change behaviour and sizes of the window manager:
#

# Window move/resize steps in pixel per keypress
set :increase_step, 5

# Window screen border snapping
set :border_snap, 10

# Default starting gravity for windows. Comment out to use gravity of
# currently active client
#set :default_gravity, 0

# Make dialog windows urgent and draw focus
set :urgent_dialogs, true

# Honor resize size hints globally
set :honor_size_hints, false

# Enable gravity tiling for all gravities
set :gravity_tiling, true

# Enable click-to-focus focus model
set :click_to_focus, false

# Skip pointer movement on e.g. gravity change
set :skip_pointer_warp, false

# Skip pointer movement to urgent windows
set :skip_urgent_warp, false

# Set the WM_NAME of subtle (Java quirk)
# set :wmname, "LG3D"

#set :font, "xft:HeldustryFTVBasic Demi:pixelsize=9"

#set :separator, ":"

#
# == Screen
#
# Generally subtle comes with two panels per screen, one on the top and one at
# the bottom. Each panel can be configured with different panel items and
# sublets screen wise. The default config uses top panel on the first screen
# only, it's up to the user to enable the bottom panel or disable either one
# or both.

# === Properties
#
# [*stipple*]    This property adds a stipple pattern to both screen panels.
#
#                Example: stipple "~/stipple.xbm"
#                         stipple Subtlext::Icon.new("~/stipple.xbm")
#
# [*top*]        This property adds a top panel to the screen.
#
#                Example: top [ :views, :title ]
#
# [*bottom*]     This property adds a bottom panel to the screen.
#
#                Example: bottom [ :views, :title ]

#
# Following items are available for the panels:
#
# [*:views*]     List of views with buttons
# [*:title*]     Title of the current active window
# [*:tray*]      Systray icons (Can be used only once)
# [*:keychain*]  Display current chain (Can be used only once)
# [*:sublets*]   Catch-all for installed sublets
# [*:sublet*]    Name of a sublet for direct placement
# [*:spacer*]    Variable spacer (free width / count of spacers)
# [*:center*]    Enclose items with :center to center them on the panel
# [*:separator*] Insert separator
#
# Empty panels are hidden.
#
# === Linksm
#
# http://subforge.org/projects/subtle/wiki/Multihead
# http://subforge.org/projects/subtle/wiki/Panel
#

screen 1 do
  top    [ :views, :center, :title, :center, :spacer, :clock  ]
  bottom [ :tray, :spacer, :wifi, :memory, :battery ]
end

# Example for a second screen:
#screen 2 do
#  top    [ :views, :title, :spacer ]
#  bottom [ ]
#end

#
# == Styles
#
# Styles define various properties of styleable items in a CSS-like syntax.
#
# If no background color is given no color will be set. This will ensure a
# custom background pixmap won't be overwritten.
#
# Following properties are available for most the styles:
#
# [*foreground*] Foreground text color
# [*background*] Background color
# [*margin*]     Outer spacing
# [*border*]     Border color and size
# [*padding*]    Inner spacing
# [*font*]       Font string (xftontsel or xft)
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Styles

# Style for all style elements

style :all do
  #font  "xft:HeldustryFTVBasic Demi:pixelsize=9"
  font   "xft:Tewi:pixelsize=9"
end

style :subtle do
  panel       "#222222"
end

# Style for separator
style :separator do
  foreground  "#F35656"
  background  "#222222"
  separator   "//"
  padding 2,5,0,5
end

style :title do
  icon        "#757575"
  padding     2, 5, 0, 5
  border_bottom "#303030", 2
  #foreground  "#757575"
  foreground  "#9898b0"
  background  "#222222"
end

style :views do
  padding     2, 8, 0, 10
  #foreground  "#757575"
  foreground  "#b8b8b8"
  background  "#222222"
  icon        "#9898b0"

  style :focus do
    padding    2 , 8, 0, 10
#   border_bottom "#B35696", 1
    border_top  "#C34636", 1
    foreground  "#ffffff"
    background  "#373737"
    icon        "#C34636"
  end

  style :urgent do
    padding     2, 8, 0, 10
    #border      "#303030", 0
    foreground  "#ffffff"
    background  "#F35656"
  end
end

style :clients do
# active      "#C32616", 2
  active      "#C33636", 3
  inactive    "#222222", 2
  margin    12  
end

style :sublets do
  padding     2, 10, 0
  foreground  "#9898b0"
# foreground  "#181818"
  background  "#222222"
  icon        "#C33646"
end



#
# == Gravities
#
# Gravities are predefined sizes a window can be set to. There are several ways
# to set a certain gravity, most convenient is to define a gravity via a tag or
# change them during runtime via grab. Subtler and subtlext can also modify
# gravities.
#
# A gravity consists of four values which are a percentage value of the screen
# size. The first two values are x and y starting at the center of the screen
# and he last two values are the width and height.
#
# === Example
#
# Following defines a gravity for a window with 100% width and height:
#
#   gravity :example, [ 0, 0, 100, 100 ]
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Gravity
#

# DISPOSITION x,y, width, height

#         __________x(1)/w
#        |
#        |
#        |
#        y(2)/h
  

# Top left
gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left60,     [   0,   0,  50,  60 ]
gravity :top_left30,     [   0,   0,  50,  40 ]

# Top
gravity :top,            [   0,   0, 100,  50 ]
gravity :top60,          [   0,   0, 100,  60 ]
gravity :top30,          [   0,   0, 100,  40 ]

# Top right
gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right60,    [  50,   0,  50,  60 ]
gravity :top_right30,    [  50,   0,  50,  40 ]

gravity :top_right_60,      [  50,   0,  50,  50 ]
gravity :top_right60_60,    [  60,   0,  40,  60 ]
gravity :top_right30_60,    [  60,   0,  40,  40 ]

gravity :top_right_40,      [  50,   0,  50,  50 ]
gravity :top_right60_40,    [  40,   0,  60,  60 ]
gravity :top_right30_40,    [  40,   0,  60,  40 ]

# Left
gravity :left,           [   0,   0,  50, 100 ]
gravity :left60,         [   0,   0,  60, 100 ]
gravity :left30,         [   0,   0,  40, 100 ]

# Center
gravity :center,         [   0,   0, 100, 100 ]
gravity :center60,       [  20,  20,  60,  60 ]
gravity :center30,       [  35, 35,  35,  35 ]

# Right
gravity :right,          [  50,   0,  50, 100 ]
gravity :right60,        [  40,   0,  60, 100 ]
gravity :right30,        [  60,   0,  40, 100 ]

# Bottom left
gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left60,  [   0,  40,  50,  60 ]
gravity :bottom_left30,  [   0,  60,  50,  40 ]

# Bottom
gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom60,       [   0,  40, 100,  60 ]
gravity :bottom30,       [   0,  60, 100,  40 ]

# Bottom right
gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right60, [  50,  30,  50,  70 ]
gravity :bottom_right30, [  50,  60,  50,  40 ]

# Gimp
gravity :gimp_image,     [  10,   0,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [  90,   0,  10, 100 ]

#
# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be
# assigned either to a key and/or to a mouse button combination. A grab
# consists of a chain and an action.
#
# === Finding keys
#
# The best resource for getting the correct key names is
# */usr/include/X11/keysymdef.h*, but to make life easier here are some hints
# about it:
#
# * Numbers and letters keep their names, so *a* is *a* and *0* is *0*
# * Keypad keys need *KP_* as prefix, so *KP_1* is *1* on the keypad
# * Strip the *XK_* from the key names if looked up in
#   /usr/include/X11/keysymdef.h
# * Keys usually have meaningful english names
# * Modifier keys have special meaning (Alt (A), Control (C), Meta (M),
#   Shift (S), Super (W))
#
# === Chaining
#
# Chains are a combination of keys and modifiers to one or a list of keys
# and can be used in various ways to trigger an action. In subtle, there are
# two ways to define chains for grabs:
#
#   1. *Default*: Add modifiers to a key and use it for a grab
#
#      *Example*: grab "W-Return", "urxvt"
#
#   2. *Chain*: Define a list of grabs that need to be pressed in order
#
#      *Example*: grab "C-y Return", "urxvt"
#
# ==== Mouse buttons
#
# [*B1*]  = Button1 (Left mouse button)
# [*B2*]  = Button2 (Middle mouse button)
# [*B3*]  = Button3 (Right mouse button)
# [*B4*]  = Button4 (Mouse wheel up)
# [*B5*]  = Button5 (Mouse wheel down)
# [*...*]
# [*B20*] = Button20 (Are you sure that this is a mouse and not a keyboard?)
#
# ==== Modifiers
#
# [*A*] = Alt key (Mod1)
# [*C*] = Control key
# [*M*] = Meta key (Mod3)
# [*S*] = Shift key
# [*W*] = Super/Windows key (Mod4)
# [*G*] = Alt Gr (Mod5)
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one
# of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a urxvt when Alt+Enter are pressed:
#
#   grab "A-Return", "urxvt"
#   grab "C-a c",    "urxvt"
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Grabs
#

# Jump to view1, view2, ...
grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4

# Switch current view
grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4

# Select next and prev view */
grab "C-A-Right",      	:ViewNext
grab "C-A-Left",	:ViewPrev

# Move mouse to screen1, screen2, ...
grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4

# Force reload of config and sublets
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "C-A-S-r", :SubtleRestart

# Quit subtle
grab "C-A-S-q", :SubtleQuit

# Move current window
grab "W-B1", :WindowMove

# Resize current window
grab "W-B3", :WindowResize

# Toggle floating mode of window
grab "W-f", :WindowFloat

# Toggle fullscreen mode of window
grab "W-space", :WindowFull

# Toggle sticky mode of window (will be visible on all views)
grab "W-S-s", :WindowStick

# Toggle zaphod mode of window (will span across all screens)
grab "W-equal", :WindowZaphod

# Raise window
grab "W-r", :WindowRaise

# Lower window
grab "W-l", :WindowLower

# Select next windows
grab "C-A-Left",  :WindowLeft
grab "C-A-Down",  :WindowDown
grab "C-A-Up",    :WindowUp
grab "C-A-Right", :WindowRight

# Kill current window
grab "C-A-S-k", :WindowKill

#audio
grab "XF86AudioRaiseVolume", "amixer set Master playback 1+"
grab "XF86AudioLowerVolume", "amixer set Master playback 1-"
grab "XF86AudioMute", "vol mute"
# Control MPD with the Keyboard
grab "XF86AudioPrev", "mpc prev"
grab "XF86AudioNext", "mpc next"
grab "XF86AudioPlay", "mpc toggle"
grab "XF86AudioStop", "mpc stop"

# Cycle between given gravities
#grab "W-KP_7", [ :top_left,     :top_left60,     :top_left30     ]
#grab "W-KP_8", [ :top,          :top60,          :top30          ]
#grab "W-KP_9", [ :top_right,    :top_right60,    :top_right30    ]
#grab "W-KP_4", [ :left,         :left60,         :left30         ]
#grab "W-KP_5", [ :center,       :center60,       :center30       ]
#grab "W-KP_6", [ :right,        :right60,        :right30        ]
#grab "W-KP_1", [ :bottom_left,  :bottom_left60,  :bottom_left30  ]
#grab "W-KP_2", [ :bottom,       :bottom60,       :bottom30       ]
#grab "W-KP_3", [ :bottom_right, :bottom_right60, :bottom_right30 ]

# In case no numpad is available e.g. on notebooks
grab "C-A-q", [ :top_left,     :top_left60,     :top_left30,     :top_left_60,     :top_left60_60,     :top_left30_60,     :top_left_40,     :top_left60_40,     :top_left30_40     ]
grab "C-A-w", [ :top,          :top60,          :top30          ]
grab "C-A-e", [ :top_right,     :top_right60,     :top_right30,     :top_right_60,     :top_right60_60,     :top_right30_60,     :top_right_40,     :top_right60_40,     :top_right30_40     ]
grab "C-A-a", [ :left,         :left60,         :left30         ]
grab "C-A-s", [ :center,       :center60,       :center30       ]
grab "C-A-d", [ :right,        :right60,        :right30        ]
#
# QUERTZ
#grab "W-y", [ :bottom_left,  :bottom_left60,  :bottom_left30  ]
#
# QWERTY
grab "C-A-z", [ :bottom_left,  :bottom_left60,  :bottom_left30  ]
#
grab "C-A-x", [ :bottom,       :bottom60,       :bottom30       ]
grab "C-A-c", [ :bottom_right, :bottom_right60, :bottom_right30 ]

# Exec programs
grab "C-Return", "gnome-terminal"
grab "W-S-d", "dmenu_run"

# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end

#
# == Tags
#
# Tags are generally used in subtle for placement of windows. This placement is
# strict, that means that - aside from other tiling window managers - windows
# must have a matching tag to be on a certain view. This also includes that
# windows that are started on a certain view will not automatically be placed
# there.
#
# There are to ways to define a tag:
#
# === Simple
#
# The simple way just needs a name and a regular expression to just handle the
# placement:
#
# Example:
#
#  tag "terms", "terms"
#
# === Extended
#
# Additionally tags can do a lot more then just control the placement - they
# also have properties than can define and control some aspects of a window
# like the default gravity or the default screen per view.
#
# Example:
#
#  tag "terms" do
#    match   "xterm|[u]?rxvt"
#    gravity :center
#  end
#
# === Default
#
# Whenever a window has no tag it will get the default tag and be placed on the
# default view. The default view can either be set by the user with adding the
# default tag to a view by choice or otherwise the first defined view will be
# chosen automatically.
#
# === Properties
#
# [*borderless*] This property enables the borderless mode for tagged clients.
#
#                Example: borderless true
#                Links:    http://subforge.org/projects/subtle/wiki/Tagging#Borderless
#                          http://subforge.org/projects/subtle/wiki/Clients#Borderless
#
# [*fixed*]      This property enables the fixed mode for tagged clients.
#
#                Example: fixed true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Fixed
#                         http://subforge.org/projects/subtle/wiki/Clients#Fixed
#
# [*float*]      This property enables the float mode for tagged clients.
#
#                Example: float true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Float
#                         http://subforge.org/projects/subtle/wiki/Clients#Float
#
# [*full*]       This property enables the fullscreen mode for tagged clients.
#
#                Example: full true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Fullscreen
#                         http://subforge.org/projects/subtle/wiki/Clients#Fullscreen
#
# [*geometry*]   This property sets a certain geometry as well as floating mode
#                to the tagged client, but only on views that have this tag too.
#                It expects an array with x, y, width and height values whereas
#                width and height must be >0.
#
#                Example: geometry [100, 100, 50, 50]
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Geometry
#
# [*gravity*]    This property sets a certain to gravity to the tagged client,
#                but only on views that have this tag too.
#
#                Example: gravity :center
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Gravity
#
# [*match*]      This property adds matching patterns to a tag, a tag can have
#                more than one. Matching works either via plaintext, regex
#                (see man regex(7)) or window id. Per default tags will only
#                match the WM_NAME and the WM_CLASS portion of a client, this
#                can be changed with following possible values:
#
#                [*:name*]      Match the WM_NAME
#                [*:instance*]  Match the first (instance) part from WM_CLASS
#                [*:class*]     Match the second (class) part from WM_CLASS
#                [*:role*]      Match the window role
#                [*:type*]      Match the window type
#
#                Examples: match instance: "urxvt"
#                          match [:role, :class] => "test"
#                          match "[xa]+term"
#                Link:     http://subforge.org/projects/subtle/wiki/Tagging#Match
#
# [*position*]   Similar to the geometry property, this property just sets the
#                x/y coordinates of the tagged client, but only on views that
#                have this tag, too. It expects an array with x and y values.
#
#                Example: position [ 10, 10 ]
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Position
#
# [*resize*]     This property enables the float mode for tagged clients. When set,
#                subtle honors size hints, that define various size constraints like
#                sizes for columns and rows of a terminal.
#
#                Example: resize true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Resize
#                         http://subforge.org/projects/subtle/wiki/Clients#Resize
#
# [*stick*]      This property enables the stick mode for tagged clients. When set,
#                clients are visible on all views, even when they don't have matching
#                tags. On multihead, sticky clients keep the screen they are assigned
#                on.
#
#                Supported values are either true or a number to specify a screen.
#
#                Example: stick true
#                         stick 1
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Stick
#                         http://subforge.org/projects/subtle/wiki/Clients#Stick
#
# [*type*]       This property sets the tagged client to be treated as a specific
#                window type though as the window sets the type itself. Following
#                types are possible:
#
#                [*:desktop*]  Treat as desktop window (_NET_WM_WINDOW_TYPE_DESKTOP)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Desktop
#                [*:dock*]     Treat as dock window (_NET_WM_WINDOW_TYPE_DOCK)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Dock
#                [*:toolbar*]  Treat as toolbar windows (_NET_WM_WINDOW_TYPE_TOOLBAR)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Toolbar
#                [*:splash*]   Treat as splash window (_NET_WM_WINDOW_TYPE_SPLASH)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Splash
#                [*:dialog*]   Treat as dialog window (_NET_WM_WINDOW_TYPE_DIALOG)
#                              Link: http://subforge.org/projects/subtle/wiki/Clients#Dialog
#
#                Example: type :desktop
#                Link:    http://subforge.org/projects/subtle/wiki/Tagging#Type
#
# [*urgent*]     This property enables the urgent mode for tagged clients. When set,
#                subtle automatically sets this client to urgent.
#
#                Example: urgent true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Stick
#                         http://subforge.org/projects/subtle/wiki/Clients#Urgent
#
# [*zaphod*]     This property enables the zaphod mode for tagged clients. When set,
#                the client spans across all connected screens.
#
#                Example: zaphod true
#                Links:   http://subforge.org/projects/subtle/wiki/Tagging#Zaphod
#                         http://subforge.org/projects/subtle/wiki/Clients#Zaphod
#
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Tagging
#

# Simple tags
tag "terms",   "xterm|[u]?rxvt"

tag "browser" do
  match		"midori|google-chrome-beta|uzbl|opera|firefox|navigator"
  gravity	:center
  resize	true
  borderless	true
end

# Placement
tag "editor" do
  match     "subl|[g]?vim"
  gravity   :left
  resize    true
end

tag "fixed" do
  geometry [ 10, 10, 100, 100 ]
  stick    true
end

tag "resize" do
  match  "sakura|gvim"
  resize true
end

tag "gravity" do
  gravity :center
end

# Modes
tag "stick" do
  match "mplayer"
  float true
  stick true
end

tag "float" do
  match "display"
  float true
end

# Gimp
tag "gimp_image" do
  match   :role => "gimp-image-window"
  gravity :gimp_image
end

tag "gimp_toolbox" do
  match   :role => "gimp-toolbox$"
  gravity :gimp_toolbox
end

tag "gimp_dock" do
  match   :role => "gimp-dock"
  gravity :gimp_dock
end

tag "gimp_scum" do
  match role: "gimp-.*|screenshot"
end

tag "launcher" do
  match "kupfer"
  urgent true
  splash true
end

#
# == Views
#
# Views are the virtual desktops in subtle, they show all windows that share a
# tag with them. Windows that have no tag will be visible on the default view
# which is the view with the default tag or the first defined view when this
# tag isn't set.
#
# Like tags views can be defined in two ways:
#
# === Simple
#
# The simple way is exactly the same as for tags:
#
# Example:
#
#   view "terms", "terms"
#
# === Extended
#
# The extended way for views is also similar to the tags, but with fewer
# properties.
#
# Example:
#
#  view "terms" do
#    match "terms"
#    icon  "/usr/share/icons/icon.xbm"
#  end
#
# === Properties
#
# [*match*]      This property adds a matching pattern to a view. Matching
#                works either via plaintext or regex (see man regex(7)) and
#                applies to names of tags.
#
#                Example: match "terms"
#
# [*dynamic*]    This property hides unoccupied views, views that display no
#                windows.
#
#                Example: dynamic true
#
# [*icon*]       This property adds an icon in front of the view name. The
#                icon can either be path to an icon or an instance of
#                Subtlext::Icon.
#
#                Example: icon "/usr/share/icons/icon.xbm"
#                         icon Subtlext::Icon.new("/usr/share/icons/icon.xbm")
#
# [*icon_only*]  This property hides the view name from the view buttons, just
#                the icon will be visible.
#
#                Example: icon_only true
#
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Tagging
#

#view "terms", "terms|default"
#view "www",   "browser"
#view "gimp",  "gimp_.*"
#view "dev",   "editor"

view "" do
  match "terms|default"
  icon "~/.icons/xbm2/arch2.xbm"
end

view "" do
  match "www|browser"
  icon "~/.icons/xbm2/world.xbm"
end

view "" do
  match "gimp|gimp_.*"
  icon "~/.icons/xbm2/paint.xbm"
end

view "" do
  match "subl|dev|editor"
  icon "~/.icons/xbm2/edit2.xbm"
end


#
# == Sublets
#
# Sublets are Ruby scripts that provide data for the panel and can be managed
# with the sur script that comes with subtle.
#
# === Example
#
#  sur install clock
#  sur uninstall clock
#  sur list
#
# === Configuration
#
# All sublets have a set of configuration values that can be changed directly
# from the config of subtle.
#
# There are three default properties, that can be be changed for every sublet:
#
# [*interval*]    Update interval of the sublet
# [*foreground*]  Default foreground color
# [*background*]  Default background color
#
# sur can also give a brief overview about properties:
#
# === Example
#
#   sur config clock
#
# The syntax of the sublet configuration is similar to other configuration
# options in subtle:
#
# === Example
#
#  sublet :clock do
#    interval      30
#    foreground    "#eeeeee"
#    background    "#000000"
#    format_string "%H:%M:%S"
#  end
#
#  === Link
#
# http://subforge.org/projects/subtle/wiki/Sublets
#

sublet :clock do
   interval      50
   style         :foobar
   format_string "%H:%M    %D" 
 end

 sublet :wifi do
   device        "wlp3s0"
 end

 sublet :battery do
  colors 20 => "#F35656" 
  color_text true
end

#
# == Hooks
#
# And finally hooks are a way to bind Ruby scripts to a certain event.
#
# Following hooks exist so far:
#
# [*:client_create*]    Called whenever a window is created
# [*:client_configure*] Called whenever a window is configured
# [*:client_focus*]     Called whenever a window gets focus
# [*:client_kill*]      Called whenever a window is killed
#
# [*:tag_create*]       Called whenever a tag is created
# [*:tag_kill*]         Called whenever a tag is killed
#
# [*:view_create*]      Called whenever a view is created
# [*:view_configure*]   Called whenever a view is configured
# [*:view_jump*]        Called whenever the view is switched
# [*:view_kill*]        Called whenever a view is killed
#
# [*:tile*]             Called on whenever tiling would be needed
# [*:reload*]           Called on reload
# [*:start*]            Called on start
# [*:exit*]             Called on exit
#
# === Example
#
# This hook will print the name of the window that gets the focus:
#
#   on :client_focus do |c|
#     puts c.name
#   end
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Hooks
#

## STARTUP
on :start do
   system("nitrogen --restore")
   system("xrdb -merge .Xresources")
   system("setxkbmap -layout us -variant alt-intl")
   system("xset -b")
end

on :client_create do |c|
   c.views.first.jump
 end

on :client_create do |c|
   cur = Subtlext::View.current
 
   # Check for empty tags
   if(c.tags.empty?)
     t = Subtlext::Tag[cur.name] rescue nil
 
     # Create new tag
     if(t.nil?)
       t = Subtlext::Tag.new(cur.name)
       t.save
     end 
 
     c + t
   end
 end

# vim:ts=2:bs=2:sw=2:et:fdm=marker
