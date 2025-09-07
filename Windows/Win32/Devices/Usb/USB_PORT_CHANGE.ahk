#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_20_PORT_CHANGE.ahk
#Include .\USB_30_PORT_CHANGE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_PORT_CHANGE extends Win32Struct
{
    static sizeof => 10

    static packingSize => 1

    /**
     * @type {Integer}
     */
    AsUshort16 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {USB_20_PORT_CHANGE}
     */
    Usb20PortChange{
        get {
            if(!this.HasProp("__Usb20PortChange"))
                this.__Usb20PortChange := USB_20_PORT_CHANGE(this.ptr + 0)
            return this.__Usb20PortChange
        }
    }

    /**
     * @type {USB_30_PORT_CHANGE}
     */
    Usb30PortChange{
        get {
            if(!this.HasProp("__Usb30PortChange"))
                this.__Usb30PortChange := USB_30_PORT_CHANGE(this.ptr + 0)
            return this.__Usb30PortChange
        }
    }
}
