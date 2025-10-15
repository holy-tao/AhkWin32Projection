#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_ENDPOINT_DESCRIPTOR.ahk
#Include .\USBFN_PIPE_INFORMATION.ahk
#Include .\USBFN_CLASS_INTERFACE_EX.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_CLASS_INFORMATION_PACKET_EX extends Win32Struct
{
    static sizeof => 568

    static packingSize => 8

    /**
     * @type {USBFN_CLASS_INTERFACE_EX}
     */
    FullSpeedClassInterfaceEx{
        get {
            if(!this.HasProp("__FullSpeedClassInterfaceEx"))
                this.__FullSpeedClassInterfaceEx := USBFN_CLASS_INTERFACE_EX(this.ptr + 0)
            return this.__FullSpeedClassInterfaceEx
        }
    }

    /**
     * @type {USBFN_CLASS_INTERFACE_EX}
     */
    HighSpeedClassInterfaceEx{
        get {
            if(!this.HasProp("__HighSpeedClassInterfaceEx"))
                this.__HighSpeedClassInterfaceEx := USBFN_CLASS_INTERFACE_EX(this.ptr + 136)
            return this.__HighSpeedClassInterfaceEx
        }
    }

    /**
     * @type {USBFN_CLASS_INTERFACE_EX}
     */
    SuperSpeedClassInterfaceEx{
        get {
            if(!this.HasProp("__SuperSpeedClassInterfaceEx"))
                this.__SuperSpeedClassInterfaceEx := USBFN_CLASS_INTERFACE_EX(this.ptr + 272)
            return this.__SuperSpeedClassInterfaceEx
        }
    }

    /**
     * @type {String}
     */
    InterfaceName {
        get => StrGet(this.ptr + 408, 39, "UTF-16")
        set => StrPut(value, this.ptr + 408, 39, "UTF-16")
    }

    /**
     * @type {String}
     */
    InterfaceGuid {
        get => StrGet(this.ptr + 488, 38, "UTF-16")
        set => StrPut(value, this.ptr + 488, 38, "UTF-16")
    }

    /**
     * @type {BOOLEAN}
     */
    HasInterfaceGuid{
        get {
            if(!this.HasProp("__HasInterfaceGuid"))
                this.__HasInterfaceGuid := BOOLEAN(this.ptr + 566)
            return this.__HasInterfaceGuid
        }
    }
}
