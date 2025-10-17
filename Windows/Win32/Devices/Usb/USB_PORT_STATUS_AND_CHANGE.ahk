#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_20_PORT_STATUS.ahk
#Include .\USB_30_PORT_STATUS.ahk
#Include .\USB_PORT_STATUS.ahk
#Include .\USB_20_PORT_CHANGE.ahk
#Include .\USB_30_PORT_CHANGE.ahk
#Include .\USB_PORT_CHANGE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_PORT_STATUS_AND_CHANGE extends Win32Struct
{
    static sizeof => 36

    static packingSize => 1

    /**
     * @type {Integer}
     */
    AsUlong32 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {USB_PORT_STATUS}
     */
    PortStatus{
        get {
            if(!this.HasProp("__PortStatus"))
                this.__PortStatus := USB_PORT_STATUS(0, this)
            return this.__PortStatus
        }
    }

    /**
     * @type {USB_PORT_CHANGE}
     */
    PortChange{
        get {
            if(!this.HasProp("__PortChange"))
                this.__PortChange := USB_PORT_CHANGE(16, this)
            return this.__PortChange
        }
    }
}
