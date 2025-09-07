#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_LLCP_SERVICE_NAME_ENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbServiceName {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    pbServiceName{
        get {
            if(!this.HasProp("__pbServiceNameProxyArray"))
                this.__pbServiceNameProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__pbServiceNameProxyArray
        }
    }
}
