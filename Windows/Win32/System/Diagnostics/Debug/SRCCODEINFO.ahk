#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The SRCCODEINFO structure (dbghelp.h) contains line information.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-srccodeinfo
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset ANSI
 */
export default struct SRCCODEINFO {
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
    Obj : CHAR[261]

    /**
     * The fully qualified source file name.
     */
    FileName : CHAR[261]

    /**
     * The line number within the source file.
     */
    LineNumber : UInt32

    /**
     * The virtual address of the first instruction of the line.
     */
    Address : Int64

}
