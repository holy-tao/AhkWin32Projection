#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_20_PORT_STATUS.ahk
#Include .\USB_30_PORT_STATUS.ahk
#Include .\USB_PORT_STATUS.ahk
#Include .\USB_20_PORT_CHANGE.ahk
#Include .\USB_30_PORT_CHANGE.ahk
#Include .\USB_PORT_CHANGE.ahk
#Include .\USB_PORT_STATUS_AND_CHANGE.ahk
#Include .\USB_PORT_EXT_STATUS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_PORT_EXT_STATUS_AND_CHANGE extends Win32Struct
{
    static sizeof => 56

    static packingSize => 1

    /**
     * @type {Integer}
     */
    AsUlong64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {USB_PORT_STATUS_AND_CHANGE}
     */
    PortStatusChange{
        get {
            if(!this.HasProp("__PortStatusChange"))
                this.__PortStatusChange := USB_PORT_STATUS_AND_CHANGE(0, this)
            return this.__PortStatusChange
        }
    }

    /**
     * @type {USB_PORT_EXT_STATUS}
     */
    PortExtStatus{
        get {
            if(!this.HasProp("__PortExtStatus"))
                this.__PortExtStatus := USB_PORT_EXT_STATUS(40, this)
            return this.__PortExtStatus
        }
    }
}
