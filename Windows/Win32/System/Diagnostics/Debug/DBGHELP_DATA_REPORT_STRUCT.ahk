#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DBGHELP_DATA_REPORT_STRUCT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pBinPathNonExist{
        get {
            if(!this.HasProp("__pBinPathNonExist"))
                this.__pBinPathNonExist := PWSTR(this.ptr + 0)
            return this.__pBinPathNonExist
        }
    }

    /**
     * @type {PWSTR}
     */
    pSymbolPathNonExist{
        get {
            if(!this.HasProp("__pSymbolPathNonExist"))
                this.__pSymbolPathNonExist := PWSTR(this.ptr + 8)
            return this.__pSymbolPathNonExist
        }
    }
}
