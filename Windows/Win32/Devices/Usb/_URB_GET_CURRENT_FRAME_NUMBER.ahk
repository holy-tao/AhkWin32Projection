#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\_URB_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class _URB_GET_CURRENT_FRAME_NUMBER extends Win32Struct
{
    static sizeof => 32

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
     * @type {Integer}
     */
    FrameNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
