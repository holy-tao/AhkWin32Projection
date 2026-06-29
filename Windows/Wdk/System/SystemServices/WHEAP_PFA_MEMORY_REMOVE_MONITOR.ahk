#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_PFA_REMOVE_TRIGGER.ahk" { WHEA_PFA_REMOVE_TRIGGER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_PFA_MEMORY_REMOVE_MONITOR {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    RemoveTrigger : WHEA_PFA_REMOVE_TRIGGER

    TimeInList : UInt32

    ErrorCount : UInt32

    Page : UInt32

}
