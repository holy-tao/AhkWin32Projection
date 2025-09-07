#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SYMBOL_INFOW.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class SYMBOL_INFO_PACKAGEW extends Win32Struct
{
    static sizeof => 4096

    static packingSize => 8

    /**
     * @type {SYMBOL_INFOW}
     */
    si{
        get {
            if(!this.HasProp("__si"))
                this.__si := SYMBOL_INFOW(this.ptr + 0)
            return this.__si
        }
    }

    /**
     * @type {String}
     */
    name {
        get => StrGet(this.ptr + 88, 2000, "UTF-16")
        set => StrPut(value, this.ptr + 88, 2000, "UTF-16")
    }
}
