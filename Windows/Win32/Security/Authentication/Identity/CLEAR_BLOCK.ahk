#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class CLEAR_BLOCK extends Win32Struct
{
    static sizeof => 16

    static packingSize => 2

    /**
     * @type {String}
     */
    data {
        get => StrGet(this.ptr + 0, 7, "UTF-16")
        set => StrPut(value, this.ptr + 0, 7, "UTF-16")
    }
}
