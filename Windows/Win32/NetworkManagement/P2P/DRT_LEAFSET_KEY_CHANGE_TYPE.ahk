#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DRT_LEAFSET_KEY_CHANGE_TYPE enumeration defines the set of changes that can occur on nodes in the leaf set of a locally registered key.
 * @remarks
 * 
 * This enumeration is used to determine the event type returned by <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtgeteventdata">DrtGetEventData</a>, which is called with the event handle passed to <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtopen">DrtOpen</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//drt/ne-drt-drt_leafset_key_change_type
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_LEAFSET_KEY_CHANGE_TYPE extends Win32Enum{

    /**
     * A node was added to the  DRT leaf set of the local node.
     * @type {Integer (Int32)}
     */
    static DRT_LEAFSET_KEY_ADDED => 0

    /**
     * A node was deleted from the  DRT leaf set of the local node.
     * @type {Integer (Int32)}
     */
    static DRT_LEAFSET_KEY_DELETED => 1
}
