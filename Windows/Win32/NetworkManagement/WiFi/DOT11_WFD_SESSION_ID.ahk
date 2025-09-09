#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_SESSION_ID extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SessionID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    SessionAddress{
        get {
            if(!this.HasProp("__SessionAddressProxyArray"))
                this.__SessionAddressProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__SessionAddressProxyArray
        }
    }
}
