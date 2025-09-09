#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_KEY_ALGO_BIP_GMAC_256 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    ucIPN{
        get {
            if(!this.HasProp("__ucIPNProxyArray"))
                this.__ucIPNProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__ucIPNProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ulBIPGmac256KeyLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    ucBIPGmac256Key{
        get {
            if(!this.HasProp("__ucBIPGmac256KeyProxyArray"))
                this.__ucBIPGmac256KeyProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__ucBIPGmac256KeyProxyArray
        }
    }
}
