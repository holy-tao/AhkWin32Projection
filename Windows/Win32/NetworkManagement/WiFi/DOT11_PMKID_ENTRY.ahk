#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_PMKID_ENTRY extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    BSSID{
        get {
            if(!this.HasProp("__BSSIDProxyArray"))
                this.__BSSIDProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__BSSIDProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    PMKID{
        get {
            if(!this.HasProp("__PMKIDProxyArray"))
                this.__PMKIDProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "char")
            return this.__PMKIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
