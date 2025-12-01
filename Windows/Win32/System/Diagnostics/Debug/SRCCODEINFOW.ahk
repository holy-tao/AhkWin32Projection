#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SRCCODEINFOW (Unicode) structure (dbghelp.h) contains line information.
 * @remarks
 * > [!NOTE]
 * > The dbghelp.h header defines SRCCODEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-srccodeinfow
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class SRCCODEINFOW extends Win32Struct
{
    static sizeof => 1080

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is not used.
     * @type {Pointer<Void>}
     */
    Key {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The base address of the module that contains the line.
     * @type {Integer}
     */
    ModBase {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The name of the object file within the module that contains the line.
     * @type {String}
     */
    Obj {
        get => StrGet(this.ptr + 24, 260, "UTF-16")
        set => StrPut(value, this.ptr + 24, 260, "UTF-16")
    }

    /**
     * The fully qualified source file name.
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 546, 260, "UTF-16")
        set => StrPut(value, this.ptr + 546, 260, "UTF-16")
    }

    /**
     * The line number within the source file.
     * @type {Integer}
     */
    LineNumber {
        get => NumGet(this, 1068, "uint")
        set => NumPut("uint", value, this, 1068)
    }

    /**
     * The virtual address of the first instruction of the line.
     * @type {Integer}
     */
    Address {
        get => NumGet(this, 1072, "uint")
        set => NumPut("uint", value, this, 1072)
    }
}
