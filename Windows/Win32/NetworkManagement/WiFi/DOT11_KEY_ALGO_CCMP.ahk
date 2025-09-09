#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_KEY_ALGO_CCMP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    ucIV48Counter{
        get {
            if(!this.HasProp("__ucIV48CounterProxyArray"))
                this.__ucIV48CounterProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__ucIV48CounterProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ulCCMPKeyLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    ucCCMPKey{
        get {
            if(!this.HasProp("__ucCCMPKeyProxyArray"))
                this.__ucCCMPKeyProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__ucCCMPKeyProxyArray
        }
    }
}
