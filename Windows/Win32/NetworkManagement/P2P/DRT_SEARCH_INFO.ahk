#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * DRT_SEARCH_INFO structure represents a search query issued with DrtStartSearch.
 * @see https://docs.microsoft.com/windows/win32/api//drt/ns-drt-drt_search_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_SEARCH_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the byte count of <b>DRT_SEARCH_INFO</b>.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates whether the search is iterative.  If set to <b>TRUE</b>, the search is iterative.
     * @type {BOOL}
     */
    fIterative{
        get {
            if(!this.HasProp("__fIterative"))
                this.__fIterative := BOOL(this.ptr + 4)
            return this.__fIterative
        }
    }

    /**
     * Indicates whether  search results can contain matches found in the local DRT instance.  If set to <b>TRUE</b>,  the search results are capable of containing matches found in the local DRT instance.
     * @type {BOOL}
     */
    fAllowCurrentInstanceMatch{
        get {
            if(!this.HasProp("__fAllowCurrentInstanceMatch"))
                this.__fAllowCurrentInstanceMatch := BOOL(this.ptr + 8)
            return this.__fAllowCurrentInstanceMatch
        }
    }

    /**
     * If set to <b>true</b>,   the search will stop locating the first key falling within the specified range. Otherwise, the search for the closest match to the target key specified by <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtstartsearch">DrtStartSearch</a> will continue.
     * @type {BOOL}
     */
    fAnyMatchInRange{
        get {
            if(!this.HasProp("__fAnyMatchInRange"))
                this.__fAnyMatchInRange := BOOL(this.ptr + 12)
            return this.__fAnyMatchInRange
        }
    }

    /**
     * Specifies the number of results to return.  This includes closest and exact matches.   If this value is greater than 1 when <b>fIterative</b> is <b>TRUE</b>, the search will only return 1 result.
     * @type {Integer}
     */
    cMaxEndpoints {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the numerically largest key value the infrastructure should attempt to match.
     * @type {Pointer<DRT_DATA>}
     */
    pMaximumKey {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the numerically smallest key value the infrastructure should attempt to match.
     * @type {Pointer<DRT_DATA>}
     */
    pMinimumKey {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
