#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the COFF symbols header.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-image_coff_symbols_header
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_COFF_SYMBOLS_HEADER {
    #StructPack 4

    /**
     * The number of symbols.
     */
    NumberOfSymbols : UInt32

    /**
     * The virtual address of the first symbol.
     */
    LvaToFirstSymbol : UInt32

    /**
     * The number of line-number entries.
     */
    NumberOfLinenumbers : UInt32

    /**
     * The virtual address of the first line-number entry.
     */
    LvaToFirstLinenumber : UInt32

    /**
     * The relative virtual address of the first byte of code.
     */
    RvaToFirstByteOfCode : UInt32

    /**
     * The relative virtual address of the last byte of code.
     */
    RvaToLastByteOfCode : UInt32

    /**
     * The relative virtual address of the first byte of data.
     */
    RvaToFirstByteOfData : UInt32

    /**
     * The relative virtual address of the last byte of data.
     */
    RvaToLastByteOfData : UInt32

}
