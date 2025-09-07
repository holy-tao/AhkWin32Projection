#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BM_REQUEST_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DEFAULT_PIPE_SETUP_PACKET extends Win32Struct
{
    static sizeof => 13

    static packingSize => 1

    /**
     * @type {BM_REQUEST_TYPE}
     */
    bmRequestType{
        get {
            if(!this.HasProp("__bmRequestType"))
                this.__bmRequestType := BM_REQUEST_TYPE(this.ptr + 0)
            return this.__bmRequestType
        }
    }

    /**
     * @type {Integer}
     */
    bRequest {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    LowByte {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    HiByte {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    W {
        get => NumGet(this, 3, "ushort")
        set => NumPut("ushort", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    wLength {
        get => NumGet(this, 11, "ushort")
        set => NumPut("ushort", value, this, 11)
    }
}
