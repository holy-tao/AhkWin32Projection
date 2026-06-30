#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RAW_ROOTPORT_FEATURE.ahk
#Include .\USB_USER_ERROR_CODE.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBUSER_ROOTPORT_FEATURE_REQUEST extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {USBUSER_REQUEST_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := USBUSER_REQUEST_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {RAW_ROOTPORT_FEATURE}
     */
    Parameters {
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := RAW_ROOTPORT_FEATURE(16, this)
            return this.__Parameters
        }
    }
}
