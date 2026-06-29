#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\RM_UNIQUE_PROCESS.ahk" { RM_UNIQUE_PROCESS }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\RM_FILTER_ACTION.ahk" { RM_FILTER_ACTION }
#Import ".\RM_FILTER_TRIGGER.ahk" { RM_FILTER_TRIGGER }

/**
 * Contains information about modifications to restart or shutdown actions.
 * @see https://learn.microsoft.com/windows/win32/api/restartmanager/ns-restartmanager-rm_filter_info
 * @namespace Windows.Win32.System.RestartManager
 */
export default struct RM_FILTER_INFO {
    #StructPack 8

    /**
     * This member contains a <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ne-restartmanager-rm_filter_action">RM_FILTER_ACTION</a> enumeration value. Use the value  <b>RmNoRestart</b> 
     * to prevent the restart of the application or service. Use the value  <b>RmNoShutdown</b> to prevent the shutdown and restart of the application or service.
     */
    FilterAction : RM_FILTER_ACTION

    /**
     * This member contains a <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ne-restartmanager-rm_filter_trigger">RM_FILTER_TRIGGER</a> enumeration value. Use the value  <b>RmFilterTriggerFile</b> to modify the restart or shutdown actions  of an application referenced by the executable's full path filename. Use  the value <b>RmFilterTriggerProcess</b> to modify the restart or shutdown actions   of an application referenced by a <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_unique_process">RM_UNIQUE_PROCESS</a> structure. Use  the value <b>RmFilterTriggerService</b> 
     * to modify the restart or shutdown actions of a service referenced by the short service name.
     */
    FilterTrigger : RM_FILTER_TRIGGER

    /**
     * The offset in bytes to the next structure.
     */
    cbNextOffset : UInt32

    strFilename : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'Process', { type: RM_UNIQUE_PROCESS, offset: 16 })
        DefineProp(this.Prototype, 'strServiceShortName', { type: PWSTR, offset: 16 })
        this.DeleteProp("__New")
    }
}
