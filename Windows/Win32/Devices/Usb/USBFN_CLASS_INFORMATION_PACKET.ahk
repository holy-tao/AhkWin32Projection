#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk
#Include .\USBFN_CLASS_INTERFACE.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\USBFN_PIPE_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBFN_CLASS_INFORMATION_PACKET extends Win32Struct {
    static sizeof => 748

    static packingSize => 4

    /**
     * @type {USBFN_CLASS_INTERFACE}
     */
    FullSpeedClassInterface {
        get {
            if(!this.HasProp("__FullSpeedClassInterface"))
                this.__FullSpeedClassInterface := USBFN_CLASS_INTERFACE(0, this)
            return this.__FullSpeedClassInterface
        }
    }

    /**
     * @type {USBFN_CLASS_INTERFACE}
     */
    HighSpeedClassInterface {
        get {
            if(!this.HasProp("__HighSpeedClassInterface"))
                this.__HighSpeedClassInterface := USBFN_CLASS_INTERFACE(196, this)
            return this.__HighSpeedClassInterface
        }
    }

    /**
     * @type {String}
     */
    InterfaceName {
        get => StrGet(this.ptr + 392, 39, "UTF-16")
        set => StrPut(value, this.ptr + 392, 39, "UTF-16")
    }

    /**
     * @type {String}
     */
    InterfaceGuid {
        get => StrGet(this.ptr + 472, 38, "UTF-16")
        set => StrPut(value, this.ptr + 472, 38, "UTF-16")
    }

    /**
     * @type {BOOLEAN}
     */
    HasInterfaceGuid {
        get => NumGet(this, 550, "char")
        set => NumPut("char", value, this, 550)
    }

    /**
     * @type {USBFN_CLASS_INTERFACE}
     */
    SuperSpeedClassInterface {
        get {
            if(!this.HasProp("__SuperSpeedClassInterface"))
                this.__SuperSpeedClassInterface := USBFN_CLASS_INTERFACE(552, this)
            return this.__SuperSpeedClassInterface
        }
    }
}
