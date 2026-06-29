#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class DBGHELP_DATA_REPORT_STRUCT extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pBinPathNonExist {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pSymbolPathNonExist {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
