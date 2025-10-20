#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Use this structure for full-text search.
 * @see https://docs.microsoft.com/windows/win32/api//htmlhelp/ns-htmlhelp-hh_fts_query
 * @namespace Windows.Win32.Data.HtmlHelp
 * @version v4.0.30319
 */
class HH_FTS_QUERY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the size of the structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * TRUE if all strings are Unicode.
     * @type {BOOL}
     */
    fUniCodeStrings {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * String containing the search query.
     * @type {Pointer<Integer>}
     */
    pszSearchQuery {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Word proximity.
     * @type {Integer}
     */
    iProximity {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * TRUE for StemmedSearch only.
     * @type {BOOL}
     */
    fStemmedSearch {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * TRUE for Title search only.
     * @type {BOOL}
     */
    fTitleOnly {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * TRUE to initiate the search.
     * @type {BOOL}
     */
    fExecute {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Window to display in.
     * @type {Pointer<Integer>}
     */
    pszWindow {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
