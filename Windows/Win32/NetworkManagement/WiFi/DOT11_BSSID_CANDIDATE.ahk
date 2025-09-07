#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_BSSID_CANDIDATE extends Win32Struct
{
    static sizeof => 12

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
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
