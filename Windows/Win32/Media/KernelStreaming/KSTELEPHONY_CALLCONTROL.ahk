#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TELEPHONY_CALLCONTROLOP.ahk
#Include .\TELEPHONY_CALLTYPE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSTELEPHONY_CALLCONTROL extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {TELEPHONY_CALLTYPE}
     */
    CallType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {TELEPHONY_CALLCONTROLOP}
     */
    CallControlOp {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
