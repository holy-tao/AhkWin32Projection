#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Use this structure for full-text search.
 * @see https://learn.microsoft.com/windows/win32/api/htmlhelp/ns-htmlhelp-hh_fts_query
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct HH_FTS_QUERY {
    #StructPack 8

    /**
     * Specifies the size of the structure.
     */
    cbStruct : Int32

    /**
     * TRUE if all strings are Unicode.
     */
    fUniCodeStrings : BOOL

    /**
     * String containing the search query.
     */
    pszSearchQuery : IntPtr

    /**
     * Word proximity.
     */
    iProximity : Int32

    /**
     * TRUE for StemmedSearch only.
     */
    fStemmedSearch : BOOL

    /**
     * TRUE for Title search only.
     */
    fTitleOnly : BOOL

    /**
     * TRUE to initiate the search.
     */
    fExecute : BOOL

    /**
     * Window to display in.
     */
    pszWindow : IntPtr

}
