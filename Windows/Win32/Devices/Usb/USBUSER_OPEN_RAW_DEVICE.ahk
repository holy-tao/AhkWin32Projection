#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk
#Include .\USB_OPEN_RAW_DEVICE_PARAMETERS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_OPEN_RAW_DEVICE extends Win32Struct
{
    static sizeof => 20

    static packingSize => 1

    /**
     * @type {USBUSER_REQUEST_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := USBUSER_REQUEST_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {USB_OPEN_RAW_DEVICE_PARAMETERS}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := USB_OPEN_RAW_DEVICE_PARAMETERS(this.ptr + 16)
            return this.__Parameters
        }
    }
}
