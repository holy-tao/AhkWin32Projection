#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

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
    fUniCodeStrings{
        get {
            if(!this.HasProp("__fUniCodeStrings"))
                this.__fUniCodeStrings := BOOL(this.ptr + 4)
            return this.__fUniCodeStrings
        }
    }

    /**
     * String containing the search query.
     * @type {Pointer<SByte>}
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
    fStemmedSearch{
        get {
            if(!this.HasProp("__fStemmedSearch"))
                this.__fStemmedSearch := BOOL(this.ptr + 20)
            return this.__fStemmedSearch
        }
    }

    /**
     * TRUE for Title search only.
     * @type {BOOL}
     */
    fTitleOnly{
        get {
            if(!this.HasProp("__fTitleOnly"))
                this.__fTitleOnly := BOOL(this.ptr + 24)
            return this.__fTitleOnly
        }
    }

    /**
     * TRUE to initiate the search.
     * @type {BOOL}
     */
    fExecute{
        get {
            if(!this.HasProp("__fExecute"))
                this.__fExecute := BOOL(this.ptr + 28)
            return this.__fExecute
        }
    }

    /**
     * Window to display in.
     * @type {Pointer<SByte>}
     */
    pszWindow {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
