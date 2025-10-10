#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents the COFF symbols header.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-image_coff_symbols_header
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_COFF_SYMBOLS_HEADER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * The number of symbols.
     * @type {Integer}
     */
    NumberOfSymbols {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The virtual address of the first symbol.
     * @type {Integer}
     */
    LvaToFirstSymbol {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of line-number entries.
     * @type {Integer}
     */
    NumberOfLinenumbers {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The virtual address of the first line-number entry.
     * @type {Integer}
     */
    LvaToFirstLinenumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The relative virtual address of the first byte of code.
     * @type {Integer}
     */
    RvaToFirstByteOfCode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The relative virtual address of the last byte of code.
     * @type {Integer}
     */
    RvaToLastByteOfCode {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The relative virtual address of the first byte of data.
     * @type {Integer}
     */
    RvaToFirstByteOfData {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The relative virtual address of the last byte of data.
     * @type {Integer}
     */
    RvaToLastByteOfData {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
