#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SOURCEFILE structure (dbghelp.h) contains source file information.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-sourcefile
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset ANSI
 */
class SOURCEFILE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The base address of the module.
     * @type {Integer}
     */
    ModBase {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The fully qualified source file name.
     * @type {Pointer<PSTR>}
     */
    FileName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
