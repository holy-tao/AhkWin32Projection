#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class CLEAR_BLOCK extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * @type {Array<SByte>}
     */
    data{
        get {
            if(!this.HasProp("__dataProxyArray"))
                this.__dataProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__dataProxyArray
        }
    }
}
