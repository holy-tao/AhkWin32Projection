#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_KEY_ALGO_TKIP_MIC extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    ucIV48Counter{
        get {
            if(!this.HasProp("__ucIV48CounterProxyArray"))
                this.__ucIV48CounterProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__ucIV48CounterProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ulTKIPKeyLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ulMICKeyLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    ucTKIPMICKeys{
        get {
            if(!this.HasProp("__ucTKIPMICKeysProxyArray"))
                this.__ucTKIPMICKeysProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__ucTKIPMICKeysProxyArray
        }
    }
}
