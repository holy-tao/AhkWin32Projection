#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_CLOSE_RAW_DEVICE extends Win32Struct
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
     * @type {Integer}
     */
    Parameters {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
