#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGE_FILE_CHARACTERISTICS.ahk" { IMAGE_FILE_CHARACTERISTICS }
#Import "..\..\SystemInformation\IMAGE_FILE_MACHINE.ahk" { IMAGE_FILE_MACHINE }

/**
 * Represents the COFF header format.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-image_file_header
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_FILE_HEADER {
    #StructPack 4

    /**
     * The architecture type of the computer. An image file can only be run on the specified computer or a system
     */
    Machine : IMAGE_FILE_MACHINE

    /**
     * The number of sections. This indicates the size of the section table, which immediately follows the 
     *       headers. Note that the Windows loader limits the number of sections to 96.
     */
    NumberOfSections : UInt16

    /**
     * The low 32 bits of the time stamp of the image. This represents the date and time the image was created by 
     *       the linker. The value is represented in the number of seconds elapsed since midnight (00:00:00), January 1, 
     *       1970, Universal Coordinated Time, according to the system clock.
     */
    TimeDateStamp : UInt32

    /**
     * The offset of the symbol table, in bytes, or zero if no COFF symbol table exists.
     */
    PointerToSymbolTable : UInt32

    /**
     * The number of symbols in the symbol table.
     */
    NumberOfSymbols : UInt32

    /**
     * The size of the optional header, in bytes. This value should be 0 for object files.
     */
    SizeOfOptionalHeader : UInt16

    Characteristics : IMAGE_FILE_CHARACTERISTICS

}
