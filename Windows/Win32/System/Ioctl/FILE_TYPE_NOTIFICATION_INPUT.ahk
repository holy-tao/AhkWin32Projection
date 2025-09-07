#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_TYPE_NOTIFICATION_INPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumFileTypeIDs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Guid>}
     */
    FileTypeID{
        get {
            if(!this.HasProp("__FileTypeIDProxyArray"))
                this.__FileTypeIDProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "ptr")
            return this.__FileTypeIDProxyArray
        }
    }
}
