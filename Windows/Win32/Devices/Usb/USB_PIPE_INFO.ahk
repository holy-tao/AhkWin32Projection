#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_PIPE_INFO extends Win32Struct
{
    static sizeof => 11

    static packingSize => 1

    /**
     * @type {USB_ENDPOINT_DESCRIPTOR}
     */
    EndpointDescriptor{
        get {
            if(!this.HasProp("__EndpointDescriptor"))
                this.__EndpointDescriptor := USB_ENDPOINT_DESCRIPTOR(this.ptr + 0)
            return this.__EndpointDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    ScheduleOffset {
        get => NumGet(this, 7, "uint")
        set => NumPut("uint", value, this, 7)
    }
}
