#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk
#Include .\USBFN_CLASS_INTERFACE_EX.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\USBFN_PIPE_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBFN_CLASS_INFORMATION_PACKET_EX extends Win32Struct {
    static sizeof => 748

    static packingSize => 4

    /**
     * @type {USBFN_CLASS_INTERFACE_EX}
     */
    FullSpeedClassInterfaceEx {
        get {
            if(!this.HasProp("__FullSpeedClassInterfaceEx"))
                this.__FullSpeedClassInterfaceEx := USBFN_CLASS_INTERFACE_EX(0, this)
            return this.__FullSpeedClassInterfaceEx
        }
    }

    /**
     * @type {USBFN_CLASS_INTERFACE_EX}
     */
    HighSpeedClassInterfaceEx {
        get {
            if(!this.HasProp("__HighSpeedClassInterfaceEx"))
                this.__HighSpeedClassInterfaceEx := USBFN_CLASS_INTERFACE_EX(196, this)
            return this.__HighSpeedClassInterfaceEx
        }
    }

    /**
     * @type {USBFN_CLASS_INTERFACE_EX}
     */
    SuperSpeedClassInterfaceEx {
        get {
            if(!this.HasProp("__SuperSpeedClassInterfaceEx"))
                this.__SuperSpeedClassInterfaceEx := USBFN_CLASS_INTERFACE_EX(392, this)
            return this.__SuperSpeedClassInterfaceEx
        }
    }

    /**
     * @type {String}
     */
    InterfaceName {
        get => StrGet(this.ptr + 588, 39, "UTF-16")
        set => StrPut(value, this.ptr + 588, 39, "UTF-16")
    }

    /**
     * @type {String}
     */
    InterfaceGuid {
        get => StrGet(this.ptr + 668, 38, "UTF-16")
        set => StrPut(value, this.ptr + 668, 38, "UTF-16")
    }

    /**
     * @type {BOOLEAN}
     */
    HasInterfaceGuid {
        get => NumGet(this, 746, "char")
        set => NumPut("char", value, this, 746)
    }
}
