#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about the kind of change that has occurred in an item to be indexed. This structure is used with the ISearchPersistentItemsChangedSink::OnItemsChanged method to pass information to the indexer about what has changed.
 * @remarks
 * SEARCH_CHANGE_MOVE_RENAME is not supported for use with <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchpersistentitemschangedsink-onitemschanged">ISearchPersistentItemsChangedSink::OnItemsChanged</a>.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ns-searchapi-search_item_persistent_change
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SEARCH_ITEM_PERSISTENT_CHANGE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_kind_of_change">SEARCH_KIND_OF_CHANGE</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_kind_of_change">SEARCH_KIND_OF_CHANGE</a> enumerated type that indicates the kind of change.
     * @type {Integer}
     */
    Change {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the URL of the item in a SEARCH_CHANGE_ADD, SEARCH_CHANGE_MODIFY, or SEARCH_CHANGE_DELETE notification. In the case of a move, this member contains the new URL of the item.
     * @type {PWSTR}
     */
    URL{
        get {
            if(!this.HasProp("__URL"))
                this.__URL := PWSTR(this.ptr + 8)
            return this.__URL
        }
    }

    /**
     * 
     * @type {PWSTR}
     */
    OldURL{
        get {
            if(!this.HasProp("__OldURL"))
                this.__OldURL := PWSTR(this.ptr + 16)
            return this.__OldURL
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_notification_priority">SEARCH_NOTIFICATION_PRIORITY</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_notification_priority">SEARCH_NOTIFICATION_PRIORITY</a> enumerated type that indicates the priority of the change.
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
