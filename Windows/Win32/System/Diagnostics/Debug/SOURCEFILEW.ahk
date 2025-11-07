#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains source file information.
 * @remarks
 * 
 * > [!NOTE]
 * > The dbghelp.h header defines SOURCEFILE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-sourcefilew
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class SOURCEFILEW extends Win32Struct
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
     * @type {PWSTR}
     */
    FileName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
