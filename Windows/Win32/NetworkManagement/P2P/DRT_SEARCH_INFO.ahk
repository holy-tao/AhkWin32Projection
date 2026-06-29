#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRT_DATA.ahk" { DRT_DATA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * DRT_SEARCH_INFO structure represents a search query issued with DrtStartSearch.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_search_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_SEARCH_INFO {
    #StructPack 8

    /**
     * Specifies the byte count of <b>DRT_SEARCH_INFO</b>.
     */
    dwSize : UInt32

    /**
     * Indicates whether the search is iterative.  If set to <b>TRUE</b>, the search is iterative.
     */
    fIterative : BOOL

    /**
     * Indicates whether  search results can contain matches found in the local DRT instance.  If set to <b>TRUE</b>,  the search results are capable of containing matches found in the local DRT instance.
     */
    fAllowCurrentInstanceMatch : BOOL

    /**
     * If set to <b>true</b>,   the search will stop locating the first key falling within the specified range. Otherwise, the search for the closest match to the target key specified by <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtstartsearch">DrtStartSearch</a> will continue.
     */
    fAnyMatchInRange : BOOL

    /**
     * Specifies the number of results to return.  This includes closest and exact matches.   If this value is greater than 1 when <b>fIterative</b> is <b>TRUE</b>, the search will only return 1 result.
     */
    cMaxEndpoints : UInt32

    /**
     * Specifies the numerically largest key value the infrastructure should attempt to match.
     */
    pMaximumKey : DRT_DATA.Ptr

    /**
     * Specifies the numerically smallest key value the infrastructure should attempt to match.
     */
    pMinimumKey : DRT_DATA.Ptr

}
