#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DEVICE_OBJECT.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class ARBITER_CONFLICT_INFO extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<DEVICE_OBJECT>}
     */
    OwningObject {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Start {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    End {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
