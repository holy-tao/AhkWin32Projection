#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PAGERANGE.ahk" { PAGERANGE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Identifies one or more page-ranges to be printed and, optionally, identifies only the even or odd pages as part of a pageset.
 * @see https://learn.microsoft.com/windows/win32/api/docobj/ns-docobj-pageset
 * @namespace Windows.Win32.System.Ole
 */
export default struct PAGESET {
    #StructPack 4

    /**
     * The number of bytes in this instance of the <b>PAGESET</b> structure. This member must be a multiple of 4.
     */
    cbStruct : UInt32

    /**
     * If <b>TRUE</b>, only the odd-numbered pages in the page-set indicated by <b>rgPages</b> are to be printed.
     */
    fOddPages : BOOL

    /**
     * If <b>TRUE</b>, only the even-numbered pages in the page-set indicated by <b>rgPages</b> are to be printed.
     */
    fEvenPages : BOOL

    /**
     * The number of page-range pairs specified in <b>rgPages</b>.
     */
    cPageRange : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ns-docobj-pagerange">PAGERANGE</a> structures specifying the pages to be printed. One or more page ranges can be specified, so long as the number of page ranges is the value of <b>cPageRange</b>. The page ranges must be sorted in ascending order and must be non-overlapping.
     */
    rgPages : PAGERANGE[1]

}
