#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class BSSID_INFO extends Win32Struct
{
    static sizeof => 22

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    BSSID{
        get {
            if(!this.HasProp("__BSSIDProxyArray"))
                this.__BSSIDProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__BSSIDProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    PMKID{
        get {
            if(!this.HasProp("__PMKIDProxyArray"))
                this.__PMKIDProxyArray := Win32FixedArray(this.ptr + 6, 16, Primitive, "char")
            return this.__PMKIDProxyArray
        }
    }
}
