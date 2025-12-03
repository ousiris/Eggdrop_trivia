#####################################################################
# Author:        Graeme Donaldson                                   #
# IRC:           Souperman #eggdrop @ Undernet                      #
# Translated by: Razvan Rosca                                       #
# IRC:           LightAngel #windows @ Undernet                     #
# WWW:           www.helperscript.ro                                #
# Version:       RoTrivia 1.0                                       #
#####################################################################
# About this TCL:                                                   #
# This is the first ROMANIAN trivia for eggdrop. I've also included #
# !!!7000!!! romanian questions/answers.                            #
# It also generates a webpage with trivia statistics.               #
# If you find any bugs please contact me on IRC or from the website.#
#####################################################################
# Installation notes:                                               #
# 1. Copy the questions (intrebari) into a place where your eggdrop #
# user can access them.                                             #
# 2. Configure this script.                                         #
# 3. Load rotrivia.tcl into your eggdrop.conf.                      #
# 4. Rehash.                                                        #
# 5. Enjoy!                                                         #
#####################################################################
# Known bugs:                                                       #
# The generated stats are still in english. I will translate then   #
# as soon as possible!                                              #
#####################################################################
# Commands:                                                         #
# The default channel commands are:                                 #
#                                                                   #
# COMMAND   FLAGS   DESCRIPTION                                     #
# !sugestie -|-     gives another hint to the current question.     #
# !sari     o|o     skips the question and selects a new one.       #
# !start    -|-     starts the game (if it's not running).          #
# !stop     o|o     stops the game (if it's running).               #
# !top10    -|-     shows the top 10 scores on channel.             #
#                                                                   #
# The default /msg commands (and flags required for their use) are: #
#                                                                   #
# COMMAND   FLAGS   DESCRIPTION                                     #
# ajutor     n/a     gives help.                                    #
# eroare     n/a     report errors in questions/answers.            #
# reset      m|m     reset score table.                             #
# reguli     n/a     show the channel's rules (customisable).       #
# scor       n/a     looks up someone's score.                      #
# concurent  n/a     tells you who is ranked one above you.         #
#####################################################################
#
# Please SET THE SCRIPT below!
# WARNING!!!! If you will not set the ENTIRE script your eggdrop will DIE!
# Thank you!
#
#  The full path to the file containing the questions and answers.  
#  The account the bot runs on must have read access to this file.
set tgqdb "/home/reselleri/SpeedNix/useri/LightAngel/eggdrop/addons/trivia/intrebari"

#  The character that seperates the question and the answer in the
#  question/answer file.
set tgqdbsep "*"

#  What you set here defines how the bot expects the question/answer
#  pairs to be arranged.
#  If set to 1, bot expects lines in the format:
#    question<seperator>answer
#  If set to 0, bot expects lines in the format:
#    answer<seperator>question
set tgqdbquestionfirst 1

#  The full path to the file which tracks the scores. The account
#  the bot runs on must have read & write access to this file. If
#  the file does not exist, it will be created when needed.
set tgscf "/home/reselleri/SpeedNix/useri/LightAngel/eggdrop/addons/trivia/scor"

#  How to send error reports. Set to 1 to send error report to an
#  e-mail address of your choice, or 0 to record errors in a file.
#  Sending via e-mail requires that the bot have access to the "mail"
#  program. If the bot doesn't have access to this program (e.g. if
#  you're running the bot on the Windows platform), then set this to
#  0 to have errors recorded in a file.
set tgerrmethod 1

#  The full path to the file which records error reports. The
#  account the bot runs on must have read & write access to this
#  file. If the file does not exist, it will be created when needed.
set tgerrfil "/home/reselleri/SpeedNix/useri/LightAngel/eggdrop/addons/trivia/erori"

#  The e-mail address to send error reports to.
set tgerremail "yourmail@mail.gov"

#  If error reports are sent via e-mail, where will the bot create
#  a temp file? /tmp is usually a good idea.
set tgerrmailtmp "/home/reselleri/SpeedNix/useri/LightAngel/tmp"

#  The full path to the file which the bot will use to generate
#  an HTML info page. The account the bot runs on must have read
#  & write access to this file. If the file does not exist, it will
#  be created when needed.
set tghtmlfile "/home/reselleri/SpeedNix/useri/LightAngel/public_html/trivia"

#  How often (in seconds) does the html file get updated. Set to 0
#  to disable HTML page.
set tghtmlrefresh 0

#  The font to use on the html page.
set tghtmlfont "verdana,helvetica,arial"

#  The name of the channel where the game will be played. The game
#  can only be played on one channel.
set tgchan "#radio21cluj"

#  How many points to give a person for a correctly answered
#  question.
set tgpointsperanswer 1

#  The maximum number of hints to give before the question 'expires'
#  and the bot goes on to another one. This EXCLUDES the first hint
#  given as the question is asked (i.e. the hint which shows no letters,
#  only placeholders).
set tgmaxhint 3

#  Should the bot show the question on each hint (1) or only on the first (0)?
set tgalwaysshowq 1

#  Show questions in all CAPS (1) or not (0)?
set tgcapsquestion 0

#  Show answers in all CAPS (1) or not (0)?
set tgcapsanswer 0

#  Show hints in all CAPS (1) or not (0)?
set tgcapshint 0

#  The minimum number of correct answers in a row by one person which
#  puts them on a winning streak. Setting this to 0 will disable the
#  winning streak feature.
set tgstreakmin 3

#  The number of missed (i.e. unanswered, not skipped) questions to allow
#  before automatically stopping the game. Setting this to 0 will cause the
#  game to run until somebody uses the stop command, or the bot dies, gets
#  killed, pings out, or whatever.
set tgmaxmissed 0

#  The character to use as a placeholder in hints.
set tghintchar "*"

#  The time in seconds between hints.
set tgtimehint 20

#  The time in seconds between a correct answer, 'expired' or skipped question
#  and the next question being asked.
set tgtimenext 10

#  Phrases to use at random when someone answers a question correctly. This must
#  be a TCL list. If you don't know what that means, stick to the defaults.
set tgcongrats [list "Felicitari" "Bine" "Bravo" "Asa da" "Te-ai prins" "Corect" "Arata-le cum se face" "Mama ce creier are"]

#  Phrases to use when the question has 'expired'. Must also be a TCL list.
set tgnobodygotit [list "Nimeni nu a gasit raspunsul." "Hello? E cineva acasa?" "Ar trebui sa va straduiti mai mult!" "Sunt oare prea grele intrebarile?" "Vorbesc cumva singur?" "Nu cred ca se pot castiga puncte in felul asta!"]

#  Phrases to use when the question expired and there's another one coming up.
#  Yep, you guessed it... another TCL list.
set tgtrythenextone [list "Sa vedem daca o stiti si pe asta..." "Pregatiti-va pentru urmatoarea..." "Poate o sa o stiti pe urmatoarea..." "Incercati sa o aflati pe urmatoarea..." "Urmatoarea intrebare..."]

#  Will the bot calculate the time it took to get the correct
#  answer (1) or not (0)? (requires TCL 8.3 or higher).
set tgtimeanswer 1

#  Will the bot show the correct answer if nobody gets it (1) or not (0)?
set tgshowanswer 1

#  When someone answers a question, will the bot show just that person's score (0)
#  or will it show all players' scores (1) (default). This is useful in channels with
#  a large number (>20) players.
set tgshowallscores 0

#  Use bold codes in messages (1) or not (0)?
set tgusebold 0

#  Send private messages using /msg (1) or not (0)?
#  If set to 0, private messages will be sent using /notice
set tgpriv2msg 0

#  Word to use as /msg command to give help.
#  e.g. set tgcmdhelp "helpme" will make the bot give help when someone
#  does "/msg <botnick> ajutor"
set tgcmdhelp "ajutor"

#  Channel command used to start the game.
set tgcmdstart "!start"

#  Flags required to be able to use the start command.
set tgflagsstart "-|-"

#  Channel command used to stop the game.
set tgcmdstop "!stop"

#  Flags required to be able to use the stop command.
set tgflagsstop "o|o"

#  Channel command used to give a hint.
set tgcmdhint "!sugestie"

#  Flags required to be able to use the hint command.
set tgflagshint "-|-"

#  Disable the !sugestie command x seconds after someone uses it. This
#  prevents accidental double hints if two people use the command in
#  quick succession.
set tgtempnohint 10

#  Channel command used to skip the question.
set tgcmdskip "!sari"

#  Flags required to be able to use the skip command.
set tgflagsskip "o|o"

#  Channel command for showing the top 10 scores.
set tgcmdtop10 "!top10"

#  Flags required to use the top 10 command.
set tgflagstop10 "-|-"

#  /msg command used to reset scores.
set tgcmdreset "reset"

#  Flags required to be able to use the reset command.
set tgflagsreset "m|m"

#  Require password for resetting scores?
#  If enabled, you must use /msg bot reset <password> to reset scores.
#  The password is the one set by a user using '/msg bot pass'.
set tgresetreqpw 1

#  /msg command for looking up somebody's score.
set tgcmdlookup "scor"

#  /msg command for looking up your target.
#  (i.e. the person ranked one higher than you).
set tgcmdtarget "concurent"

#  /msg command for reporting errors in questions and/or answers.
set tgcmderror "eroare"

#  /msg command to show channel's rules.
set tgcmdrules "reguli"

#  Channel's rules.
set tgrules "Fara reclama, fara profanari, fara certuri, fara scripturi active sau flood. Incalca aceste reguli si fi gata sa ai ban. Distractie placuta! :-)"

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

set tgcolourstart "03"		;#Game has started.
set tgcolourstop "04"		;#Game has stopped.
set tgcolourskip "10"		;#Question has been skipped.
set tgcolourerr "04"		;#How to report errors.
set tgcolourmiss "10"		;#Nobody answered the question.
set tgcolourqhead "04"		;#Question heading.
set tgcolourqbody "12"		;#Question text
set tgcolourhint "03"		;#Hint.
set tgcolourstrk "12"		;#Person is on a winning streak.
set tgcolourscr1 "04"		;#Score of person in first place.
set tgcolourscr2 "12"		;#Score of person in second place.
set tgcolourscr3 "03"		;#Score of person in third place.
set tgcolourrset "04"		;#Scores have been reset.
set tgcolourstend "12"		;#Winning streak ended.
set tgcolourmisc1 "06"		;#Miscellaneous colour #1.
set tgcolourmisc2 "04"		;#Miscellaneous colour #2.

# DELETE THE FOLOWING LINE! If not, your botwill die!
die "You didn't set trivia.tcl"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                   #
#    Any editing done beyond this point is done at your own risk!   #
#                                                                   #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#Misc checks & var initialisations
set tgver "1.0"
set tgrel "release"
if {[info tclversion]<8.2} {
	putlog "\002[file tail [info script]]\002 failed to load: in order to use this script, eggdrop needs to be compiled to use tcl 8.2 or higher (recommended: latest stable version)."
	return
}
if {$tgtimeanswer==1&&[info tclversion]<8.3} {
	putlog "\002[file tail [info script]]\002 warning: timing of answers has been automatically disabled. this feature requires tcl 8.3 or higher."
	set tgtimeanswer 0
}
if {![info exists alltools_loaded]||$allt_version<205} {
	putlog "\002[file tail [info script]]\002 failed to load: please load alltools.tcl v1.14 or higher (available with eggdrop 1.6.13 or higher) before attempting to load this script."
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
	set ctcp-version "${ctcp-version} (with rotrivia.tcl $tgver ($tgrel) from www.helperscript.ro)"
	set tgplaying 0
}
if {![info exists tghintnum]} {set tghintnum 0}
if {![info exists tgmissed]} {set tgmissed 0}

#Binds
bind pubm $tgflagsstart "$tgchan %$tgcmdstart" tgstart
bind pubm $tgflagsstop "$tgchan %$tgcmdstop" tgstop
proc tgbindhintcmd {} {
	global tgflagshint tgcmdhint
	bind pubm $tgflagshint "$::tgchan %$tgcmdhint" tgforcehint
}
proc tgunbindhintcmd {} {
	global tgflagshint tgcmdhint
	unbind pubm $tgflagshint "$::tgchan %$tgcmdhint" tgforcehint
}
tgbindhintcmd
bind pubm $tgflagsskip "$tgchan %$tgcmdskip" tgskip
bind pubm $tgflagstop10 "$tgchan %$tgcmdtop10" tgshowtop10
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
			tggamemsg "[tgcolstart]Jocul a fost pornit de $nick!"
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
			tggamemsg "[tgcolstop]Jocul a fost oprit de $nick!"
			if {$tgstreakmin>0&&[lindex [split $tgstreak ,] 1]>=$tgstreakmin} { tgstreakend }
			set tgstreak 0
			set tgplaying 0
			catch {unbind pubm -|- "$tgchan *" tgcheckanswer}
			if {[utimerexists tghint]!=""} {killutimer $tghinttimer}
			if {[utimerexists tgnextq]!=""} {killutimer $tgnextqtimer}
			if {[timerexists tgerrremind]!=""} {killtimer $tgerrremindtimer}
			if {[utimerexists tgrebindhinttimer]!=""} {killtimer $tgrebindhinttimer}
		}
	}
}

#gives a hint if there is currently a question to answer.
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

#skips the current question if one has been asked.
proc tgskip {nick host hand chan text} {
	global tghinttimer tgnextqtimer tgplaying tgchan tgcurrentanswer tgstreak
	global tgstreakmin tgtimenext tgrebindhinttimer
	if {[strlwr $tgchan]==[strlwr $chan]} {
		if {$tgplaying==1&&[utimerexists tghint]!=""} {
			tggamemsg "[tgcolskip]Sar peste aceasta intrebare dupa cum m-a rugat [tgcolmisc2]$nick[tgcolskip]."
			if {$tgstreakmin>0&&[lindex [split $tgstreak ,] 1]>=$tgstreakmin&&[strlwr [lindex [split $tgstreak ,] 0]]==[strlwr $nick]} {
				tgstreakend
				set tgstreak 0
			}
			catch {unbind pubm -|- "$tgchan *" tgcheckanswer}
			killutimer $tghinttimer
			if {[utimerexists tgrebindhinttimer]!=""} {killtimer $tgrebindhinttimer}
			set tgnextqtimer [utimer $tgtimenext tgnextq]
		}
	}
}

#reminds channel how to report errors in questions/answers
proc tgerrremind {} {
	global tgerrremindtimer tgerrremindtime botnick tgcmderror
	tggamemsg "[tgcolerr]Pentru a raporta erori, intrebari sau raspunsuri incorecte va rog sa folositi /msg $botnick $tgcmderror <numar> \[descriere\]"
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
		catch {unbind pubm -|- "$tgchan *" tgcheckanswer}
		if {[utimerexists tghint]!=""} {killutimer $tghinttimer}
		if {[utimerexists tgnextq]!=""} {killutimer $tgnextqtimer}
		if {[timerexists tgerrremind]!=""} {killtimer $tgerrremindtimer}
		if {[utimerexists tgrebindhinttimer]!=""} {killtimer $tgrebindhinttimer}
	}
}

#reads the question database.
proc tgreadqdb {} {
	global tgqdb tgquestionstotal tgquestionslist
	set tgquestionstotal 0
	set tgquestionslist ""
	set qfile [open $tgqdb r]
	set tgquestionslist [split [read -nonewline $qfile] "\n"]
	set tgquestionstotal [llength $tgquestionslist]
	close $qfile
}

#selects the next question.
proc tgnextq {} {
	global tgqdb tgcurrentquestion tgcurrentanswer tgquestionnumber
	global tgquestionstotal tghintnum tgchan tgquestionslist tgqdbsep tgqdbquestionfirst
	global tgcapsquestion tgcapsanswer
	tgreadqdb
	set tgcurrentquestion ""
	set tgcurrentanswer ""
	while {$tgcurrentquestion == ""} {
		set tgquestionnumber [rand [llength $tgquestionslist]]			
		set tgquestionselected [lindex $tgquestionslist $tgquestionnumber]
		set tgcurrentquestion [lindex [split $tgquestionselected $tgqdbsep] [expr $tgqdbquestionfirst^1]]
		if {$tgcapsquestion==1} {
			set tgcurrentquestion [strupr $tgcurrentquestion]
		}
		set tgcurrentanswer [string trim [lindex [split $tgquestionselected $tgqdbsep] $tgqdbquestionfirst]]
		if {$tgcapsanswer==1} {
			set tgcurrentanswer [strupr $tgcurrentanswer]
		}
	}
	unset tghintnum
	tghint
	bind pubm -|- "$tgchan *" tgcheckanswer
	return
}

#shows timed hints.
proc tghint {} {
	global tgmaxhint tghintnum tgcurrentanswer tghinttimer tgchan
	global tgtimehint tghintchar tgquestionnumber tgquestionstotal
	global tgcurrentquestion tghintcharsused tgnextqtimer tgtimenext tgstreak tgstreakmin
	global tgnobodygotit tgtrythenextone tgmissed tgmaxmissed tgcmdstart tgshowanswer
	global tgtimestart tgtimeanswer tgalwaysshowq tgmaxhintcurrent tgtempnohint tgcapshint
	if {[catch {incr tghintnum}]!=0} {
		set tghintnum 0
		regsub -all -- "\[^A-Za-z0-9\]" $tgcurrentanswer "" _hintchars
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
			append _msg " Raspunsul corect era [tgcolmisc2]$tgcurrentanswer[tgcolmiss]."
		}
		if {$tgmaxmissed>0&&$tgmissed>=$tgmaxmissed} {
			append _msg " That's $tgmissed questions gone by unanswered! The game is now automatically disabled. To start the game again, type $tgcmdstart"
			tgquietstop
		} else {
			append _msg " [lindex $tgtrythenextone [rand [llength $tgtrythenextone]]]"
		}
		tggamemsg "[tgcolmiss]$_msg"
		if {$tgstreakmin>0&&[lindex [split $tgstreak ,] 1]>=$tgstreakmin} { tgstreakend }
		set tgstreak 0
		catch {unbind pubm -|- "$tgchan *" tgcheckanswer}
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
	tggamemsg "[tgcolqhead]===== Intrebarea [expr $tgquestionnumber+1]/$tgquestionstotal [expr $tghintnum?"(Sugestiea $tghintnum/$tgmaxhintcurrent)":""] ====="
	if {$tgalwaysshowq==1||$tghintnum==0} {
		tggamemsg "[tgcolqbody]$tgcurrentquestion"
	}
	tggamemsg "[tgcolhint]Sugestie: [join $_hint]"
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

#checks if anyone has said the correct answer on channel.
proc tgcheckanswer {nick host hand chan text} {
	global tgcurrentanswer
	if {[strlwr $tgcurrentanswer] == [tgstripcodes [strlwr [string trim $text]]]} {
		tgcorrectanswer $nick
	}
}

#triggered when someone says the correct answer.
proc tgcorrectanswer {nick} {
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
	set _msg "[tgcolmisc1][lindex $tgcongrats [rand [llength $tgcongrats]]] [tgcolmisc2]$nick[tgcolmisc1]! Raspunsul corect este [tgcolmisc2]$tgcurrentanswer[tgcolmisc1].[expr $tgtimeanswer==1?" La-i dat in [tgcolmisc2]$_timetoanswer[tgcolmisc1] secunde.":""]"
	if {$_newrank<$_oldrank} {
		if {$_newrank==1} {
			append _msg " You are now in first place!"
		} else {
			if {$tgshowallscores==0} {
				append _msg " Ai avansat inca un loc!"
			} else {
				append _msg " Esti pe locul [tgcolmisc2]$tgranksbyname([strlwr $nick])[tgcolmisc1] din [tgcolmisc2]$tgscorestotal[tgcolmisc1], in spatele lui [tgcolmisc2]$tgrealnames($tgranksbynum([expr $_newrank-1]))[tgcolmisc1] cu [tgcolmisc2]$tgscoresbyrank([expr $_newrank-1])[tgcolmisc1]."
			}
		}
	}
	tggamemsg "$_msg"
	if {$tgstreak!=0} {
		if {[lindex [split $tgstreak ,] 0]==[strlwr $nick]} {
			set tgstreak [strlwr $nick],[expr [lindex [split $tgstreak ,] 1]+1]
			if {$tgstreakmin>0&&[lindex [split $tgstreak ,] 1]>=$tgstreakmin} {
				tggamemsg "[tgcolstrk][tgcolmisc2]$nick[tgcolstrk] e pus pe fapte mari! [tgcolmisc2][lindex [split $tgstreak ,] 1] [tgcolstrk]raspunsuri corecte consecutive pana acum!"
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
	catch {unbind pubm -|- "$tgchan *" tgcheckanswer}
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
		tggamemsg "[tgcolmisc1]The scores: $_scores"
	} else {
		if {$tgranksbyname([strlwr $nick])==1} {
			set _tgt "."
		} else {
			set _tgt ", in urma lui [tgcolmisc2]$tgrealnames($tgranksbynum([expr $tgranksbyname([strlwr $nick])-1]))[tgcolmisc1] cu [tgcolmisc2]$tgscoresbyrank([expr $tgranksbyname([strlwr $nick])-1])[tgcolmisc1]."
		}
		tggamemsg "[tgcolmisc2]$nick [tgcolmisc1]are acum [tgcolmisc2]$tgscoresbyname([strlwr $nick]) [tgcolmisc1][expr $tgscoresbyname([strlwr $nick])==1?"punct":"puncte"] si este pe locul [tgcolmisc2]$tgranksbyname([strlwr $nick]) [tgcolmisc1]din [tgcolmisc2]$tgscorestotal[tgcolmisc1]$_tgt"
	}
}

#reset current scores.
proc tgresetscores {nick host hand text} {
	global tgscf tgscorestotal tgscores tgplaying tgresetreqpw
	if {($tgresetreqpw==1 && [passwdok $hand $text]) || $tgresetreqpw==0} {
		if {[file exists $tgscf]&&[file size $tgscf]>2} {
			set _sfile [open $tgscf w]
			puts $_sfile ""
			close $_sfile
			set tgscores ""
			set tgscorestotal 0
		}
		tggamemsg "[tgcolrset]===== Score table reset by $nick! ====="
	}
}

#triggered when a winning streak ends.
proc tgstreakend {} {
		global tgstreak tgrealnames
		tggamemsg "[tgcolstend]Cam atat cu [tgcolmisc2]$tgrealnames([lindex [split $tgstreak ,] 0])'s[tgcolstend] si castigul lui..."
		return
}

#triggered when someone joins trivia chan.
proc tgjoinmsg {nick host hand chan} {
	global botnick tgplaying tgcmdhelp tgcmdstart tgflagsstart tgcmdstop tgflagsstop tgchan
	if {$nick != $botnick} {
		set _msg ""
		append _msg "Bine ai venit pe $chan. Trivia este in prezent"
		if {$tgplaying==1} {
			append _msg " \002pornita\002."
		} else {
			append _msg " \002oprita\002."
		}
		if {[matchattr $hand $tgflagsstart $tgchan]&&$tgplaying==0} {
			append _msg " Pentru a porni jocul foloseste comanda \002$tgcmdstart\002."
		}
		append _msg " Foloseste \002/MSG $botnick [strupr $tgcmdhelp]\002 daca ai nevoie de ajutor. Distractie placuta! :-)"
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
			set _who "[tgcolmisc1]Esti"
		} else {
			set _who "[tgcolmisc2]$text [tgcolmisc1]nu este"
		}
		[tgpriv] $nick "[tgbold]$_who [tgcolmisc1]pe lista scorurilor."
	} else {
		if {[strlwr $text]==[strlwr $nick]} {
			set _who "[tgcolmisc1]Ai"
		} else {
			set _who "[tgcolmisc2]$tgrealnames([strlwr $text]) [tgcolmisc1]are"
		}
		[tgpriv] $nick "[tgbold]$_who [tgcolmisc2]$tgscoresbyname([strlwr $text])[tgcolmisc1] puncte fiind pe locul[tgcolmisc2] $tgranksbyname([strlwr $text]) [tgcolmisc1]din [tgcolmisc2]$tgscorestotal[tgcolmisc1]."
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
		[tgpriv] $nick "[tgbold][tgcolmisc1]Esti pe [tgcolmisc2]$tgscoresbyname([strlwr $nick])[tgcolmisc1]. Concurentul tau este [tgcolmisc2]$tgrealnames($tgranksbynum([expr $tgranksbyname([strlwr $nick])-1])) [tgcolmisc1]cu [tgcolmisc2]$tgscoresbyname($tgranksbynum([expr $tgranksbyname([strlwr $nick])-1]))[tgcolmisc1], pe locul [tgcolmisc2][expr $tgranksbyname([strlwr $nick])-1] [tgcolmisc1]din [tgcolmisc2]$tgscorestotal[tgcolmisc1]."
	}
}

#triggered when someone /msgs the bot with the error reporting command.
proc tgerror {nick host hand text} {
	global tgquestionstotal tgquestionslist tgerrmethod tgerrfil tgerremail tgerrmailtmp
	if {$text==""||![string is int [lindex [split $text] 0]]} {
		[tgpriv] $nick "[tgbold][tgcolmisc1]Trebuie sa specific numarul intrebarii."
		return
	}
	tgreadqdb
	set _qnum [lindex [split $text] 0]
	if {$_qnum>$tgquestionstotal} {
		[tgpriv] $nick "[tgbold][tgcolmisc1]No such question."
		return
	}
	set _qques [lindex [split [lindex $tgquestionslist [expr $_qnum-1]] |] 1]
	set _qans [lindex [split [lindex $tgquestionslist [expr $_qnum-1]] |] 0]
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
	puts $_file "Question #:\t$_qnum"
	puts $_file "Question:\t$_qques"
	puts $_file "Answer:\t\t$_qans"
	puts $_file "Comments:\t$_desc"
	puts $_file "------------------------------"
	close $_file
	if {$tgerrmethod==1} {
		exec mail -s "trivia.tcl error report from $nick" $tgerremail < $_fname
		file delete $_fname
		[tgpriv] $nick "[tgbold][tgcolmisc1]Multumesc! Eroarea a fost raportata."
	} else {
		[tgpriv] $nick "[tgbold][tgcolmisc1]Multumesc! Eroarea a fost raportata."
	}
}

#triggered when someone /msgs the bot with the rules command.
proc tgrulesmsg {nick host hand text} {
	global tgrules
	[tgpriv] $nick "Regulile canalului: $tgrules"
}

#triggered when someone /msgs the bot with the help command.
proc tggivehelp {nick host hand {text ""}} {
	global botnick tgcmdlookup tgcmdhelp tgcmdstart tgcmdstop tgchan tgflagsstop
	global tgcmdstop tgflagshint tgcmdhint tgflagsskip tgcmdskip tgflagsreset tgcmdreset
	global tgcmdtarget tgcmderror tgcmdrules tgflagsstart
	if {$text==""} {
		[tgpriv] $nick "Ai access la urmatoarele comenzi prin /MSG:"
		[tgpriv] $nick "Pentru a le folosi introdu /MSG $botnick <comanda>"
		[tgpriv] $nick "  \002[strupr $tgcmdrules]\002"
		[tgpriv] $nick "   -- Afiseaza regulile canalului."
		[tgpriv] $nick "  \002[strupr $tgcmdlookup]\002 \[nick\]"
		[tgpriv] $nick "   -- Afiseaza locul si scorul lui \[nick\], daca il specifici."
		[tgpriv] $nick "    In caz contrar iti va afisa propriul loc si scor."
		[tgpriv] $nick "  \002[strupr $tgcmdtarget]\002"
		[tgpriv] $nick "   -- Afiseaza locul si scorul urmatorului jucator"
		[tgpriv] $nick "    cu scor imediat urmator."
		[tgpriv] $nick "  \002[strupr $tgcmderror]\002 <numar> \[descriere\]"
		[tgpriv] $nick "   -- Raporteaza o greseala la intrebarea <numar>"
		[tgpriv] $nick "    Descrierea e optionala dar este de ajutor."
		if {[matchattr $hand $tgflagsreset $tgchan]} {
			[tgpriv] $nick "  \002[strupr $tgcmdreset]\002"
			[tgpriv] $nick "   -- Reseteaza scorul."
		}
		[tgpriv] $nick "Pentru o lista de comenzi pe canal foloseste /MSG $botnick [strupr $tgcmdhelp] PUBCMDS"
	}
	if {[strlwr $text]=="pubcmds"} {
		[tgpriv] $nick "Ai acces la urmatoarele comenzi pe canal:"
		if {[matchattr $hand $tgflagsstart $tgchan]} {
			[tgpriv] $nick "  \002$tgcmdstart\002 -- porneste trivia."
		}
		if {[matchattr $hand $tgflagsstop $tgchan]} {
			[tgpriv] $nick "  \002$tgcmdstop\002 -- opreste trivia."
		}
		if {[matchattr $hand $tgflagshint $tgchan]} {
			[tgpriv] $nick "  \002$tgcmdhint\002 -- afiseaza o sugestie."
		}
		if {[matchattr $hand $tgflagsskip $tgchan]} {
			[tgpriv] $nick "  \002$tgcmdskip\002 -- sare peste intrebarea curenta."
		}
		[tgpriv] $nick "Pentru o lista a comenzilor prin /MSG foloseste /MSG $botnick [strupr $tgcmdhelp]"
	}
}

# Returns text without colour, bold, etc. control codes.
# This is a stripped down version of the proc in MC_8's mc.moretools.tcl.
proc tgstripcodes {text} {
	regsub -all -- "\003(\[0-9\]\[0-9\]?(,\[0-9\]\[0-9\]?)?)?" $text "" text
	set text "[string map -nocase [list \002 "" \017 "" \026 "" \037 ""] $text]"
	return $text
}

proc tggamemsg {what} {
	global tgchan
	putquick "PRIVMSG $tgchan :[tgbold]$what"
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
	global tgquestionstotal tghtmlrefreshtimer tghtmlfont
	tggetscores
	tgreadqdb
	set _file [open $tghtmlfile~new w]
	puts $_file "<!DOCTYPE HTML PUBLIC \"-/W3C/DTD HTML 4.01 Transitional/EN\">"
	puts $_file "<html>"
	puts $_file " <head>"
	puts $_file "  <title>$botnick's trivia channel: $tgchan on [lindex [split $server :] 0]</title>"
	puts $_file "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"
	puts $_file "  <meta http-equiv=\"refresh\" content=\"$tghtmlrefresh\">"
	puts $_file "  <meta name=\"generator\" content=\"trivia.tcl script for eggdrop. /\">"
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
		puts $_file "  <p>Trivia game is currently <b>[expr $tgplaying==1?"on":"off"]</b>. There are <b>$tgquestionstotal</b> questions in the database."
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
		puts $_file "  <p><small>Exista [expr $tgscorestotal==1?"":""] <b>$tgscorestotal</b> [expr $tgscorestotal==1?"nick":"nickuri"] in tabela de scor:<br>"
		set _rank 1
		while {$_rank<=$tgscorestotal} {
			puts $_file "  <b>$_rank</b>. $tgrealnames($tgranksbynum($_rank)) $tgscoresbyrank($_rank)<br>"
			incr _rank
		}
	} else {
		puts $_file "  <p><small>Nu exista nici un nick in tabela de scor.<br>"
	}
	puts $_file "  </small></p>"
	puts $_file "  <hr size=\"1\" noshade>"
	puts $_file "  <small>Generated on [strftime %A,\ %d\ %B\ %Y\ @\ %H:%M:%S] by <a href=\"http://www.eggdrop.za.net/\">trivia.tcl</a> for <a href=\"http://www.eggheads.org\">eggdrop</a>.<br>"
	puts $_file "  This page is automatically updated (and refreshed if supported by your browser) every [expr $tghtmlrefresh==1?"second":"$tghtmlrefresh seconds"].</small>"
	puts $_file " </body>"
	puts $_file "</html>"
	close $_file
	file rename -force $tghtmlfile~new $tghtmlfile
	set tghtmlrefreshtimer [utimer $tghtmlrefresh tghtml]
}

putlog "================================================================="
putlog "* RoTrivia $tgver ($tgrel) by LightAngel & Souperman loaded."
putlog "* Visit http://www.helperscript.ro/ for updates."
tgreadqdb
putlog "* $tgquestionstotal questions in $tgqdb ([file size $tgqdb] bytes)"
putlog "=================================================================="
