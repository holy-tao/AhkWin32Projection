#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_RATE_SET extends Win32Struct
{
    static sizeof => 132

    static packingSize => 4

    /**
     * @type {Integer}
     */
    uRateSetLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    ucRateSet{
        get {
            if(!this.HasProp("__ucRateSetProxyArray"))
                this.__ucRateSetProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__ucRateSetProxyArray
        }
    }
}
