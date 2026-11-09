#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_DEVICE_CAPABILITY_HEADER_REGISTER_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_DEVICE_CAPABILITY_HEADER_REGISTER extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {CXL_DEVICE_CAPABILITY_HEADER_REGISTER_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := CXL_DEVICE_CAPABILITY_HEADER_REGISTER_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
