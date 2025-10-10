#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RDCOMPARE structure is introduced in MMC 1.2.
 * @remarks
 * 
  * If the snap-in implements the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iresultdatacompareex">IResultDataCompareEx</a> interface, MMC MMC allocates the parameters to the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdatacompareex-compare">IResultDataCompareEx::Compare</a> snap-in's method and then calls the method. MMC releases the parameters after the method returns.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-rdcompare
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class RDCOMPARE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Size of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved. Always zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Column being sorted.
     * @type {Integer}
     */
    nColumn {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A value that specifies user-provided information that is passed into 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdata-sort">IResultData::Sort</a>. MMC does not interpret this parameter.
     * @type {Pointer}
     */
    lUserParam {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/mmc/ns-mmc-rditemhdr">RDITEMHDR</a> structure that specifies the first item's type (scope or result) and cookie.
     * @type {Pointer<RDITEMHDR>}
     */
    prdch1 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/mmc/ns-mmc-rditemhdr">RDITEMHDR</a> structure that specifies the second item's type (scope or result) and cookie.
     * @type {Pointer<RDITEMHDR>}
     */
    prdch2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
