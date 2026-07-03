#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEAP_PFA_OFFLINE_DECISION_TYPE.ahk" { WHEAP_PFA_OFFLINE_DECISION_TYPE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_PFA_MEMORY_OFFLINED {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    DecisionType : WHEAP_PFA_OFFLINE_DECISION_TYPE

    ImmediateSuccess : BOOLEAN

    Page : UInt32

}
