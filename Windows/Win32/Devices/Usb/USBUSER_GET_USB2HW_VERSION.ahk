#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk
#Include .\USB_USB2HW_VERSION_PARAMETERS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_GET_USB2HW_VERSION extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {USBUSER_REQUEST_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := USBUSER_REQUEST_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {USB_USB2HW_VERSION_PARAMETERS}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := USB_USB2HW_VERSION_PARAMETERS(16, this)
            return this.__Parameters
        }
    }
}
