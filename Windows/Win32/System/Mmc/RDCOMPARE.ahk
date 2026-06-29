#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\RDITEMHDR.ahk" { RDITEMHDR }

/**
 * The RDCOMPARE structure is introduced in MMC 1.2.
 * @remarks
 * If the snap-in implements the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iresultdatacompareex">IResultDataCompareEx</a> interface, MMC MMC allocates the parameters to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdatacompareex-compare">IResultDataCompareEx::Compare</a> snap-in's method and then calls the method. MMC releases the parameters after the method returns.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-rdcompare
 * @namespace Windows.Win32.System.Mmc
 */
export default struct RDCOMPARE {
    #StructPack 8

    /**
     * Size of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Reserved. Always zero.
     */
    dwFlags : UInt32

    /**
     * Column being sorted.
     */
    nColumn : Int32

    /**
     * A value that specifies user-provided information that is passed into 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdata-sort">IResultData::Sort</a>. MMC does not interpret this parameter.
     */
    lUserParam : LPARAM

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/mmc/ns-mmc-rditemhdr">RDITEMHDR</a> structure that specifies the first item's type (scope or result) and cookie.
     */
    prdch1 : RDITEMHDR.Ptr

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/win32/api/mmc/ns-mmc-rditemhdr">RDITEMHDR</a> structure that specifies the second item's type (scope or result) and cookie.
     */
    prdch2 : RDITEMHDR.Ptr

}
