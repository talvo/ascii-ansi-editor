namespace eval ::ascii {}

proc ::ascii::init {} {
	variable colors;
	variable editors;
	
	set editors 0;
	
	set colors(ansi,letters) [list h r rh g gh b bh y yh m mh c ch w wh x xh]
	set colors(ansi,names) [list "Hilight" "Red" "Red Highlight" "Green" "Green Highlight" "Blue" "Blue Highlight" "Yellow" "Yellow Highlight" "Magenta" "Magenta Highlight" "Cyan" "Cyan Highlight" "White" "White Highlight" "Black" "Black Highlight"]
	set colors(ansi,colors) [list #dfdfdf #800000 #ff0000 #008000 #00ff00 #000080 #0000ff #808000 #ffff00 #800080 #ff00ff #008080 #00ffff #c0c0c0 #ffffff #808080 #222222]
	
	set colors(xterm) [list \
		#000000 #AA0000 #00AA00 #AA5500 #0000AA #AA00AA #00AAAA #AAAAAA \
		#555555 #FF5555 #55FF55 #FFFF55 #5555FF #FF55FF #55FFFF #FFFFFF \
		#000000 #00005F #000087 #0000AF #0000D7 #0000FF #005F00 #005F5F \
		#005F87 #005FAF #005FD7 #005FFF #008700 #00875F #008787 #0087AF \
		#0087D7 #0087FF #00AF00 #00AF5F #00AF87 #00AFAF #00AFD7 #00AFFF \
		#00D700 #00D75F #00D787 #00D7AF #00D7D7 #00D7FF #00FF00 #00FF5F \
		#00FF87 #00FFAF #00FFD7 #00FFFF #5F0000 #5F005F #5F0087 #5F00AF \
		#5F00D7 #5F00FF #5F5F00 #5F5F5F #5F5F87 #5F5FAF #5F5FD7 #5F5FFF \
		#5F8700 #5F875F #5F8787 #5F87AF #5F87D7 #5F87FF #5FAF00 #5FAF5F \
		#5FAF87 #5FAFAF #5FAFD7 #5FAFFF #5FD700 #5FD75F #5FD787 #5FD7AF \
		#5FD7D7 #5FD7FF #5FFF00 #5FFF5F #5FFF87 #5FFFAF #5FFFD7 #5FFFFF \
		#870000 #87005F #870087 #8700AF #8700D7 #8700FF #875F00 #875F5F \
		#875F87 #875FAF #875FD7 #875FFF #878700 #87875F #878787 #8787AF \
		#8787D7 #8787FF #87AF00 #87AF5F #87AF87 #87AFAF #87AFD7 #87AFFF \
		#87D700 #87D75F #87D787 #87D7AF #87D7D7 #87D7FF #87FF00 #87FF5F \
		#87FF87 #87FFAF #87FFD7 #87FFFF #AF0000 #AF005F #AF0087 #AF00AF \
		#AF00D7 #AF00FF #AF5F00 #AF5F5F #AF5F87 #AF5FAF #AF5FD7 #AF5FFF \
		#AF8700 #AF875F #AF8787 #AF87AF #AF87D7 #AF87FF #AFAF00 #AFAF5F \
		#AFAF87 #AFAFAF #AFAFD7 #AFAFFF #AFD700 #AFD75F #AFD787 #AFD7AF \
		#AFD7D7 #AFD7FF #AFFF00 #AFFF5F #AFFF87 #AFFFAF #AFFFD7 #AFFFFF \
		#D70000 #D7005F #D70087 #D700AF #D700D7 #D700FF #D75F00 #D75F5F \
		#D75F87 #D75FAF #D75FD7 #D75FFF #D78700 #D7875F #D78787 #D787AF \
		#D787D7 #D787FF #D7AF00 #D7AF5F #D7AF87 #D7AFAF #D7AFD7 #D7AFFF \
		#D7D700 #D7D75F #D7D787 #D7D7AF #D7D7D7 #D7D7FF #D7FF00 #D7FF5F \
		#D7FF87 #D7FFAF #D7FFD7 #D7FFFF #FF0000 #FF005F #FF0087 #FF00AF \
		#FF00D7 #FF00FF #FF5F00 #FF5F5F #FF5F87 #FF5FAF #FF5FD7 #FF5FFF \
		#FF8700 #FF875F #FF8787 #FF87AF #FF87D7 #FF87FF #FFAF00 #FFAF5F \
		#FFAF87 #FFAFAF #FFAFD7 #FFAFFF #FFD700 #FFD75F #FFD787 #FFD7AF \
		#FFD7D7 #FFD7FF #FFFF00 #FFFF5F #FFFF87 #FFFFAF #FFFFD7 #FFFFFF \
		#000000 #121212 #1C1C1C #262626 #303030 #3A3A3A #444444 #4E4E4E \
		#585858 #626262 #6C6C6C #767676 #808080 #8A8A8A #949494 #9E9E9E \
		#A8A8A8 #B2B2B2 #BCBCBC #C6C6C6 #D0D0D0 #DADADA #E4E4E4 #EEEEEE \
	]

	bind Listbox <1> [string map [list 1 0] [bind Listbox <1>]]
	
};# ::ascii::init

proc ::ascii::grid_with_scrollbars {widget x y} {

	set frame [winfo parent $widget]
	grid $widget $y -sticky nsew
	grid $x -sticky nswe
	grid rowconfigure $frame $widget -weight 1
	grid columnconfigure $frame $widget -weight 1
	return;
};# ::ascii::grid_with_scrollbars

proc ::ascii::help {} {

	set message "ANSI-Ascii Editor Version 1, by Mike@M*U*S*H\n\n"
	append message "Type text in the box at the top. Block some of it, select a color from\n"
	append message "the list below, then press F1 to change the FG color or F2 to change the\n"
	append message "BG color. F3 and F4 will reset the FG and BG colors, respectively. Sorry\n"
	append message "the UI sucks! Ideas for improvement welcome.\n"
	append message "If you have problems, let me know on M*U*S*H or email mike@keyboardzombie.com"

	tk_messageBox -title "ANSI-Ascii Editor Help" -type "ok" -icon "info" -message $message
	
	return;
}

proc ::ascii::editor {{toplevel .ascii}} {
	if { [winfo exists $toplevel] } {
		wm deiconify $toplevel
		raise $toplevel
		focus $toplevel
		bell -displayof $toplevel
		return;
	}
	
	variable opts;
	variable editors;
	
	toplevel $toplevel
	incr editors
	wm title $toplevel "ANSI-Ascii Editor"
	
	menu $toplevel.m -tearoff 0
	$toplevel configure -menu $toplevel.m
	$toplevel.m add command -label "Help" -underline 0 -command ::ascii::help

	pack [set cont [::ttk::frame $toplevel.cont]] -expand 1 -fill both
	bind $cont <Destroy> [list ::ascii::cleanup $toplevel]
	
	pack [::ttk::frame $cont.top] -expand 1 -fill both -side top
	set t $cont.top.t
	set x $cont.top.x
	set y $cont.top.y
	text $t -width 78 -wrap char -xscrollcommand [list $x set] -yscrollcommand [list $y set] -font TkFixedFont -background black -foreground white -undo 1
	
	::ttk::scrollbar $x -orient horizontal -command [list $t xview]
	::ttk::scrollbar $y -orient vertical -command [list $t yview]
	grid_with_scrollbars $t $x $y
	
	pack [::ttk::frame $cont.btm] -expand 1 -fill x -side top -padx 10 -pady 10
	set opts($toplevel,invert) 0
	pack [::ttk::checkbutton $cont.btm.invert -variable ::ascii::opts($toplevel,invert) -text "Invert FG/BG?" -command [list ::ascii::invert $t]] -side left -padx 10
	
	pack [::ttk::frame $cont.btm.color] -side left -padx 10
	pack [::ttk::label $cont.btm.color.l -text "Color:  "] -side left
	pack [set lb [listbox $cont.btm.color.lb -selectmode single -activestyle dotbox -height 5 -yscrollcommand [list $cont.btm.color.sb set] -exportselection 0 -takefocus 0]] -side left
	pack [::ttk::scrollbar $cont.btm.color.sb -orient vertical -command [list $lb yview]] -side left -fill y

	pack [::ttk::button $cont.btm.results -text "Show Results" -command [list ::ascii::results $t]]
	
	configColors $t $lb
	
	bind $t <F1> [list ::ascii::color $t $lb fg]
	bind $t <F2> [list ::ascii::color $t $lb bg]
	bind $t <F3> [list ::ascii::color $t $lb fg 1]
	bind $t <F4> [list ::ascii::color $t $lb bg 1]
	
};# ::ascii::editor

proc ::ascii::reverseColor {col} {

	foreach [list red green blue] [winfo rgb . $col] {break}

	set red [expr {65535 - $red}]
	set blue [expr {65535 - $blue}]
	set green [expr {65535 - $green}]

	return [format "#%04x%04x%04x" $red $green $blue];

};# ::ascii::reverseColor

proc ::ascii::invert {win} {

	set fg [$win cget -fg]
	set bg [$win cget -bg]
	$win configure -bg $fg -fg $bg
	return;
};# ::ascii::invert

proc ::ascii::cleanup {win} {
	variable opts;
	variable editors;
	incr editors -1;
	
	if { $editors < 1} {
		exit;
	}
	
	array unset opts $win,*
	
	return;
};# ::ascii::cleanup

proc ::ascii::color {text lb fgbg {strip 0}} {
	variable colors;

	if { [llength [set sel [$text tag ranges sel]]] == 0 } {
		return;
	}

	set colnum [$lb curselection]
	
	if { $colnum == "" } {
		if { !$strip } {
			return;
		}
	} else {
		if { $colnum < 17 && $fgbg eq "bg" && !($colnum % 2) } {
			incr colnum -1
			if { $colnum < 1 } {
				bell -displayof $text
				return;
			}
		}
	}

	foreach x $colors(ansi,letters) {
		$text tag remove ANSI_${fgbg}_$x sel.first sel.last
	}
	for {set i 0} {$i < 256} {incr i} {
		$text tag remove ANSI_${fgbg}_xterm$i sel.first sel.last
	}
	
	if { $strip } {
		return;
	}

	if { $colnum < 17 } {
		set tag ANSI_${fgbg}_[lindex $colors(ansi,letters) $colnum]
	} else {
		set tag ANSI_${fgbg}_xterm[expr {$colnum - 17}]
	}

	$text tag add $tag sel.first sel.last
	
	return;

};# ::ascii::color

proc ::ascii::configColors {text lb} {
	variable colors;

	set total [llength $colors(ansi,letters)]
	
	for {set i 0} {$i < $total} {incr i} {
		set letter [lindex $colors(ansi,letters) $i]
		set name [lindex $colors(ansi,names) $i]
		set color [lindex $colors(ansi,colors) $i]

		$lb insert end "ANSI $name"
		$lb itemconfigure end -background $color -foreground [reverseColor $color]
		$text tag configure ANSI_fg_$letter -foreground $color
		if { $i % 2 } {
			$text tag configure ANSI_bg_$letter -background $color
		}
	}

	for {set i 0} {$i < 256} {incr i} {
		set color [lindex $colors(xterm) $i]
		$text tag configure ANSI_fg_xterm$i -foreground $color
		$text tag configure ANSI_bg_xterm$i -background $color
		$lb insert end "XTERM $i"
		$lb itemconfigure end -background $color -foreground [reverseColor $color]
	}
	
	$text tag raise sel
	
};# ::ascii::configColors

proc ::ascii::results {text} {

	set top .results
	
	destroy $top;
	
	toplevel $top
	wm title $top "ANSI-Ascii Output"
	pack [::ttk::frame $top.f] -expand 1 -fill both
	set t $top.f.t
	set x $top.f.x
	set y $top.f.y
	text $t -wrap char -width 78 -font TkFixedFont -xscrollcommand [list $x set] -yscrollcommand [list $y set]
	::ttk::scrollbar $x -orient horizontal -command [list $t xview]
	::ttk::scrollbar $y -orient vertical -command [list $t yview]
	grid_with_scrollbars $t $x $y
	
	set open 0
	set opentag ""
	set c(fg) ""
	set c(bg) ""
	foreach {type data index} [$text dump -text -tag 1.0 end-1c] {
		if { $type eq "text" } {
			set data [string map [list "\\" "\\\\" "%" "\\%" "\[" "\\\[" "\]" "\\\]" "(" "\\(" ")" "\\)" ";" "\\;" "," "\\," "\{" "\\\{" "\}" "\\\}" "$" "\\$" "^" "\\^" "\n" "%r" "\t" "%t" "   " "%b %b" "  " " %b"] $data]
			if { [string index $data 0] eq " " } {
				set data "%b[string range $data 1 end]"
			}
			if { [string index $data end] eq " "} {
				set data "[string range $data 0 end-1]%b"
			}
			if { $opentag ne "" } {
				$t insert end $opentag
				set opentag ""
				set open 1
			}
			$t insert end $data
		} elseif { $type eq "tagon" } {
			if { $data eq "sel" } {
				continue;
			}
			set bg [string match "ANSI_bg_*" $data]
			set col [string range $data 8 end]
			if { $bg } {
				set c(bg) $col
			} else {
				set c(fg) $col
			}
			if { $open } {
				$t insert end ")]"
			}
			set opentag [ansiTag $c(fg) $c(bg)]
		} elseif { $type eq "tagoff" } {
			if { $data eq "sel" } {
				continue;
			}
			if { [string match "*_bg_*" $data ] } {
				set c(bg) ""
			} else {
				set c(fg) ""
			}
			if { $open } {
				$t insert end ")]"
				set open 0
			}
			if { $c(fg) ne "" || $c(bg) ne "" } {
				set opentag [ansiTag $c(fg) $c(bg)]
			}
		}
	}

	if { $open } {
		$t insert end ")]"
	}
	
};# ::ascii::results

proc ::ascii::ansiTag {fg bg} {

	set str "\[ansi("
	
	if { [string length $bg] < 3 } {
		append str [string toupper $bg]
	}
	
	if { [string length $fg] < 3 } {
		append str $fg
	} else {
		append str "+$fg"
	}
	
	if { [string length $bg] >= 3 } {
		append str "/+$bg"
	}
	
	append str ","
	
	return $str;
};# ::ascii::ansiTag

bind all <F12> {console show}

::ascii::init
::ascii::editor .editor

if { ![info exists ::potato::potato] } {
	wm withdraw .
}

proc winover {} {

	return [winfo containing {*}[winfo pointerxy .]];

}
