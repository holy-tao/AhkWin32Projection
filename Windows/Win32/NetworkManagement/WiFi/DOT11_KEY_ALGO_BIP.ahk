#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_KEY_ALGO_BIP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    ucIPN{
        get {
            if(!this.HasProp("__ucIPNProxyArray"))
                this.__ucIPNProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__ucIPNProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ulBIPKeyLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    ucBIPKey{
        get {
            if(!this.HasProp("__ucBIPKeyProxyArray"))
                this.__ucBIPKeyProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__ucBIPKeyProxyArray
        }
    }
}
