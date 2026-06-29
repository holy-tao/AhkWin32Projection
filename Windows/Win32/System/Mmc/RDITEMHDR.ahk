#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * The RDITEMHDR structure is introduced in MMC 1.2.
 * @remarks
 * If the snap-in implements the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iresultdatacompareex">IResultDataCompareEx</a> interface, MMC allocates an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-rdcompare">RDCOMPARE</a> structure and two 
 * <b>RDITEMHDR</b> structures and then calls the snap-ins 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdatacompareex-compare">IResultDataCompareEx::Compare</a> method. After the method returns, MMC releases the three structures it allocated.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-rditemhdr
 * @namespace Windows.Win32.System.Mmc
 */
export default struct RDITEMHDR {
    #StructPack 8

    /**
     * A value that specifies whether the item is a scope or result item. If the <b>RDCI_ScopeItem</b> (0x80000000) flag is set, the item is a scope item. Otherwise, the item is a result item.
     */
    dwFlags : UInt32

    /**
     * The unique identifier of the scope or result item object to be compared as part of the sorting operation.
     */
    cookie : IntPtr

    /**
     * Reserved for future use.
     */
    lpReserved : LPARAM

}
