#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_CHANNEL extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    CountryRegionString{
        get {
            if(!this.HasProp("__CountryRegionStringProxyArray"))
                this.__CountryRegionStringProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__CountryRegionStringProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    OperatingClass {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    ChannelNumber {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
