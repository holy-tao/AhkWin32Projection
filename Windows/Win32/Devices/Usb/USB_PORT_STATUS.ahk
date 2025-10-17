#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_20_PORT_STATUS.ahk
#Include .\USB_30_PORT_STATUS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_PORT_STATUS extends Win32Struct
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
     * @type {USB_20_PORT_STATUS}
     */
    Usb20PortStatus{
        get {
            if(!this.HasProp("__Usb20PortStatus"))
                this.__Usb20PortStatus := USB_20_PORT_STATUS(0, this)
            return this.__Usb20PortStatus
        }
    }

    /**
     * @type {USB_30_PORT_STATUS}
     */
    Usb30PortStatus{
        get {
            if(!this.HasProp("__Usb30PortStatus"))
                this.__Usb30PortStatus := USB_30_PORT_STATUS(0, this)
            return this.__Usb30PortStatus
        }
    }
}
