; Open LogMeIn Technician at a specified time on weekdays
#Persistent
SetTimer, OpenLogMeIn, 60000  ; Check every minute
Return

OpenLogMeIn:
IniRead, Hour, schedule.ini, Schedule, Hour, 9  ; Read the hour from the INI file, default to 9 if not found
Hour := Hour + 0  ; Ensure Hour is treated as a number
If ((A_Hour + 0) = Hour && A_WDay >= 2 && A_WDay <= 6)  ; at the specified hour on weekdays (Monday to Friday)
{
    Run, "C:\Program Files (x86)\LogMeIn Rescue Technician Console\LogMeInRescueTechnicianConsole_x64\LMIRTechConsole.exe"  ; Replace with the actual path to the LogMeIn application
    MsgBox, LogMeIn Technician Console has been launched.  ; Show a message box when the application is launched
}

IfWinNotExist, ahk_exe LMIRTechConsole.exe  ; If the application is not running
{
    If (A_Hour >= 9 && A_Hour < 18 && A_WDay >= 2 && A_WDay <= 6)  ; If the current time is between 9 AM and 6 PM on weekdays
    {
        Run, "C:\Program Files (x86)\LogMeIn Rescue Technician Console\LogMeInRescueTechnicianConsole_x64\LMIRTechConsole.exe"  ; Replace with the actual path to the LogMeIn application
        MsgBox, LogMeIn Technician Console has been relaunched.  ; Show a message box when the application is launched
    }
}
Return