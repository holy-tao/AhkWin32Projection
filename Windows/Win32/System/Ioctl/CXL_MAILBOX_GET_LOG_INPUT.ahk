#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_GET_LOG_INPUT extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Guid}
     */
    LogIdentifier {
        get {
            if(!this.HasProp("__LogIdentifier"))
                this.__LogIdentifier := Guid(0, this)
            return this.__LogIdentifier
        }
    }

    /**
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
