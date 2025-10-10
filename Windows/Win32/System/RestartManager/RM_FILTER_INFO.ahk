#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\RM_UNIQUE_PROCESS.ahk

/**
 * Contains information about modifications to restart or shutdown actions.
 * @see https://docs.microsoft.com/windows/win32/api//restartmanager/ns-restartmanager-rm_filter_info
 * @namespace Windows.Win32.System.RestartManager
 * @version v4.0.30319
 */
class RM_FILTER_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * This member contains a <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ne-restartmanager-rm_filter_action">RM_FILTER_ACTION</a> enumeration value. Use the value  <b>RmNoRestart</b> 
     * to prevent the restart of the application or service. Use the value  <b>RmNoShutdown</b> to prevent the shutdown and restart of the application or service.
     * @type {Integer}
     */
    FilterAction {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * This member contains a <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ne-restartmanager-rm_filter_trigger">RM_FILTER_TRIGGER</a> enumeration value. Use the value  <b>RmFilterTriggerFile</b> to modify the restart or shutdown actions  of an application referenced by the executable's full path filename. Use  the value <b>RmFilterTriggerProcess</b> to modify the restart or shutdown actions   of an application referenced by a <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_unique_process">RM_UNIQUE_PROCESS</a> structure. Use  the value <b>RmFilterTriggerService</b> 
     * to modify the restart or shutdown actions of a service referenced by the short service name.
     * @type {Integer}
     */
    FilterTrigger {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The offset in bytes to the next structure.
     * @type {Integer}
     */
    cbNextOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Char>}
     */
    strFilename {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {RM_UNIQUE_PROCESS}
     */
    Process{
        get {
            if(!this.HasProp("__Process"))
                this.__Process := RM_UNIQUE_PROCESS(this.ptr + 16)
            return this.__Process
        }
    }

    /**
     * @type {Pointer<Char>}
     */
    strServiceShortName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
