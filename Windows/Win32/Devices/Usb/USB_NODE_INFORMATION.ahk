#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_HUB_DESCRIPTOR.ahk
#Include .\USB_HUB_INFORMATION.ahk
#Include .\USB_MI_PARENT_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_NODE_INFORMATION extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NodeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {USB_HUB_INFORMATION}
     */
    HubInformation{
        get {
            if(!this.HasProp("__HubInformation"))
                this.__HubInformation := USB_HUB_INFORMATION(8, this)
            return this.__HubInformation
        }
    }

    /**
     * @type {USB_MI_PARENT_INFORMATION}
     */
    MiParentInformation{
        get {
            if(!this.HasProp("__MiParentInformation"))
                this.__MiParentInformation := USB_MI_PARENT_INFORMATION(8, this)
            return this.__MiParentInformation
        }
    }
}
