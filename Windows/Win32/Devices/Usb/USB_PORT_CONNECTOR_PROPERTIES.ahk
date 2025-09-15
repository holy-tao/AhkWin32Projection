#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_PORT_PROPERTIES.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_PORT_CONNECTOR_PROPERTIES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ConnectionIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ActualLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {USB_PORT_PROPERTIES}
     */
    UsbPortProperties{
        get {
            if(!this.HasProp("__UsbPortProperties"))
                this.__UsbPortProperties := USB_PORT_PROPERTIES(this.ptr + 8)
            return this.__UsbPortProperties
        }
    }

    /**
     * @type {Integer}
     */
    CompanionIndex {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    CompanionPortNumber {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {String}
     */
    CompanionHubSymbolicLinkName {
        get => StrGet(this.ptr + 20, 0, "UTF-16")
        set => StrPut(value, this.ptr + 20, 0, "UTF-16")
    }
}
