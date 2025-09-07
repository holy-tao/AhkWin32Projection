#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_ADVERTISED_SERVICE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 264

    static packingSize => 4

    /**
     * @type {Integer}
     */
    AdvertisementID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ConfigMethods {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ServiceNameLength {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Array<Byte>}
     */
    ServiceName{
        get {
            if(!this.HasProp("__ServiceNameProxyArray"))
                this.__ServiceNameProxyArray := Win32FixedArray(this.ptr + 7, 1, Primitive, "char")
            return this.__ServiceNameProxyArray
        }
    }
}
