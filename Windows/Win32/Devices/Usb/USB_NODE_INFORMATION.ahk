#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_HUB_DESCRIPTOR.ahk
#Include .\USB_HUB_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_NODE_INFORMATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

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
                this.__HubInformation := USB_HUB_INFORMATION(this.ptr + 4)
            return this.__HubInformation
        }
    }

    /**
     * @type {Integer}
     */
    MiParentInformation {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
