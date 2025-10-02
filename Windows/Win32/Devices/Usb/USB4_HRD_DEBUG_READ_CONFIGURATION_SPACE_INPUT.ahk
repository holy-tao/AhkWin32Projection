#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB4_HRD_DEBUG_ROUTE_STRING.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB4_HRD_DEBUG_READ_CONFIGURATION_SPACE_INPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {USB4_HRD_DEBUG_ROUTE_STRING}
     */
    Route{
        get {
            if(!this.HasProp("__Route"))
                this.__Route := USB4_HRD_DEBUG_ROUTE_STRING(this.ptr + 0)
            return this.__Route
        }
    }

    /**
     * @type {Integer}
     */
    AdapterNumber {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ConfigurationSpaceType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    DwOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    DwLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
