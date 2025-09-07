#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class GET_FILTER_FILE_IDENTIFIER_OUTPUT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    FilterFileIdentifierLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    FilterFileIdentifier{
        get {
            if(!this.HasProp("__FilterFileIdentifierProxyArray"))
                this.__FilterFileIdentifierProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__FilterFileIdentifierProxyArray
        }
    }
}
