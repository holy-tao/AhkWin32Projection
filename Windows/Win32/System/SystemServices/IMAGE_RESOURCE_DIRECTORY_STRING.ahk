#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_RESOURCE_DIRECTORY_STRING extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    NameString{
        get {
            if(!this.HasProp("__NameStringProxyArray"))
                this.__NameStringProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__NameStringProxyArray
        }
    }
}
