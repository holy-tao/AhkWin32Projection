#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\RM_UNIQUE_PROCESS.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Describes an application that is to be registered with the Restart Manager.
 * @see https://docs.microsoft.com/windows/win32/api//restartmanager/ns-restartmanager-rm_process_info
 * @namespace Windows.Win32.System.RestartManager
 * @version v4.0.30319
 */
class RM_PROCESS_INFO extends Win32Struct
{
    static sizeof => 672

    static packingSize => 8

    /**
     * Contains an <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_unique_process">RM_UNIQUE_PROCESS</a> structure that  uniquely identifies the application by its PID and the time the process began.
     * @type {RM_UNIQUE_PROCESS}
     */
    Process{
        get {
            if(!this.HasProp("__Process"))
                this.__Process := RM_UNIQUE_PROCESS(this.ptr + 0)
            return this.__Process
        }
    }

    /**
     * If the process is a service, this parameter returns the long name for the service. If the process is not a service, this parameter returns the  user-friendly name for the application. If the process is a critical process, and the installer is run  with elevated privileges, this parameter returns the name of the executable file of the critical process. If the process is a critical process, and the installer is run as a service, this parameter returns the long name of the critical process.
     * @type {String}
     */
    strAppName {
        get => StrGet(this.ptr + 16, 255, "UTF-16")
        set => StrPut(value, this.ptr + 16, 255, "UTF-16")
    }

    /**
     * If the process is a service,  this is the short name for the service. This member is not used if the process is not a service.
     * @type {String}
     */
    strServiceShortName {
        get => StrGet(this.ptr + 528, 63, "UTF-16")
        set => StrPut(value, this.ptr + 528, 63, "UTF-16")
    }

    /**
     * Contains an <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ne-restartmanager-rm_app_type">RM_APP_TYPE</a> enumeration value that specifies the type of application as <b>RmUnknownApp</b>,  <b>RmMainWindow</b>, <b>RmOtherWindow</b>, <b>RmService</b>, <b>RmExplorer</b> or <b>RmCritical</b>.
     * @type {Integer}
     */
    ApplicationType {
        get => NumGet(this, 656, "int")
        set => NumPut("int", value, this, 656)
    }

    /**
     * Contains a bit mask that describes the current status of the application. See the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ne-restartmanager-rm_app_status">RM_APP_STATUS</a> enumeration.
     * @type {Integer}
     */
    AppStatus {
        get => NumGet(this, 660, "uint")
        set => NumPut("uint", value, this, 660)
    }

    /**
     * Contains the Terminal Services session ID 
     * 							of the process.  If the terminal session of the process cannot be determined, the value of this member is set to <b>RM_INVALID_SESSION</b> (-1).
     * This member is not used if the process is a service  or a  system critical process.
     * @type {Integer}
     */
    TSSessionId {
        get => NumGet(this, 664, "uint")
        set => NumPut("uint", value, this, 664)
    }

    /**
     * <b>TRUE</b> if the application can be restarted by the Restart Manager; otherwise, <b>FALSE</b>.
     * This member is always <b>TRUE</b> if the process is a service. This member is always  <b>FALSE</b> if the process is a critical system process.
     * @type {BOOL}
     */
    bRestartable{
        get {
            if(!this.HasProp("__bRestartable"))
                this.__bRestartable := BOOL(this.ptr + 668)
            return this.__bRestartable
        }
    }
}
