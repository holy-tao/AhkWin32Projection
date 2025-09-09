#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_OI extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * @type {Integer}
     */
    OILength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    OI{
        get {
            if(!this.HasProp("__OIProxyArray"))
                this.__OIProxyArray := Win32FixedArray(this.ptr + 2, 5, Primitive, "char")
            return this.__OIProxyArray
        }
    }
}
