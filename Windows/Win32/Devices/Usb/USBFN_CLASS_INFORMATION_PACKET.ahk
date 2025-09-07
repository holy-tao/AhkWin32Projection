#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk
#Include .\USBFN_PIPE_INFORMATION.ahk
#Include .\USBFN_CLASS_INTERFACE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_CLASS_INFORMATION_PACKET extends Win32Struct
{
    static sizeof => 568

    static packingSize => 8

    /**
     * @type {USBFN_CLASS_INTERFACE}
     */
    FullSpeedClassInterface{
        get {
            if(!this.HasProp("__FullSpeedClassInterface"))
                this.__FullSpeedClassInterface := USBFN_CLASS_INTERFACE(this.ptr + 0)
            return this.__FullSpeedClassInterface
        }
    }

    /**
     * @type {USBFN_CLASS_INTERFACE}
     */
    HighSpeedClassInterface{
        get {
            if(!this.HasProp("__HighSpeedClassInterface"))
                this.__HighSpeedClassInterface := USBFN_CLASS_INTERFACE(this.ptr + 136)
            return this.__HighSpeedClassInterface
        }
    }

    /**
     * @type {String}
     */
    InterfaceName {
        get => StrGet(this.ptr + 272, 39, "UTF-16")
        set => StrPut(value, this.ptr + 272, 39, "UTF-16")
    }

    /**
     * @type {String}
     */
    InterfaceGuid {
        get => StrGet(this.ptr + 352, 38, "UTF-16")
        set => StrPut(value, this.ptr + 352, 38, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    HasInterfaceGuid {
        get => NumGet(this, 430, "char")
        set => NumPut("char", value, this, 430)
    }

    /**
     * @type {USBFN_CLASS_INTERFACE}
     */
    SuperSpeedClassInterface{
        get {
            if(!this.HasProp("__SuperSpeedClassInterface"))
                this.__SuperSpeedClassInterface := USBFN_CLASS_INTERFACE(this.ptr + 432)
            return this.__SuperSpeedClassInterface
        }
    }
}
