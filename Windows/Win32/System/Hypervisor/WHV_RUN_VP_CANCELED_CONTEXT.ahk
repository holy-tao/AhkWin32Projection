#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_RUN_VP_CANCEL_REASON.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class WHV_RUN_VP_CANCELED_CONTEXT extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {WHV_RUN_VP_CANCEL_REASON}
     */
    CancelReason {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
