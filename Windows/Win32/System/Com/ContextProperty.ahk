#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class ContextProperty extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    policyId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {IUnknown}
     */
    pUnk {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
