#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PAGERANGE.ahk

/**
 * Identifies one or more page-ranges to be printed and, optionally, identifies only the even or odd pages as part of a pageset.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ns-docobj-pageset
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PAGESET extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of bytes in this instance of the <b>PAGESET</b> structure. This member must be a multiple of 4.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If <b>TRUE</b>, only the odd-numbered pages in the page-set indicated by <b>rgPages</b> are to be printed.
     * @type {Integer}
     */
    fOddPages {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * If <b>TRUE</b>, only the even-numbered pages in the page-set indicated by <b>rgPages</b> are to be printed.
     * @type {Integer}
     */
    fEvenPages {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The number of page-range pairs specified in <b>rgPages</b>.
     * @type {Integer}
     */
    cPageRange {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ns-docobj-pagerange">PAGERANGE</a> structures specifying the pages to be printed. One or more page ranges can be specified, so long as the number of page ranges is the value of <b>cPageRange</b>. The page ranges must be sorted in ascending order and must be non-overlapping.
     * @type {Array<PAGERANGE>}
     */
    rgPages{
        get {
            if(!this.HasProp("__rgPagesProxyArray"))
                this.__rgPagesProxyArray := Win32FixedArray(this.ptr + 16, 1, PAGERANGE, "")
            return this.__rgPagesProxyArray
        }
    }
}
