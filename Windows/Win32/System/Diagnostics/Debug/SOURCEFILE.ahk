#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The SOURCEFILE structure (dbghelp.h) contains source file information.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-sourcefile
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset ANSI
 */
export default struct SOURCEFILE {
    #StructPack 8

    /**
     * The base address of the module.
     */
    ModBase : Int64

    /**
     * The fully qualified source file name.
     */
    FileName : PSTR

}
