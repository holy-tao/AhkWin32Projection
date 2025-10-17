#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\_URB_HEADER.ahk
#Include .\USBD_PIPE_INFORMATION.ahk
#Include .\USBD_INTERFACE_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class _URB_SELECT_INTERFACE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {_URB_HEADER}
     */
    Hdr{
        get {
            if(!this.HasProp("__Hdr"))
                this.__Hdr := _URB_HEADER(0, this)
            return this.__Hdr
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    ConfigurationHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {USBD_INTERFACE_INFORMATION}
     */
    Interface{
        get {
            if(!this.HasProp("__Interface"))
                this.__Interface := USBD_INTERFACE_INFORMATION(32, this)
            return this.__Interface
        }
    }
}
