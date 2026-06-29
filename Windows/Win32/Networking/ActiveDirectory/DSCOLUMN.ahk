#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DSCOLUMN structure represents a column in the directory services query dialog box. An array of this structure is contained in the DSQUERYPARAMS structure.
 * @see https://learn.microsoft.com/windows/win32/api/dsquery/ns-dsquery-dscolumn
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSCOLUMN {
    #StructPack 4

    /**
     * Reserved.
     */
    dwFlags : UInt32

    /**
     * Contains one of the list view column formatting values that indicates how the column is displayed. The possible values are defined for the <b>fmt</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvcolumna">LVCOLUMN</a> structure.
     */
    fmt : Int32

    /**
     * Contains the width, in pixels, of the column.
     */
    cx : Int32

    /**
     * Contains the string table identifier for the column header string. To retrieve this string, call  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a> with the <b>hInstance</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dsquery/ns-dsquery-dsqueryparams">DSQUERYPARAMS</a> structure and this member for the string identifier.
     */
    idsName : Int32

    offsetProperty : Int32

    /**
     * Reserved.
     */
    dwReserved : UInt32

}
