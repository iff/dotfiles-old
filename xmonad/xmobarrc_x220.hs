Config { font = "xft:Bitstream Vera Sans Mono:size=8:antialias=true:hinting=true:lcdfilter:lcddefault"
       , bgColor = "black"
       , fgColor = "grey"
       , position = Top
       , lowerOnStart = True
       , commands = [ Run Network "eth0" ["-L","0","-H","32","--normal","green","--high","red"] 10
                    , Run Network "wlan0" ["-L","0","-H","32","--normal","green","--high","red"] 10
                    , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                    , Run MultiCpu ["-t","Cpu: <total0><total1><total2><total3>","-L","3","-H","50","--normal","green","--high","red","-w","5"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run BatteryP ["BAT0"]
                      ["-t", "<acstatus><watts> | <left>% (<timeleft>)",
                       "-L", "10", "-H", "80", "-p", "3",
                       "--", "-O", "<fc=green>On</fc> - ", "-o", "",
                       "-L", "-15", "-H", "-5",
                       "-l", "red", "-m", "blue", "-h", "green",
                       "-c", "energy_full"] 600
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%multicpu% | %memory% | %eth0% - %wlan0% }{ %battery% | <fc=#ee9a00>%date%</fc>"
