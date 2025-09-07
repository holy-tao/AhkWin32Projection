#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains duplicate symbol information. (IMAGEHLP_DUPLICATE_SYMBOL64)
 * @remarks
 * This structure supersedes the <b>IMAGEHLP_DUPLICATE_SYMBOL</b> structure. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_DUPLICATE_SYMBOL</b> is defined as follows in DbgHelp.h. 
  * 
  * 
  * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_duplicate_symbol64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_DUPLICATE_SYMBOL64 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(IMAGEHLP_DUPLICATE_SYMBOL64)</c>.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of duplicate symbols.
     * @type {Integer}
     */
    NumberOfDups {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to an array of symbols (
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structures). The number of entries in the array is specified by the <b>NumberOfDups</b> member.
     * @type {Pointer<IMAGEHLP_SYMBOL64>}
     */
    Symbol {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The index into the symbol array for the selected symbol.
     * @type {Integer}
     */
    SelectedSymbol {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
