#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NET_LUID_LH extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Info {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
