#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DRT_MATCH_TYPE enumeration defines the exactness of a search result returned by DrtGetSearchResult after initiating a search with the DrtStartSearch API.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ne-drt-drt_match_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_MATCH_TYPE{

    /**
     * The node  found is publishing the target key or is publishing a key within the specified range.
     * @type {Integer (Int32)}
     */
    static DRT_MATCH_EXACT => 0

    /**
     * The node found is publishing the numerically closest key to the specified target key.
     * @type {Integer (Int32)}
     */
    static DRT_MATCH_NEAR => 1

    /**
     * The node returned is  an intermediate node. An application will  receive this node match type if <b>fIterative</b> is set to <b>TRUE</b>.
     * @type {Integer (Int32)}
     */
    static DRT_MATCH_INTERMEDIATE => 2
}
