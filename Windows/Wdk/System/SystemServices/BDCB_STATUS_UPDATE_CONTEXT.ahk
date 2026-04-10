#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BDCB_STATUS_UPDATE_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class BDCB_STATUS_UPDATE_CONTEXT extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BDCB_STATUS_UPDATE_TYPE}
     */
    StatusType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
