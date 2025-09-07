#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class PUBLIC_OBJECT_TYPE_INFORMATION extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {UNICODE_STRING}
     */
    TypeName{
        get {
            if(!this.HasProp("__TypeName"))
                this.__TypeName := UNICODE_STRING(this.ptr + 0)
            return this.__TypeName
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 16, 4, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
