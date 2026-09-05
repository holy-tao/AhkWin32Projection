#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DRT_MATCH_TYPE enumeration defines the exactness of a search result returned by DrtGetSearchResult after initiating a search with the DrtStartSearch API.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ne-drt-drt_match_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class DRT_MATCH_TYPE extends Win32Enum {

    /**
     * The node  found is publishing the target key or is publishing a key within the specified range.
     * Native name: DRT_MATCH_EXACT
     * @type {Integer (Int32)}
     */
    static EXACT => 0

    /**
     * The node found is publishing the numerically closest key to the specified target key.
     * Native name: DRT_MATCH_NEAR
     * @type {Integer (Int32)}
     */
    static NEAR => 1

    /**
     * The node returned is  an intermediate node. An application will  receive this node match type if <b>fIterative</b> is set to <b>TRUE</b>.
     * Native name: DRT_MATCH_INTERMEDIATE
     * @type {Integer (Int32)}
     */
    static INTERMEDIATE => 2
}
