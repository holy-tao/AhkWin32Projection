#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHEAP_PFA_OFFLINE_DECISION_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEAP_PFA_MEMORY_OFFLINED extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {WHEAP_PFA_OFFLINE_DECISION_TYPE}
     */
    DecisionType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    ImmediateSuccess {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Page {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
