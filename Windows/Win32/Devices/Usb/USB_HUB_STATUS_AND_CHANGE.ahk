#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_HUB_STATUS.ahk
#Include .\USB_HUB_CHANGE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_HUB_STATUS_AND_CHANGE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * @type {Integer}
     */
    AsUlong32 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {USB_HUB_STATUS}
     */
    HubStatus{
        get {
            if(!this.HasProp("__HubStatus"))
                this.__HubStatus := USB_HUB_STATUS(0, this)
            return this.__HubStatus
        }
    }

    /**
     * @type {USB_HUB_CHANGE}
     */
    HubChange{
        get {
            if(!this.HasProp("__HubChange"))
                this.__HubChange := USB_HUB_CHANGE(4, this)
            return this.__HubChange
        }
    }
}
