#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The SRCCODEINFOW (Unicode) structure (dbghelp.h) contains line information.
 * @remarks
 * > [!NOTE]
 * > The dbghelp.h header defines SRCCODEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-srccodeinfow
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct SRCCODEINFOW {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    SizeOfStruct : UInt32

    /**
     * This member is not used.
     */
    Key : IntPtr

    /**
     * The base address of the module that contains the line.
     */
    ModBase : Int64

    /**
     * The name of the object file within the module that contains the line.
     */
    Obj : WCHAR[261]

    /**
     * The fully qualified source file name.
     */
    FileName : WCHAR[261]

    /**
     * The line number within the source file.
     */
    LineNumber : UInt32

    /**
     * The virtual address of the first instruction of the line.
     */
    Address : Int64

}
