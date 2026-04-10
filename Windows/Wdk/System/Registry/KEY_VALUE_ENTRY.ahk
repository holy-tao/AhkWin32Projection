#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.System.Registry
 */
class KEY_VALUE_ENTRY extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<UNICODE_STRING>}
     */
    ValueName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DataOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
