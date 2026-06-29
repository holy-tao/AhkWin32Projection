#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SEARCH_NOTIFICATION_PRIORITY.ahk" { SEARCH_NOTIFICATION_PRIORITY }
#Import ".\SEARCH_KIND_OF_CHANGE.ahk" { SEARCH_KIND_OF_CHANGE }

/**
 * Contains information about the kind of change that has occurred in an item to be indexed. This structure is used with the ISearchPersistentItemsChangedSink::OnItemsChanged method to pass information to the indexer about what has changed.
 * @remarks
 * SEARCH_CHANGE_MOVE_RENAME is not supported for use with <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchpersistentitemschangedsink-onitemschanged">ISearchPersistentItemsChangedSink::OnItemsChanged</a>.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-search_item_persistent_change
 * @namespace Windows.Win32.System.Search
 */
export default struct SEARCH_ITEM_PERSISTENT_CHANGE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_kind_of_change">SEARCH_KIND_OF_CHANGE</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_kind_of_change">SEARCH_KIND_OF_CHANGE</a> enumerated type that indicates the kind of change.
     */
    Change : SEARCH_KIND_OF_CHANGE

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the URL of the item in a SEARCH_CHANGE_ADD, SEARCH_CHANGE_MODIFY, or SEARCH_CHANGE_DELETE notification. In the case of a move, this member contains the new URL of the item.
     */
    URL : PWSTR

    OldURL : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_notification_priority">SEARCH_NOTIFICATION_PRIORITY</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_notification_priority">SEARCH_NOTIFICATION_PRIORITY</a> enumerated type that indicates the priority of the change.
     */
    Priority : SEARCH_NOTIFICATION_PRIORITY

}
