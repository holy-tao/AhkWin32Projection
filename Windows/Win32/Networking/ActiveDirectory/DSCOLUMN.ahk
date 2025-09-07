#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DSCOLUMN structure represents a column in the directory services query dialog box. An array of this structure is contained in the DSQUERYPARAMS structure.
 * @see https://learn.microsoft.com/windows/win32/api/dsquery/ns-dsquery-dscolumn
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSCOLUMN extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Reserved.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains one of the list view column formatting values that indicates how the column is displayed. The possible values are defined for the <b>fmt</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvcolumna">LVCOLUMN</a> structure.
     * @type {Integer}
     */
    fmt {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Contains the width, in pixels, of the column.
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Contains the string table identifier for the column header string. To retrieve this string, call  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-loadstringa">LoadString</a> with the <b>hInstance</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dsquery/ns-dsquery-dsqueryparams">DSQUERYPARAMS</a> structure and this member for the string identifier.
     * @type {Integer}
     */
    idsName {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    offsetProperty {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
