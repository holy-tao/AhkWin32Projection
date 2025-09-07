#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\IMAGEHLP_SYMBOLW64.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_SYMBOLW64_PACKAGE extends Win32Struct
{
    static sizeof => 4040

    static packingSize => 8

    /**
     * @type {IMAGEHLP_SYMBOLW64}
     */
    sym{
        get {
            if(!this.HasProp("__sym"))
                this.__sym := IMAGEHLP_SYMBOLW64(this.ptr + 0)
            return this.__sym
        }
    }

    /**
     * @type {String}
     */
    name {
        get => StrGet(this.ptr + 32, 2000, "UTF-16")
        set => StrPut(value, this.ptr + 32, 2000, "UTF-16")
    }
}
