######################################################################
#PLEASE customise the settings before rehashing your bot!            #
######################################################################

#  The full path to the file containing the questions and answers.
#  The account the bot runs on must have read access to this file.
set tgqdb "scripts/trivia.questions"

#  The character that seperates the question and the answer in the
#  Vraag/answer file.
set tgqdbsep "|"

#  What you set here defines how the bot expects the Vraag/answer
#  pairs to be arranged.
#  If set to 1, bot expects lines in the format:
#    Vraag<seperator>answer
#  If set to 0, bot expects lines in the format:
#    answer<seperator>Vraag
set tgqdbVraagfirst 0

#  The full path to the file which tracks the scores. The account
#  the bot runs on must have read & write access to this file. If
#  the file does not exist, it will be created when needed.
set tgscf "scripts/trivia.scores"

#  How to send error reports. Set to 1 to send error report to an
#  e-mail address of your choice, or 0 to record errors in a file.
#  Sending via e-mail requires that the bot have access to the "zandman1@hotmail.com"
#  program. If the bot doesn't have access to this program (e.g. if
#  you're running the bot on the Windows platform), then set this to
#  0 to have errors recorded in a file.
set tgerrmethod 0

#  The full path to the file which records error reports. The
#  account the bot runs on must have read & write access to this
#  file. If the file does not exist, it will be created when needed.
set tgerrfil "scripts/trivia.errors"

#  The e-mail address to send error reports to.
set tgerremail "<your@email>"

#  If error reports are sent via e-mail, where will the bot create
#  a temp file? /tmp/ is a good idea.
set tgerrmailtmp "/tmp/"

#  The full path to the file which the bot will use to generate
#  an HTML info page. The account the bot runs on must have read
#  & write access to this file. If the file does not exist, it will
#  be created when needed.
set tghtmlfile "/var/www/trivia.html"

#  How often (in seconds) does the html file get updated. Set to 0
#  to disable HTML page.
set tghtmlrefresh 20

#  The font to use on the html page.
set tghtmlfont "verdana,helvetica,arial"

#  The name of the channel where the game will be played. The game
#  can only be played on one channel.
set tgchan "#<yourchan>"

#  How many points to give a person for a correctly answered
#  Vraag.
set tgpointsperanswer 42

#  The maximum number of hints to give before the Vraag 'expires'
#  and the bot goes on to another one. This EXCLUDES the first hint
#  given as the Vraag is asked (i.e. the hint which shows no letters,
#  only placeholders).
set tgmaxhint 5

#  Should the bot show the Vraag on each hint (1) or only on the first (0)?
set tgalwaysshowq 0

#  Show Questions in all CAPS (1) or not (0)?
set tgcapsQuestion 0

#  Show answers in all CAPS (1) or not (0)?
set tgcapsanswer 0

#  Show hints in all CAPS (1) or not (0)?
set tgcapshint 0

#  The minimum number of correct answers in a row by one person which
#  puts them on a winning streak. Setting this to 0 will disable the
#  winning streak feature.
set tgstreakmin 3

#  The number of missed (i.e. unanswered, not skipped) Vraags to allow
#  before automatically stopping the game. Setting this to 0 will cause the
#  game to run until somebody uses the stop command, or the bot dies, gets
#  killed, pings out, or whatever.
set tgmaxmissed 20

#  The character to use as a placeholder in hints.
set tghintchar "."

#  The time in seconds between hints.
set tgtimehint 12

#  The time in seconds between a correct answer, 'expired' or skipped Vraag
#  and the next Vraag being asked.
set tgtimenext 5

#  Phrases to use at random when someone answers a Vraag correctly. This must
#  be a TCL list. If you don't know what that means, stick to the defaults.
set tgcongrats [list "You're on a streak" "Great!" "You Show-off" "Too easy for you huh"]

#  Phrases to use when the Vraag has 'expired'. Must also be a TCL list.
set tgnobodygotit [list "Nobody got it right." "Hello? Anybody in there ?" "You can do better, woosies" "Too simple for you?" "Am I playing on my own?" "That's the way to lose!"]

#  Phrases to use when the Vraag expired and there's another one coming up.
#  Yep, you guessed it... another TCL list.
set tgtrythenextone [list "Here is the next one..." "Brace yourselves.. here comes the next question..." "Will you get it right this time?..." "And here it comes..."]

#  Will the bot calculate the time it took to get the correct
#  answer (1) or not (0)? (requires TCL 8.3 or higher).
set tgtimeanswer 1

#  Will the bot show the correct answer if nobody gets it (1) or not (0)?
set tgshowanswer 1

#  When someone answers a Vraag, will the bot show just that person's score (0)
#  or will it show all players' scores (1) (default). This is useful in channels with
#  a large number (>20) players.
set tgshowallscores 1

#  Use bold codes in messages (1) or not (0)?
set tgusebold 0

#  Send private messages using /msg (1) or not (0)?
#  If set to 0, private messages will be sent using /notice
set tgpriv2msg 0

#  Word to use as /msg command to give help.
#  e.g. set tgcmdhelp "helpme" will make the bot give help when someone
#  does "/msg <botnick> helpme"
set tgcmdhelp "?"

#  Channel command used to start the game.
set tgcmdstart "!trivia"

#  Flags required to be able to use the start command.
set tgflagsstart "-|-"

#  Channel command used to stop the game.
set tgcmdstop "!strivia"

#  Flags required to be able to use the stop command.
set tgflagsstop "-|-"

#  Channel command used to give a hint.
set tgcmdhint "!hint"

#  Flags required to be able to use the hint command.
set tgflagshint "-|-"

#  Disable the !hint command x seconds after someone uses it. This
#  prevents accidental double hints if two people use the command in
#  quick succession.
set tgtempnohint 10

#  Channel command used to skip the Vraag.
set tgcmdskip "!skip"

#  Flags required to be able to use the skip command.
set tgflagsskip "-|-"

#  Channel command for showing the top 10 scores.
set tgcmdtop10 "!scores"

#  Flags required to use the top 10 command.
set tgflagstop10 "-|-"

#  /msg command used to reset scores.
set tgcmdreset "reset"

#  Flags required to be able to use the reset command.
set tgflagsreset "m|m"

#  /msg command for looking up somebody's score.
set tgcmdlookup "score"

#  /msg command for looking up your target.
#  (i.e. the person ranked one higher than you).
set tgcmdtarget "target"

#  /msg command for reporting errors in Vraags and/or answers.
set tgcmderror "error"

#  /msg command to show channel's rules.
set tgcmdrules "rules"

#  Channel's rules.
set tgrules "No advertising, no profanity, no harassing of users, no active scripts and no flooding. Break the rules and expect to be banned. Have fun. :-)"

#  Number of minutes between reminders of how to report errors.
set tgerrremindtime 15

#  COLOURS
#  The colour codes used are the same as those used by mIRC:
#  00:white        01:black        02:dark blue    03:dark green
#  04:red          05:brown        06:purple       07:orange
#  08:yellow       09:light green  10:turquoise    11:cyan
#  12:light blue   13:magenta      14:dark grey    15:light grey
#
#  Always specify colour codes as two digits, i.e. use "01" for
#  black, not "1".
#  You can specify a background colour using "00,04" (white text
#  on red background).
#  To disable a colour, use "".
#  Note that disabling some colours but not others may yield
#  unexpected results.

# set tgcolourstart "03,00"		;#Game has started.
# set tgcolourstop "04,00"		;#Game has stopped.
# set tgcolourskip "10"		;#Vraag has been skipped.
# set tgcolourerr "04"		;#How to report errors.
# set tgcolourmiss "10"		;#Nobody answered the Vraag.
# set tgcolourqhead "04"		;#Vraag heading.
# set tgcolourqbody "12,00"		;#Vraag itself.
# set tgcolourhint "03"		;#Hint.
# set tgcolourstrk "12,00"	;#Person is on a winning streak.
# set tgcolourscr1 "04"		;#Score of person in first place.
# set tgcolourscr2 "12"		;#Score of person in second place.
# set tgcolourscr3 "03"		;#Score of person in third place.
# set tgcolourrset "04"		;#Scores have been reset.
# set tgcolourstend "12"		;#Winning streak ended.
# set tgcolourmisc1 "06"		;#Miscellaneous colour #1.
# set tgcolourmisc2 "04"		;#Miscellaneous colour #2.

# no colour
set tgcolourstart "01,00"               ;#Game has started.
set tgcolourstop "01,00"                ;#Game has stopped.
set tgcolourskip "1,00"           ;#Vraag has been skipped.
set tgcolourerr "01,00"            ;#How to report errors.
set tgcolourmiss "01"           ;#Nobody answered the Vraag.
set tgcolourqhead "01"          ;#Vraag heading.
set tgcolourqbody "1,00"               ;#Vraag itself.
set tgcolourhint "01"           ;#Hint.
set tgcolourstrk "01,00"        ;#Person is on a winning streak.
set tgcolourscr1 "01"           ;#Score of person in first place.
set tgcolourscr2 "01"           ;#Score of person in second place.
set tgcolourscr3 "01"           ;#Score of person in third place.
set tgcolourrset "01"           ;#Scores have been reset.
set tgcolourstend "01"          ;#Winning streak ended.
set tgcolourmisc1 "01"          ;#Miscellaneous colour #1.
set tgcolourmisc2 "01"          ;#Miscellaneous colour #2.


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                   #
#    Any editing done beyond this point is done at your own risk!   #
#                                                                   #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#Misc checks & var initialisations
set tgver "1.3.2"
set tgrel "release"
if {[info tclversion]<8.2} {
 putlog "\002[file tail [info script]]\002 failed to load: in order to use this script, eggdrop needs to be compiled to use tcl 8.2 or higher (recommended: latest stable version)."
 return
}
if {$tgtimeanswer==1&&[info tclversion]<8.3} {
 putlog "\002[file tail [info script]]\002 warning: timing of answers has been automatically disabled. this feature requires tcl 8.3 or higher."
 set tgtimeanswer 0
}
if {![info exists alltools_loaded]||$allt_version<204} {
 putlog "\002[file tail [info script]]\002 failed to load: please load alltools.tcl v1.6 or higher before attempting to load this script."
 return
}
if {[utimerexists tghtml]!=""} {killutimer $tghtmlrefreshtimer}
if {$tghtmlrefresh>0} {
 set tghtmlrefreshtimer [utimer $tghtmlrefresh tghtml]
}
if {![file exists $tgqdb]} {
 putlog "\002[file tail [info script]]\002 failed to load: $tgqdb does not exist."
 return
}
if {[llength [split $tgchan]]!=1} {
 putlog "\002[file tail [info script]]\002 failed to load: too many channels specified."
 return
}
if {![info exists tgplaying]} {
 set ctcp-version "${ctcp-version} (with trivia.tcl $tgver ($tgrel) from www.eggdrop.za.net)"
 set tgplaying 0
}
if {![info exists tghintnum]} {set tghintnum 0}
if {![info exists tgmissed]} {set tgmissed 0}

#Binds
bind pub $tgflagsstart $tgcmdstart tgstart
bind pub $tgflagsstop $tgcmdstop tgstop
proc tgbindhintcmd {} {
 global tgflagshint tgcmdhint
 bind pub $tgflagshint $tgcmdhint tgforcehint
}
proc tgunbindhintcmd {} {
 global tgflagshint tgcmdhint
 unbind pub $tgflagshint $tgcmdhint tgforcehint
}
tgbindhintcmd
bind pub $tgflagsskip $tgcmdskip tgskip
bind pub $tgflagstop10 $tgcmdtop10 tgshowtop10
bind join -|- "$tgchan *" tgjoinmsg
bind msg - $tgcmdhelp tggivehelp
bind msg - $tgcmdlookup tgscorelookup
bind msg - $tgcmdtarget tgtargetlookup
bind msg - $tgcmderror tgerror
bind msg - $tgcmdrules tgrulesmsg
bind msg $tgflagsreset "$tgcmdreset" tgresetscores
bind kick - "$tgchan $botnick" tgbotgotkicked
bind evnt - disconnect-server tgbotgotdisconnected

#starts the game if it isn't running.
proc tgstart {nick host hand chan text} {
 global tgplaying tgstreak tgchan tgerrremindtime tgerrremindtimer tgmissed
 if {[strlwr $tgchan]==[strlwr $chan]} {
  if {$tgplaying==0} {
   tggamemsg "[tgcolstart]Het Trivia spel is Gestart Door $nick!"
   tgnextq
   set tgplaying 1
   set tgstreak 0
   set tgmissed 0
   set tgerrremindtimer [timer $tgerrremindtime tgerrremind]
  }
 }
}

#stops the game if it's running.
proc tgstop {nick host hand chan text} {
 global tghinttimer tgnextqtimer tgplaying tgchan tgcurrentanswer tgstreak tgstreakmin
 global tgerrremindtimer tgrebindhinttimer
 if {[strlwr $tgchan]==[strlwr $chan]} {
  if {$tgplaying==1} {
   tggamemsg "[tgcolstop]Het Trivia Spel is Gestopt Door $nick!"
   if {$tgstreakmin>0&&[lindex [split $tgstreak ,] 1]>=$tgstreakmin} { tgstreakend }
   set tgstreak 0
   set tgplaying 0
   catch {unbind pubm -|- "$tgchan $tgcurrentanswer" tgcorrectanswer}
   if {[utimerexists tghint]!=""} {killutimer $tghinttimer}
   if {[utimerexists tgnextq]!=""} {killutimer $tgnextqtimer}
   if {[timerexists tgerrremind]!=""} {killtimer $tgerrremindtimer}
   if {[utimerexists tgrebindhinttimer]!=""} {killtimer $tgrebindhinttimer}
  }
 }
}

#gives a hint if there is currently a Vraag to answer.
proc tgforcehint {nick host hand chan text} {
 global tghinttimer tgnextqtimer tgplaying tgchan tgcurrentanswer tgstreak tgstreakmin
 global tgtempnohint tgmaxhintcurrent tghintnum tgrebindhinttimer tgtempnohint
 if {[strlwr $tgchan]==[strlwr $chan]} {
  if {$tgplaying==1&&[utimerexists tghint]!=""} {
   killutimer $tghinttimer
   tghint
   tgunbindhintcmd
   if {$tghintnum<$tgmaxhintcurrent} {
    set tgrebindhinttimer [utimer $tgtempnohint tgbindhintcmd]
   }
  }
 }
}

#skips the current Vraag if one has been asked.
proc tgskip {nick host hand chan text} {
 global tghinttimer tgnextqtimer tgplaying tgchan tgcurrentanswer tgstreak
 global tgstreakmin tgtimenext tgrebindhinttimer
 if {[strlwr $tgchan]==[strlwr $chan]} {
  if {$tgplaying==1&&[utimerexists tghint]!=""} {
   tggamemsg "[tgcolskip]Vraag overgeslaan door [tgcolmisc2]$nick's[tgcolskip] verzoek..."
   if {$tgstreakmin>0&&[lindex [split $tgstreak ,] 1]>=$tgstreakmin&&[strlwr [lindex [split $tgstreak ,] 0]]==[strlwr $nick]} {
    tgstreakend
    set tgstreak 0
   }
   unbind pubm -|- "$tgchan $tgcurrentanswer" tgcorrectanswer
   killutimer $tghinttimer
   if {[utimerexists tgrebindhinttimer]!=""} {killtimer $tgrebindhinttimer}
   set tgnextqtimer [utimer $tgtimenext tgnextq]
  }
 }
}

#reminds channel how to report errors in Vraag/answers
proc tgerrremind {} {
 global tgerrremindtimer tgerrremindtime botnick tgcmderror
 tggamemsg "[tgcolerr]onthoud: de errors in Vraag/antwoord, typ /msg $botnick $tgcmderror <number> \[description\]"
 set tgerrremindtimer [timer $tgerrremindtime tgerrremind]
}

#bot got kicked. stop the game.
proc tgbotgotkicked {nick host hand chan targ text} {
 tgquietstop
}

#bot got disconnected. stop the game.
proc tgbotgotdisconnected {disconnect-server} {
 tgquietstop
}

#stops the game without telling the channel.
proc tgquietstop {} {
 global tgplaying tgstreak tgchan tgcurrentanswer tghinttimer tgnextqtimer tgerrremindtimer
 global tgrebindhinttimer
 if {$tgplaying==1} {
  set tgstreak 0
  set tgplaying 0
  catch {unbind pubm -|- "$tgchan $tgcurrentanswer" tgcorrectanswer}
  if {[utimerexists tghint]!=""} {killutimer $tghinttimer}
  if {[utimerexists tgnextq]!=""} {killutimer $tgnextqtimer}
  if {[timerexists tgerrremind]!=""} {killtimer $tgerrremindtimer}
  if {[utimerexists tgrebindhinttimer]!=""} {killtimer $tgrebindhinttimer}
 }
}

#reads the Vraag database.
proc tgreadqdb {} {
 global tgqdb tgVraagstotal tgVraagslist
 set tgVraagstotal 0
 set tgVraagslist ""
 set qfile [open $tgqdb r]
 set tgVraagslist [split [read -nonewline $qfile] "\n"]
 set tgVraagstotal [llength $tgVraagslist]
 close $qfile
}

#selects the next Vraag.
proc tgnextq {} {
 global tgqdb tgcurrentVraag tgcurrentanswer tgVraagnumber tgVraagstotal
 global tghintnum tgchan tgVraagslist tgqdbsep tgqdbVraagfirst
 global tgcapsVraag tgcapsanswer
 tgreadqdb
 set tgVraagnumber [rand [llength $tgVraagslist]]			
 set tgVraagselected [lindex $tgVraagslist $tgVraagnumber]
 set tgcurrentVraag [lindex [split $tgVraagselected $tgqdbsep] [expr $tgqdbVraagfirst^1]]
 if {$tgcapsVraag==1} {
  set tgcurrentVraag [strupr $tgcurrentVraag]
 }
 set tgcurrentanswer [strlwr [lindex [split $tgVraagselected $tgqdbsep] $tgqdbVraagfirst]]
 if {$tgcapsanswer==1} {
  set tgcurrentanswer [strupr $tgcurrentanswer]
 }
 unset tghintnum
 tghint
 bind pubm -|- "$tgchan $tgcurrentanswer" tgcorrectanswer
 return
}

#shows timed hints.
proc tghint {} {
 global tgmaxhint tghintnum tgcurrentanswer tghinttimer tgchan
 global tgtimehint tghintchar tgVraagnumber tgVraagstotal
 global tgcurrentVraag tghintcharsused tgnextqtimer tgtimenext tgstreak tgstreakmin
 global tgnobodygotit tgtrythenextone tgmissed tgmaxmissed tgcmdstart tgshowanswer
 global tgtimestart tgtimeanswer tgalwaysshowq tgmaxhintcurrent tgtempnohint tgcapshint
 if {[catch {incr tghintnum}]!=0} {
  set tghintnum 0
  regsub -all -- "\[^A-Za-z0-9\]" [string trim $tgcurrentanswer] "" _hintchars
  set tgmaxhintcurrent [expr [strlen $_hintchars]<=$tgmaxhint?[expr [strlen $_hintchars]-1]:$tgmaxhint]
  catch {tgunbindhintcmd}
  if {$tgmaxhintcurrent>0} {
   set tgrebindhinttimer [utimer $tgtempnohint tgbindhintcmd]
  }
 }
 if {$tghintnum >= [expr $tgmaxhintcurrent+1]} {
  incr tgmissed
  set _msg ""
  append _msg "[tgcolmiss][lindex $tgnobodygotit [rand [llength $tgnobodygotit]]]"
  if {$tgshowanswer==1} {
   append _msg " Het antwoord was [tgcolmisc2]$tgcurrentanswer[tgcolmiss]."
  }
  if {$tgmaxmissed>0&&$tgmissed>=$tgmaxmissed} {
   append _msg " De $tgmissed Vragen waren niet beantwoord! Trivia is gestopt. Om weer te starten, typ $tgcmdstart"
   tgquietstop
  } else {
   append _msg " [lindex $tgtrythenextone [rand [llength $tgtrythenextone]]]"
  }
  tggamemsg "[tgcolmiss]$_msg"
  if {$tgstreakmin>0&&[lindex [split $tgstreak ,] 1]>=$tgstreakmin} { tgstreakend }
  set tgstreak 0
  catch {unbind pubm -|- "$tgchan $tgcurrentanswer" tgcorrectanswer}
  if {$tgmaxmissed==0||$tgmissed<$tgmaxmissed} {
   set tgnextqtimer [utimer $tgtimenext tgnextq]
  }
  return
 } elseif {$tghintnum == 0} {
  set i 0
  set _hint {}
  set tghintcharsused {}
  foreach word [split $tgcurrentanswer] {
   regsub -all -- "\[A-Za-z0-9\]" $word $tghintchar _current
   lappend _hint $_current
  }
  if {$tgtimeanswer==1} {
   set tgtimestart [clock clicks -milliseconds]
  }
 } elseif {$tghintnum == 1} {
  set i 0
  set _hint {}
  while {$i<[llength [split $tgcurrentanswer]]} {
   set _word [lindex [split $tgcurrentanswer] $i]
   set j 0
   set _newword {}
   while {$j<[strlen $_word]} {
    if {$j==0} {
     append _newword [stridx $_word $j]
     lappend tghintcharsused $i,$j
    } else {
     if {[string is alnum [stridx $_word $j]]} {
      append _newword $tghintchar
     } else {
      append _newword [stridx $_word $j]
      lappend tghintcharsused $i,$j
     }
    }
    incr j
   }
   lappend _hint $_newword
   incr i
  }
  } else {
   set i 0
   set _hint {}
   while {$i<[llength [split $tgcurrentanswer]]} {
    set _word [lindex [split $tgcurrentanswer] $i]
    set j 0
    set _newword {}
    set _selected [rand [strlen $_word]]
    regsub -all -- "\[^A-Za-z0-9\]" $_word "" _wordalnum
    if {[strlen $_wordalnum]>=$tghintnum} {
     while {[lsearch $tghintcharsused $i,$_selected]!=-1||[string is alnum [stridx $_word $_selected]]==0} {
      set _selected [rand [strlen $_word]]
     }
    }
    lappend tghintcharsused $i,$_selected
    while {$j<[strlen $_word]} {
     if {[lsearch $tghintcharsused $i,$j]!=-1||[string is alnum [stridx $_word $j]]==0} {
      append _newword [stridx $_word $j]
     } else {
      if {[string is alnum [stridx $_word $j]]} {
       append _newword $tghintchar
      }
    }
    incr j
   }
   lappend _hint $_newword
   incr i
  }
 }
 if {$tgcapshint==1} {
  set _hint [strupr $_hint]
 }
 tggamemsg "[tgcolqhead]===== Vraag [expr $tgVraagnumber+1]/$tgVraagstotal [expr $tghintnum?"(Hint $tghintnum/$tgmaxhintcurrent)":""] ====="
 if {$tgalwaysshowq==1||$tghintnum==0} {
  tggamemsg "[tgcolqbody]$tgcurrentVraag"
 }
 tggamemsg "[tgcolhint]Hint: [join $_hint]"
 set tghinttimer [utimer $tgtimehint tghint]
}

#triggered when someone uses !top10 command
proc tgshowtop10 {nick host hand chan text} {
 global tgscores tgchan tgscorestotal
 if {[strlwr $chan]==[strlwr $tgchan]} {
  tggetscores
  if {$tgscorestotal>0} {
   if {$tgscorestotal>9} {
    set _max 9
   } else {
    set _max [expr $tgscorestotal-1]
   }
   set i 0
   while {$i<=$_max} {
    set _item [lindex $tgscores $i]
    set _nick [join [lindex [split $_item ,] 2]]
    set _score [join [lindex [split $_item ,] 0]]
    if {$i==0} {
     append _scores "[tgcolscr1]$_nick $_score"
    } elseif {$i==1} {
     append _scores ", [tgcolscr2]$_nick $_score"
    } elseif {$i==2} {
     append _scores ", [tgcolscr3]$_nick $_score"
    } else {
     append _scores ", [tgcolmisc1]$_nick $_score"
    }
    incr i
   }
   tggamemsg "[tgcolmisc1]Top 10: $_scores"
  } else {
   tggamemsg "[tgcolmisc1]Score table is empty."
  }
 }
}

#triggered when someone says the correct answer.
proc tgcorrectanswer {nick host hand chan text} {
 global tgcurrentanswer tghinttimer tgtimenext tgchan tgnextqtimer tgstreak tgstreakmin
 global tgscoresbyname tgranksbyname tgranksbynum tgcongrats tgscorestotal tgmissed
 global tgtimestart tgshowallscores tgrealnames tgscoresbyrank tgtimeanswer
 tggetscores
 if {![info exists tgranksbyname([strlwr $nick])]} {
  set _oldrank 0
 } else {
  set _oldrank $tgranksbyname([strlwr $nick])
 }
 tgincrscore $nick
 tggetscores
 set _newrank $tgranksbyname([strlwr $nick])
 set _timetoanswer ""
 if {$tgtimeanswer==1} {
  set _timetoanswer [expr [expr [clock clicks -milliseconds]-$tgtimestart]/1000.00]
 }
 set _msg "[tgcolmisc1][lindex $tgcongrats [rand [llength $tgcongrats]]] [tgcolmisc2]$nick[tgcolmisc1]! Het antwoord was [tgcolmisc2]$tgcurrentanswer[tgcolmisc1].[expr $tgtimeanswer==1?" Gevonden in   [tgcolmisc2]$_timetoanswer[tgcolmisc1] seconds.":""]"
 if {$_newrank<$_oldrank} {
  if {$_newrank==1} {
   append _msg " Nu zit je op de Eerste plaats!"
  } else {
   if {$tgshowallscores==0} {
    append _msg " Weeral een plaats vooruit!"
   } else {
    append _msg " You are now ranked [tgcolmisc2][tgordnum $tgranksbyname([strlwr $nick])][tgcolmisc1] of [tgcolmisc2]$tgscorestotal[tgcolmisc1], behind [tgcolmisc2]$tgrealnames($tgranksbynum([expr $_newrank-1]))[tgcolmisc1] with [tgcolmisc2]$tgscoresbyrank([expr $_newrank-1])[tgcolmisc1]."
   }
  }
 }
 tggamemsg "$_msg"
 if {$tgstreak!=0} {
  if {[lindex [split $tgstreak ,] 0]==[strlwr $nick]} {
   set tgstreak [strlwr $nick],[expr [lindex [split $tgstreak ,] 1]+1]
   if {$tgstreakmin>0&&[lindex [split $tgstreak ,] 1]>=$tgstreakmin} {
    tggamemsg "[tgcolstrk][tgcolmisc2]$nick[tgcolstrk] is on a winning streak! [tgcolmisc2][lindex [split $tgstreak ,] 1] [tgcolstrk]in a row so far!"
   }
  } else {
   if {$tgstreakmin>0&&[lindex [split $tgstreak ,] 1]>=$tgstreakmin} { tgstreakend }
   set tgstreak [strlwr $nick],1
  }
 } else {
  set tgstreak [strlwr $nick],1
 }
 set tgmissed 0
 tgshowscores $nick
 unbind pubm -|- "$tgchan $tgcurrentanswer" tgcorrectanswer
 killutimer $tghinttimer
 set tgnextqtimer [utimer $tgtimenext tgnextq]
}

#read current scores from file, sort and store in variable.
proc tggetscores {} {
 global tgscf tgscorestotal tgscores tgscoresbyname tgranksbyname tgranksbynum
 global tgrealnames tgscoresbyrank
 if {[file exists $tgscf]&&[file size $tgscf]>2} {
  set _sfile [open $tgscf r]
  set tgscores [lsort -dict -decreasing [split [gets $_sfile]]]
  close $_sfile
  set tgscorestotal [llength $tgscores]
 } else {
  set tgscores ""
  set tgscorestotal 0
 }
 if {[info exists tgscoresbyname]} {unset tgscoresbyname}
 if {[info exists tgranksbyname]} {unset tgranksbyname}
 if {[info exists tgrealnames]} {unset tgrealnames}
 if {[info exists tgranksbynum]} {unset tgranksbynum}
 set i 0
 while {$i<[llength $tgscores]} {
  set _item [lindex $tgscores $i]
  set _nick [lindex [split $_item ,] 2]
  set _lwrnick [lindex [split $_item ,] 3]
  set _score [lindex [split $_item ,] 0]
  set tgscoresbyname($_lwrnick) $_score
  set tgrealnames($_lwrnick) $_nick
  set tgranksbyname($_lwrnick) [expr $i+1]
  set tgranksbynum([expr $i+1]) $_lwrnick
  set tgscoresbyrank([expr $i+1]) $_score
  incr i
 }
 return
}

#increment someone's score.
proc tgincrscore {who} {
 global tgscores tgscf tgpointsperanswer tgscorestotal tgscoresbyname
 tggetscores
 if {$tgscorestotal>0} {
  set i 0
  if {![info exists tgscoresbyname([strlwr $who])]} {
   append _newscores "1,[expr 1000000000000.0/[unixtime]],$who,[strlwr $who] "
  }
  while {$i<[llength $tgscores]} {
   set _item [lindex $tgscores $i]
   set _nick [lindex [split $_item ,] 2]
   set _time [lindex [split $_item ,] 1]
   set _score [lindex [split $_item ,] 0]
   if {[strlwr $who]==[strlwr $_nick]} {
    append _newscores "[expr $_score+$tgpointsperanswer],[expr 1000000000000.0/[unixtime]],$who,[strlwr $who][expr [expr [llength $tgscores]-$i]==1?"":"\ "]"
   } else {
    append _newscores "$_score,$_time,$_nick,[strlwr $_nick][expr [expr [llength $tgscores]-$i]==1?"":"\ "]"
   }
   incr i
  }
 } else {
  append _newscores "1,[expr 1000000000000.0/[unixtime]],$who,[strlwr $who]"
 }
 set _sfile [open $tgscf w]
 puts $_sfile "$_newscores"
 close $_sfile
 return
}

#shows the current scores on channel.
proc tgshowscores {nick} {
 global tgscores tgchan tgscorestotal tgshowallscores tgranksbyname tgranksbynum
 global tgscoresbyname tgrealnames tgscoresbyrank
 tggetscores
 set i 0
 if {$tgshowallscores} {
  while {$i<[llength $tgscores]} {
   set _item [lindex $tgscores $i]
   set _nick [lindex [split $_item ,] 2]
   set _score [lindex [split $_item ,] 0]
   if {$i==0} {
    append _scores "[tgcolscr1]$_nick $_score"
   } elseif {$i==1} {
    append _scores ", [tgcolscr2]$_nick $_score"
   } elseif {$i==2} {
    append _scores ", [tgcolscr3]$_nick $_score"
   } elseif {[onchan $_nick $tgchan]} {
    append _scores ", [tgcolmisc1]$_nick $_score"
   }
   incr i
  }
  tggamemsg "[tgcolmisc1]De Scores: $_scores"
 } else {
  if {$tgranksbyname([strlwr $nick])==1} {
   set _tgt "."
  } else {
   set _tgt ", behind [tgcolmisc2]$tgrealnames($tgranksbynum([expr $tgranksbyname([strlwr $nick])-1]))[tgcolmisc1] with [tgcolmisc2]$tgscoresbyrank([expr $tgranksbyname([strlwr $nick])-1])[tgcolmisc1]."
  }
  tggamemsg "[tgcolmisc2]$nick [tgcolmisc1]Geeft nu  [tgcolmisc2]$tgscoresbyname([strlwr $nick]) [tgcolmisc1][expr $tgscoresbyname([strlwr $nick])==1?"point":"punten"] zijn gerangschikt [tgcolmisc2][tgordnum $tgranksbyname([strlwr $nick])] [tgcolmisc1]of [tgcolmisc2]$tgscorestotal[tgcolmisc1]$_tgt"
 }
}

#reset current scores.
proc tgresetscores {nick host hand text} {
 global tgscf tgscorestotal tgscores tgplaying
 if {[file exists $tgscf]&&[file size $tgscf]>2} {
  set _sfile [open $tgscf w]
  puts $_sfile ""
  close $_sfile
  set tgscores ""
  set tgscorestotal 0
 }
 tggamemsg "[tgcolrset]===== Score table reset by $nick! ====="
}

#triggered when a winning streak ends.
proc tgstreakend {} {
  global tgstreak tgrealnames
  tggamemsg "[tgcolstend]So much for [tgcolmisc2]$tgrealnames([lindex [split $tgstreak ,] 0])'s[tgcolstend] winning streak."
  return
}

#triggered when someone joins trivia chan.
proc tgjoinmsg {nick host hand chan} {
 global botnick tgplaying tgcmdhelp tgcmdstart tgflagsstart tgcmdstop tgflagsstop tgchan
 if {$nick != $botnick} {
  set _msg ""
  append _msg "Welcome to $botnick's trivia channel. Trivia game is currently"
  if {$tgplaying==1} {
   append _msg " \002on\002."
  } else {
   append _msg " \002off\002."
  }
  if {[matchattr $hand $tgflagsstart $tgchan]&&$tgplaying==0} {
   append _msg " To start the game, type \002$tgcmdstart\002 on $tgchan."
  }
  append _msg " Please type \002/MSG $botnick [strupr $tgcmdhelp]\002 if you need help. Enjoy your stay! :-)"
  [tgpriv] $nick "$_msg"
 }
}

#triggered when someone /msgs the bot with the score lookup command.
proc tgscorelookup {nick host hand text} {
 global tgscoresbyname tgranksbyname tgscorestotal tgrealnames
 if {$text==""} { set text $nick } else { set text [lindex [split $text] 0] }
 tggetscores
 if {![info exists tgscoresbyname([strlwr $text])]} {
  if {[strlwr $text]==[strlwr $nick]} {
   set _who "[tgcolmisc1]You are"
  } else {
   set _who "[tgcolmisc2]$text [tgcolmisc1]is"
  }
  [tgpriv] $nick "[tgbold]$_who [tgcolmisc1]not on the score list."
 } else {
  if {[strlwr $text]==[strlwr $nick]} {
   set _who "[tgcolmisc1]je hebt"
  } else {
   set _who "[tgcolmisc2]$tgrealnames([strlwr $text]) [tgcolmisc1]has"
  }
  [tgpriv] $nick "[tgbold]$_who [tgcolmisc2]$tgscoresbyname([strlwr $text])[tgcolmisc1] punten, gerangschikt [tgcolmisc2][tgordnum $tgranksbyname([strlwr $text])] [tgcolmisc1]of [tgcolmisc2]$tgscorestotal[tgcolmisc1]."
 }
}

#triggered when someone /msgs the bot with the target lookup command.
proc tgtargetlookup {nick host hand text} {
 global tgscoresbyname tgranksbyname tgscorestotal tgranksbynum tgrealnames
 tggetscores
 if {![info exists tgscoresbyname([strlwr $nick])]} {
  [tgpriv] $nick "[tgbold][tgcolmisc1]You are not on the score list yet."
 } elseif {$tgranksbyname([strlwr $nick])==1} {
  [tgpriv] $nick "[tgbold][tgcolmisc1]You are in first place!"
 } else {
  [tgpriv] $nick "[tgbold][tgcolmisc1]You are on [tgcolmisc2]$tgscoresbyname([strlwr $nick])[tgcolmisc1]. Your next target is [tgcolmisc2]$tgrealnames($tgranksbynum([expr $tgranksbyname([strlwr $nick])-1])) [tgcolmisc1]with [tgcolmisc2]$tgscoresbyname($tgranksbynum([expr $tgranksbyname([strlwr $nick])-1]))[tgcolmisc1], ranked [tgcolmisc2][tgordnum [expr $tgranksbyname([strlwr $nick])-1]] [tgcolmisc1]of [tgcolmisc2]$tgscorestotal[tgcolmisc1]."
 }
}

#triggered when someone /msgs the bot with the error reporting command.
proc tgerror {nick host hand text} {
 global tgVraagstotal tgVraagslist tgerrmethod tgerrfil tgerremail tgerrmailtmp
 if {$text==""||![string is int [lindex [split $text] 0]]} {
  [tgpriv] $nick "[tgbold][tgcolmisc1]You need to specify the number of the Vraag."
  return
 }
 tgreadqdb
 set _qnum [lindex [split $text] 0]
 if {$_qnum>$tgVraagstotal} {
  [tgpriv] $nick "[tgbold][tgcolmisc1]No such Vraag."
  return
 }
 set _qques [lindex [split [lindex $tgVraagslist [expr $_qnum-1]] |] 1]
 set _qans [lindex [split [lindex $tgVraagslist [expr $_qnum-1]] |] 0]
 set _desc [join [lrange [split $text] 1 end]]
 if {$_desc==""} { set _desc "No further info given for this error." }
 if {$tgerrmethod==1} {
  set _fname $tgerrmailtmp\trivia[rand 100000].tmp
  set _file [open $_fname w]
 } else {
  set _file [open $tgerrfil a]
 }
 puts $_file ""
 puts $_file "Error report generated [strftime %A,\ %d\ %B\ %Y\ @\ %H:%M:%S]"
 puts $_file "Reported by:\t$nick!$host"
 puts $_file "Vraag #:\t$_qnum"
 puts $_file "Vraag:\t$_qques"
 puts $_file "Answer:\t\t$_qans"
 puts $_file "Comments:\t$_desc"
 puts $_file "------------------------------"
 close $_file
 if {$tgerrmethod==1} {
  exec mail -s "trivia.tcl error report from $nick" $tgerremail < $_fname
  file delete $_fname
  [tgpriv] $nick "[tgbold][tgcolmisc1]Thanks! Your error report has been e-mailed to my owner."
 } else {
  [tgpriv] $nick "[tgbold][tgcolmisc1]Thanks! Your error report has been logged and will be looked at as soon as possible."
 }
}

#triggered when someone /msgs the bot with the rules command.
proc tgrulesmsg {nick host hand text} {
 global tgrules
 [tgpriv] $nick "The channel's rules are as follows: $tgrules"
}

#triggered when someone /msgs the bot with the help command.
proc tggivehelp {nick host hand {text ""}} {
 global botnick tgcmdlookup tgcmdhelp tgcmdstart tgcmdstop tgchan tgflagsstop
 global tgcmdstop tgflagshint tgcmdhint tgflagsskip tgcmdskip tgflagsreset tgcmdreset
 global tgcmdtarget tgcmderror tgcmdrules tgflagsstart
 if {$text==""} {
  [tgpriv] $nick "You have access to the following /MSG commands:"
  [tgpriv] $nick "To use, /MSG $botnick <command>"
  [tgpriv] $nick "  \002[strupr $tgcmdrules]\002"
  [tgpriv] $nick "   -- Lists the channel rules."
  [tgpriv] $nick "  \002[strupr $tgcmdlookup]\002 \[nick\]"
  [tgpriv] $nick "   -- Shows you the rank & score of \[nick\], if specified,"
  [tgpriv] $nick "    otherwise, shows you your own rank & score."
  [tgpriv] $nick "  \002[strupr $tgcmdtarget]\002"
  [tgpriv] $nick "   -- Shows you the rank & score of the person ranked"
  [tgpriv] $nick "    one above you."
  [tgpriv] $nick "  \002[strupr $tgcmderror]\002 <number> \[description\]"
  [tgpriv] $nick "   -- Reports an error in Vraag <number>"
  [tgpriv] $nick "    The description is optional, but helpful."
  if {[matchattr $hand $tgflagsreset $tgchan]} {
   [tgpriv] $nick "  \002[strupr $tgcmdreset]\002"
   [tgpriv] $nick "   -- Resets the score table."
  }
  [tgpriv] $nick "For a list of channel commands, /MSG $botnick [strupr $tgcmdhelp] PUBCMDS"
 }
 if {[strlwr $text]=="pubcmds"} {
  [tgpriv] $nick "You have access to the following channel commands:"
  if {[matchattr $hand $tgflagsstart $tgchan]} {
   [tgpriv] $nick "  \002$tgcmdstart\002 -- starts the trivia game."
  }
  if {[matchattr $hand $tgflagsstop $tgchan]} {
   [tgpriv] $nick "  \002$tgcmdstop\002 -- stops the trivia game."
  }
  if {[matchattr $hand $tgflagshint $tgchan]} {
   [tgpriv] $nick "  \002$tgcmdhint\002 -- shows a hint."
  }
  if {[matchattr $hand $tgflagsskip $tgchan]} {
   [tgpriv] $nick "  \002$tgcmdskip\002 -- skips current Vraag."
  }
  [tgpriv] $nick "For a list of /MSG commands, /MSG $botnick [strupr $tgcmdhelp]"
 }
}

proc tggamemsg {what} {
 global tgchan
 putquick "PRIVMSG $tgchan :[tgbold]$what"
}

#Returns ordinal version of number passed to it.
#i.e. [tgordnum 1] returns "1st", [tgordnum 33] returns "33rd"
#Surely there's an easier way to do this?
proc tgordnum {num} {
 set _last1 [string range $num [expr [strlen $num]-1] end]
 set _last2 [string range $num [expr [strlen $num]-2] end]
 if {$_last1=="1"&&$_last2!="11"} {
  return "[expr $num]st"
 } elseif {$_last1=="2"&&$_last2!="12"} {
  return "[expr $num]nd"
 } elseif {$_last1=="3"&&$_last2!="13"} {
  return "[expr $num]rd"
 } else {
  return "[expr $num]th"
 }
}
proc tgbold {} {
 global tgusebold
 if {$tgusebold==1} { return "\002" }
}
proc tgcolstart {} {
 global tgcolourstart
 if {$tgcolourstart!=""} { return "\003$tgcolourstart" }
}
proc tgcolstop {} {
 global tgcolourstop
 if {$tgcolourstop!=""} { return "\003$tgcolourstop" }
}
proc tgcolskip {} {
 global tgcolourskip
 if {$tgcolourskip!=""} { return "\003$tgcolourskip" }
}
proc tgcolerr {} {
 global tgcolourerr
 if {$tgcolourerr!=""} { return "\003$tgcolourerr" }
}
proc tgcolmiss {} {
 global tgcolourmiss
 if {$tgcolourmiss!=""} { return "\003$tgcolourmiss" }
}
proc tgcolqhead {} {
 global tgcolourqhead
 if {$tgcolourqhead!=""} { return "\003$tgcolourqhead" }
}
proc tgcolqbody {} {
 global tgcolourqbody
 if {$tgcolourqbody!=""} { return "\003$tgcolourqbody" }
}
proc tgcolhint {} {
 global tgcolourhint
 if {$tgcolourhint!=""} { return "\003$tgcolourhint" }
}
proc tgcolstrk {} {
 global tgcolourstrk
 if {$tgcolourstrk!=""} { return "\003$tgcolourstrk" }
}
proc tgcolscr1 {} {
 global tgcolourscr1
 if {$tgcolourscr1!=""} { return "\003$tgcolourscr1" }
}
proc tgcolscr2 {} {
 global tgcolourscr2
 if {$tgcolourscr2!=""} { return "\003$tgcolourscr2" }
}
proc tgcolscr3 {} {
 global tgcolourscr3
 if {$tgcolourscr3!=""} { return "\003$tgcolourscr3" }
}
proc tgcolrset {} {
 global tgcolourrset
 if {$tgcolourrset!=""} { return "\003$tgcolourrset" }
}
proc tgcolstend {} {
 global tgcolourstend
 if {$tgcolourstend!=""} { return "\003$tgcolourstend" }
}
proc tgcolmisc1 {} {
 global tgcolourmisc1
 if {$tgcolourmisc1!=""} { return "\003$tgcolourmisc1" }
}
proc tgcolmisc2 {} {
 global tgcolourmisc2
 if {$tgcolourmisc2!=""} { return "\003$tgcolourmisc2" }
}
proc tgpriv {} {
 global tgpriv2msg
 if {$tgpriv2msg==1} { return "putmsg" } else { return "putnotc" }
}

#this generates an html file with all the people on the chan with
#their score, as well as a list of all scores, sorted by rank
proc tghtml {} {
 global tgchan botnick tghtmlfile tghtmlrefresh server tgscoresbyname tgranksbyname
 global tgscorestotal tgranksbyname tgrealnames tgscoresbyrank tgranksbynum tgplaying
 global tgVraagstotal tghtmlrefreshtimer tghtmlfont
 tggetscores
 tgreadqdb
 set _file [open $tghtmlfile~new w]
 puts $_file "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">"
 puts $_file "<html>"
 puts $_file " <head>"
 puts $_file "  <title>$botnick's trivia channel: $tgchan on [lindex [split $server :] 0]</title>"
 puts $_file "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"
 puts $_file "  <meta http-equiv=\"refresh\" content=\"$tghtmlrefresh\">"
 puts $_file "  <meta name=\"generator\" content=\"trivia.tcl script for eggdrop. http://www.eggdrop.za.net/\">"
 puts $_file "  <style type=\"text/css\">"
 puts $_file "  <!--"
 puts $_file "  body,td{font-family:$tghtmlfont;font-size:13px;}"
 puts $_file "  a{text-decoration:none;color:#09f;}"
 puts $_file "  -->"
 puts $_file "  </style>"
 puts $_file " </head>"
 puts $_file " <body>"
 puts $_file "  <h1>$tgchan on [lindex [split $server :] 0]</h1>"
 puts $_file "  <hr size=\"1\" noshade>"
 if {![onchan $botnick $tgchan]} {
  puts $_file "  <p>Hmmm... for some reason I'm not on $tgchan at the moment. Please try again later.</p>"
 } else {
  puts $_file "  <p>Trivia game is currently <b>[expr $tgplaying==1?"on":"off"]</b>. There are <b>$tgVraagstotal</b> Vraags in the database."
  puts $_file "  <p>People on $tgchan right now:<br>"
  puts $_file "  <table width=\"50%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\"><tr><td><table width=\"100%\" cellspacing=\"3\" border=\"0\">"
  puts $_file "   <tr>"
  puts $_file "    <td><b>Nick</b></td>"
  puts $_file "    <td><b>Score</b></td>"
  puts $_file "    <td><b>Rank</b></td>"
  puts $_file "    <td><b>Idle</b></td>"
  puts $_file "   </tr>"
  foreach nick [lsort [chanlist $tgchan]] {
   puts $_file "   <tr>"
   puts $_file "    <td>[expr [isop $nick $tgchan]?"@":""][expr [isvoice $nick $tgchan]?"+":""]$nick[expr [string match $nick $botnick]?" (that's me!)":""]</td>"
   if {[info exists tgscoresbyname([strlwr $nick])]} {
    puts $_file "    <td>$tgscoresbyname([strlwr $nick])</td>"
   } else {
    puts $_file "    <td>-</td>"
   }
   if {[info exists tgranksbyname([strlwr $nick])]} {
    puts $_file "    <td>$tgranksbyname([strlwr $nick])</td>"
   } else {
    puts $_file "    <td>-</td>"
   }
   puts $_file "   <td>[expr [getchanidle $nick $tgchan]>10?"[getchanidle $nick $tgchan]m":"-"]</td>"
   puts $_file "   </tr>"
  }
  puts $_file "  </table></td></tr></table>"
 }
 if {$tgscorestotal>0} {
  puts $_file "  <p><small>There [expr $tgscorestotal==1?"is":"are"] currently <b>$tgscorestotal</b> [expr $tgscorestotal==1?"nick":"nicks"] in the score table:<br>"
  set _rank 1
  while {$_rank<=$tgscorestotal} {
   puts $_file "  <b>$_rank</b>. $tgrealnames($tgranksbynum($_rank)) $tgscoresbyrank($_rank)<br>"
   incr _rank
  }
 } else {
  puts $_file "  <p><small>There are currently no nicks in the score table.<br>"
 }
 puts $_file "  </small></p>"
 puts $_file "  <hr size=\"1\" noshade>"
 puts $_file "  <small>Generated on [strftime %A,\ %d\ %B\ %Y\ @\ %H:%M:%S] by <a href=\"http://www.eggdrop.za.net/\">trivia.tcl</a> for <a href=\"http://www.egghelp.org\">eggdrop</a>.<br>"
 puts $_file "  This page is automatically updated (and refreshed if supported by your browser) every [expr $tghtmlrefresh==1?"second":"$tghtmlrefresh seconds"].</small>"
 puts $_file " </body>"
 puts $_file "</html>"
 close $_file
 file rename -force $tghtmlfile~new $tghtmlfile
 set tghtmlrefreshtimer [utimer $tghtmlrefresh tghtml]
}

putlog "======================================================="
putlog "* trivia.tcl $tgver ($tgrel) by Souperman loaded."
putlog "* Visit http://www.eggdrop.za.net/ for updates."
tgreadqdb
putlog "* $tgVraagstotal Vragen in $tgqdb ([file size $tgqdb] bytes)"
putlog "======================================================="
