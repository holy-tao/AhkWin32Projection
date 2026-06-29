#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The SOURCEFILEW (Unicode) structure (dbghelp.h) contains source file information.
 * @remarks
 * > [!NOTE]
 * > The dbghelp.h header defines SOURCEFILE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-sourcefilew
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct SOURCEFILEW {
    #StructPack 8

    /**
     * The base address of the module.
     */
    ModBase : Int64

    /**
     * The fully qualified source file name.
     */
    FileName : PWSTR

}
