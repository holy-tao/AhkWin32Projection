#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SYMBOL_INFO.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset ANSI
 */
class SYMBOL_INFO_PACKAGE extends Win32Struct
{
    static sizeof => 2096

    static packingSize => 8

    /**
     * @type {SYMBOL_INFO}
     */
    si{
        get {
            if(!this.HasProp("__si"))
                this.__si := SYMBOL_INFO(this.ptr + 0)
            return this.__si
        }
    }

    /**
     * @type {String}
     */
    name {
        get => StrGet(this.ptr + 88, 2000, "UTF-8")
        set => StrPut(value, this.ptr + 88, 2000, "UTF-8")
    }
}
