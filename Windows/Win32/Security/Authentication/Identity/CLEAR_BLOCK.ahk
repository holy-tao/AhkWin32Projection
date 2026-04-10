#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class CLEAR_BLOCK extends Win32Struct {
    static sizeof => 8

    static packingSize => 2

    /**
     * @type {String}
     */
    data {
        get => StrGet(this.ptr + 0, 7, "UTF-8")
        set => StrPut(value, this.ptr + 0, 7, "UTF-8")
    }
}
