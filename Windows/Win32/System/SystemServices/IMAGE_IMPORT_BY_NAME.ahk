#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_IMPORT_BY_NAME extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Hint {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    Name{
        get {
            if(!this.HasProp("__NameProxyArray"))
                this.__NameProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__NameProxyArray
        }
    }
}
