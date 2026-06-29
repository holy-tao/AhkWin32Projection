#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a range of pages.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ns-docobj-pagerange
 * @namespace Windows.Win32.System.Ole
 */
export default struct PAGERANGE {
    #StructPack 4

    /**
     * The first page of the range. This member can have any page number as a value. If this value is greater than the value specified in <b>nToPage</b>, the document will be printed in reverse page order.
     */
    nFromPage : Int32

    /**
     * The last page of the range. A special value, <b>PAGESET_TOLASTPAGE</b>, indicates that all the remaining pages should be printed. This member can have any page number as a value. If this value is less than the value specified in <b>nFromPage</b>, the document will be printed in reverse page order.
     */
    nToPage : Int32

}
