# --------------------------------------------------------------
# TRIVIA V3.0 Multilang Multicolor
# Ousiris 4dec2025
# --------------------------------------------------------------

package require json

# ================== CONFIG ==================
set trivchan   "#balkon"
set qfile      "scripts/trivia_3.questions"
set scorefile  "scripts/trivia_3_score.txt"
set lang       "nl"

# use scripts/trivia_<lang>.json for localisation

# COLOUR SWITCH – change only this line!
#   1 = full colors + bold   |   0 = completely clean monochrome
set use_colors 1
# ===========================================

# Load language file
set langfile "scripts/trivia_$lang.json"
if {![file exists $langfile]} {set langfile "scripts/trivia_en.json"}
set fd [open $langfile r]
fconfigure $fd -encoding utf-8
set jsondict [json::json2dict [read $fd]]
close $fd

array set L [dict get $jsondict texts]
set ::HINT_CHAR "." ; if {[dict exists $jsondict hint_char]} { set ::HINT_CHAR [dict get $jsondict hint_char] }
set ::POINTS {5 4 3 2 1 0} ; if {[dict exists $jsondict points_per_hint]} { set ::POINTS [dict get $jsondict points_per_hint] }

# Load questions
if {![info exists QUESTIONS]} {
    set fd [open $qfile r]
    fconfigure $fd -encoding utf-8
    set QUESTIONS [lsearch -all -inline -not [split [read $fd] \n] ""]
    close $fd
}

# Game state
set running 0
set answer   ""
set question ""
set hint     0
set timerid  ""

# ================== COLOR SETUP – TRUE MONOCHROME FIXED ==================
if {$use_colors} {
    set bold   "\002"  ;# bold
    set col    "\003"  ;# color
    set reset  "\017"  ;# reset
    set green  "03"
    set red    "04"
    set yellow "08"
    set blue   "12"
} else {
    set bold "" ; set col "" ; set reset "" ; set green "" ; set red "" ; set yellow "" ; set blue ""
}

# Binds
bind pub - "!start"  triv_start
bind pub - "!stop"   triv_stop
bind pub - "!hint"   triv_hint
bind pub - "!skip"   triv_skip
bind pub - "!top10"  triv_top10
bind pubm - *        triv_check

# ================== PROCS =================================


# ================== DYNAMIC COLOR TOGGLE ==================
bind pub - "!poly" cmd_poly
bind pub - "!mono" cmd_mono

proc cmd_poly {nick uhost hand chan text} {
    global trivchan use_colors bold col reset green
    if {[string tolower $chan] ne [string tolower $trivchan]} return
    if {$use_colors} {
        putquick "PRIVMSG $chan :${bold}${col}${green}Kleuren staan al aan!${reset}"
        return
    }
    set use_colors 1
    putquick "PRIVMSG $chan :${bold}${col}${green}✓ Kleuren ingeschakeld door $nick${reset}"
}

proc cmd_mono {nick uhost hand chan text} {
    global trivchan use_colors
    if {[string tolower $chan] ne [string tolower $trivchan]} return
    if {!$use_colors} {
        putquick "PRIVMSG $chan :Monochroom staat al aan."
        return
    }
    set use_colors 0
    putquick "PRIVMSG $chan :Monochroom ingeschakeld door $nick"
}


proc triv_start {nick uhost hand chan text} {
    global trivchan running bold col red green yellow reset
    if {[string tolower $chan] ne [string tolower $trivchan]} return
    if {$running} {putquick "PRIVMSG $trivchan :${bold}${col}${red}Trivia is al gestart!${reset}"; return}
    set ::running 1
    putquick "PRIVMSG $trivchan :${bold}${col}${green}Trivia gestart door $nick!${reset} ${col}${red}Eerste vraag komt...${reset}"
    next_question
}

proc triv_stop {nick uhost hand chan text} {
    global trivchan running timerid bold col red reset
    if {[string tolower $chan] ne [string tolower $trivchan]} return
    putquick "PRIVMSG $trivchan :${bold}${col}${red}Trivia gestopt door $nick.${reset}"
    set ::running 0
    catch {killutimer $timerid}
}

proc triv_hint {nick uhost hand chan text} {
    global timerid running
    if {!$running} return
    catch {killutimer $timerid}
    show_hint
}


proc triv_skip {nick uhost hand chan text} {
    global trivchan timerid answer bold col red green yellow reset
    if {[string tolower $chan] ne [string tolower $trivchan]} return

    # Reveal the answer immediately
    putquick "PRIVMSG $trivchan :${bold}${col}${red}Vraag overgeslagen door $nick!${reset} Antwoord was: ${bold}${col}${yellow}$answer${reset}"

    # Kill current timer and start next question in 5 seconds
    catch {killutimer $timerid}
    utimer 3 next_question
}


proc triv_top10 {nick uhost hand chan text} {
    global trivchan scorefile bold col green yellow blue red reset L
    if {[string tolower $chan] ne [string tolower $trivchan]} return
    if {![file exists $scorefile] || [file size $scorefile]==0} {
        putquick "PRIVMSG $trivchan :${bold}${col}${red}Nog geen scores!${reset}"; return
    }
    set fd [open $scorefile]; set o "${bold}${col}${blue}Top 10:${reset}"; set i 0
    while {[gets $fd l]>=0 && $i<10} {
        if {[regexp {^(\d+),.*,([^,]+)} $l -> p n]} {incr i; append o " ${bold}$i.${reset} ${col}${green}$n${reset} → ${bold}${col}${yellow}$p${reset} $::L(pts)"}
    }
    close $fd
    putquick "PRIVMSG $trivchan :$o"
}

proc next_question {} {
    global QUESTIONS timerid
    catch {killutimer $timerid}
    set line [lindex $QUESTIONS [expr {int(rand()*[llength $QUESTIONS])}]]
    set ::answer   [string trim [lindex [split $line "|"] 0]]
    set ::question [lindex [split $line "|"] 1]
    set ::hint 0
    show_hint
}

proc show_hint {} {
    global trivchan answer question hint ::HINT_CHAR timerid bold col blue yellow red green reset
    catch {killutimer $timerid}
    incr hint
    set d $answer

    if {$hint == 1} {
        regsub -all . $d $::HINT_CHAR d
    } else {
        set clean [regsub -all {[^A-Za-z0-9ăîâșțĂÎÂȘȚ]} $d ""]
        set reveal [expr {($hint-1)*2}]
        set shown {}
        while {[llength $shown] < $reveal && [string length $clean]} {
            lappend shown [string index $clean [expr {int(rand()*[string length $clean])}]]
        }
        set d ""
        foreach c [split $answer ""] {
            if {[regexp {[A-Za-z0-9ăîâșțĂÎÂȘȚ]} $c] && $c ni $shown} {
                append d $::HINT_CHAR
            } else { append d $c }
        }
    }

    putquick "PRIVMSG $trivchan :${bold}${col}${blue}Vraag $hint/6${reset} ==="
    putquick "PRIVMSG $trivchan :${bold}$question${reset}"
    putquick "PRIVMSG $trivchan :${bold}${col}${green}Antwoord:${reset} $d"

    if {$hint >= 6} {
        putquick "PRIVMSG $trivchan :${bold}${col}${red}Niemand wist het!${reset} Antwoord was: ${bold}${col}${green}$answer${reset}"
        set timerid [utimer 8 next_question]
    } else {
        set timerid [utimer 18 show_hint]
    }
}

proc triv_check {nick uhost hand chan text} {
    global trivchan running answer hint ::POINTS timerid bold col green yellow blue red reset L
    if {!$running || [string tolower $chan] ne [string tolower $trivchan]} return

    set g [string tolower [string trim $text]]
    set a [string tolower $answer]
    foreach {x y} {ă a â a î i ș s ț t Ă A Â A Î I Ș S Ț T} {
        set g [string map [list $x $y] $g]
        set a [string map [list $x $y] $a]
    }

    if {$g eq $a || [regsub -all {\W} $g ""] eq [regsub -all {\W} $a ""]} {
        catch {killutimer $timerid}

        set p [lindex $::POINTS [expr {$hint-1 < [llength $::POINTS] ? $hint-1 : -1}]]
        if {$p eq ""} {set p 0}

        add_score $nick $p
        set tot [get_score $nick]
        set r   [get_rank $nick]

        putquick "PRIVMSG $trivchan :${bold}${col}${green}GOED $nick!${reset} → ${bold}${col}${red}$answer${reset}"

        set msg "$::L(you_have) ${bold}$tot${reset} $::L(point)[expr {$tot==1?"":"s"}] (${bold}${col}${blue}Rank #$r${reset})"
        if {$p > 0} {
            append msg " ${bold}${col}${green}(+$p ptn)${reset}"
        } else {
            append msg " ${bold}${col}${red}$::L(too_many_hints)${reset}"
        }
        putquick "PRIVMSG $trivchan :$msg"

        set timerid [utimer 8 next_question]
    }
}

# ================== SCORE PROCS ==================
proc add_score {n p} {
    global scorefile
    set d [dict create]
    if {[file exists $scorefile]} {
        set f [open $scorefile]
        while {[gets $f l]>=0} {
            if {[regexp {^(\d+),.*,(.+),(.+)$} $l -> s nick low]} {dict set d $low [list $s $nick]}
        }
        close $f
    }
    set low [string tolower $n]
    if {[dict exists $d $low]} {
        lassign [dict get $d $low] s nick; incr s $p
    } else {
        set s $p; set nick $n
    }
    dict set d $low [list $s $nick]
    set f [open $scorefile w]
    foreach k [lsort -integer -decreasing -command {lassign [dict get $d a] pa; lassign [dict get $d b] pb; expr {$pa-$pb}} [dict keys $d]] {
        lassign [dict get $d $k] s nick
        puts $f "$s,0,$nick,$k"
    }
    close $f
}
proc get_score {n} { global scorefile; if {![file exists $scorefile]} {return 0}; set low [string tolower $n]; set f [open $scorefile]; while {[gets $f l]>=0} {if {[string match "*,*,$low" $l]} {regexp {^(\d+)} $l -> s; close $f; return $s}}; close $f; return 0 }
proc get_rank  {n} { global scorefile; if {![file exists $scorefile]} {return "-"}; set low [string tolower $n]; set f [open $scorefile]; set r 0; while {[gets $f l]>=0} {incr r; if {[string match "*,*,$low" $l]} {close $f; return $r}}; close $f; return "-" }


putlog "Trivia loaded – language: $lang – colors: [expr {$use_colors ? {ON} : {OFF}}] – type !start in $trivchan"
