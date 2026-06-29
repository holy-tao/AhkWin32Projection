#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AM_WST_PAGE structure identifies a World Standard Teletext (WST) page.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ns-iwstdec-am_wst_page
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_WST_PAGE {
    #StructPack 8

    /**
     * The page number.
     */
    dwPageNr : UInt32

    /**
     * The sub-page number.
     */
    dwSubPageNr : UInt32

    /**
     * A pointer to the page data.
     */
    pucPageData : IntPtr

}
