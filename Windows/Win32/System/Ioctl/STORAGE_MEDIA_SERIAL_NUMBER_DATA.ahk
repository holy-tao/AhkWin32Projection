#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_MEDIA_SERIAL_NUMBER_DATA extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SerialNumberLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumberProxyArray"))
                this.__SerialNumberProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__SerialNumberProxyArray
        }
    }
}
