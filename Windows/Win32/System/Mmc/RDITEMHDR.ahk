#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RDITEMHDR structure is introduced in MMC 1.2.
 * @remarks
 * 
 * If the snap-in implements the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iresultdatacompareex">IResultDataCompareEx</a> interface, MMC allocates an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-rdcompare">RDCOMPARE</a> structure and two 
 * <b>RDITEMHDR</b> structures and then calls the snap-ins 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdatacompareex-compare">IResultDataCompareEx::Compare</a> method. After the method returns, MMC releases the three structures it allocated.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-rditemhdr
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class RDITEMHDR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A value that specifies whether the item is a scope or result item. If the <b>RDCI_ScopeItem</b> (0x80000000) flag is set, the item is a scope item. Otherwise, the item is a result item.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The unique identifier of the scope or result item object to be compared as part of the sorting operation.
     * @type {Pointer}
     */
    cookie {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reserved for future use.
     * @type {LPARAM}
     */
    lpReserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
