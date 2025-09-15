#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk
#Include .\USB_CONTROLLER_INFO_0.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_CONTROLLER_INFO_0 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

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
     * @type {USB_CONTROLLER_INFO_0}
     */
    Info0{
        get {
            if(!this.HasProp("__Info0"))
                this.__Info0 := USB_CONTROLLER_INFO_0(this.ptr + 16)
            return this.__Info0
        }
    }
}
