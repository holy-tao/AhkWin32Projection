#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct ROWSTATUS {
    #StructPack 4

    lRowFirst : Int32

    cRows : Int32

    cProperties : Int32

    cRowsTotal : Int32

}
