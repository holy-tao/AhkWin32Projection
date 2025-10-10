#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents the COFF header format.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-image_file_header
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_FILE_HEADER extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The architecture type of the computer. An image file can only be run on the specified computer or a system
     * @type {Integer}
     */
    Machine {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The number of sections. This indicates the size of the section table, which immediately follows the 
     *       headers. Note that the Windows loader limits the number of sections to 96.
     * @type {Integer}
     */
    NumberOfSections {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The low 32 bits of the time stamp of the image. This represents the date and time the image was created by 
     *       the linker. The value is represented in the number of seconds elapsed since midnight (00:00:00), January 1, 
     *       1970, Universal Coordinated Time, according to the system clock.
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The offset of the symbol table, in bytes, or zero if no COFF symbol table exists.
     * @type {Integer}
     */
    PointerToSymbolTable {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of symbols in the symbol table.
     * @type {Integer}
     */
    NumberOfSymbols {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The size of the optional header, in bytes. This value should be 0 for object files.
     * @type {Integer}
     */
    SizeOfOptionalHeader {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    Characteristics {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }
}
