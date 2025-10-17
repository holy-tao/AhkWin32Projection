#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_PIPE_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {USB_ENDPOINT_DESCRIPTOR}
     */
    EpDesc{
        get {
            if(!this.HasProp("__EpDesc"))
                this.__EpDesc := USB_ENDPOINT_DESCRIPTOR(0, this)
            return this.__EpDesc
        }
    }

    /**
     * @type {Integer}
     */
    PipeId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
