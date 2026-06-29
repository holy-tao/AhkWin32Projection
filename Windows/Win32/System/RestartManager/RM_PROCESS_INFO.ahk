#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RM_UNIQUE_PROCESS.ahk" { RM_UNIQUE_PROCESS }
#Import ".\RM_APP_TYPE.ahk" { RM_APP_TYPE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes an application that is to be registered with the Restart Manager.
 * @see https://learn.microsoft.com/windows/win32/api/restartmanager/ns-restartmanager-rm_process_info
 * @namespace Windows.Win32.System.RestartManager
 */
export default struct RM_PROCESS_INFO {
    #StructPack 4

    /**
     * Contains an <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_unique_process">RM_UNIQUE_PROCESS</a> structure that  uniquely identifies the application by its PID and the time the process began.
     */
    Process : RM_UNIQUE_PROCESS

    /**
     * If the process is a service, this parameter returns the long name for the service. If the process is not a service, this parameter returns the  user-friendly name for the application. If the process is a critical process, and the installer is run  with elevated privileges, this parameter returns the name of the executable file of the critical process. If the process is a critical process, and the installer is run as a service, this parameter returns the long name of the critical process.
     */
    strAppName : WCHAR[256]

    /**
     * If the process is a service,  this is the short name for the service. This member is not used if the process is not a service.
     */
    strServiceShortName : WCHAR[64]

    /**
     * Contains an <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ne-restartmanager-rm_app_type">RM_APP_TYPE</a> enumeration value that specifies the type of application as <b>RmUnknownApp</b>,  <b>RmMainWindow</b>, <b>RmOtherWindow</b>, <b>RmService</b>, <b>RmExplorer</b> or <b>RmCritical</b>.
     */
    ApplicationType : RM_APP_TYPE

    /**
     * Contains a bit mask that describes the current status of the application. See the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ne-restartmanager-rm_app_status">RM_APP_STATUS</a> enumeration.
     */
    AppStatus : UInt32

    /**
     * Contains the Terminal Services session ID 
     * 							of the process.  If the terminal session of the process cannot be determined, the value of this member is set to <b>RM_INVALID_SESSION</b> (-1).
     * This member is not used if the process is a service  or a  system critical process.
     */
    TSSessionId : UInt32

    /**
     * <b>TRUE</b> if the application can be restarted by the Restart Manager; otherwise, <b>FALSE</b>.
     * This member is always <b>TRUE</b> if the process is a service. This member is always  <b>FALSE</b> if the process is a critical system process.
     */
    bRestartable : BOOL

}
