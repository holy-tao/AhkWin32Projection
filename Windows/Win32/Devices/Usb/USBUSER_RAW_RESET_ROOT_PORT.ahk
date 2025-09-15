#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk
#Include .\RAW_RESET_PORT_PARAMETERS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_RAW_RESET_ROOT_PORT extends Win32Struct
{
    static sizeof => 24

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
     * @type {RAW_RESET_PORT_PARAMETERS}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := RAW_RESET_PORT_PARAMETERS(this.ptr + 16)
            return this.__Parameters
        }
    }
}
