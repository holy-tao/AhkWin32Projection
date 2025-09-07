#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\_URB_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class _URB_PIPE_REQUEST extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {_URB_HEADER}
     */
    Hdr{
        get {
            if(!this.HasProp("__Hdr"))
                this.__Hdr := _URB_HEADER(this.ptr + 0)
            return this.__Hdr
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    PipeHandle {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
