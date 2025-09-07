#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the kind of change affecting an item when a source sink notifies a client that an item has been changed.
 * @remarks
 * SEARCH_CHANGE_ADD, SEARCH_CHANGE_DELETE, and SEARCH_CHANGE_MODIFY are mutually exclusive. Only one of them can be used at a time. However, any one of them can be combined with the remaining flags.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-search_kind_of_change
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SEARCH_KIND_OF_CHANGE{

    /**
     * An item was added.
     * @type {Integer (Int32)}
     */
    static SEARCH_CHANGE_ADD => 0

    /**
     * An item was deleted.
     * @type {Integer (Int32)}
     */
    static SEARCH_CHANGE_DELETE => 1

    /**
     * An item was modified.
     * @type {Integer (Int32)}
     */
    static SEARCH_CHANGE_MODIFY => 2

    /**
     * An item was moved or renamed. Not currently supported for use with <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchpersistentitemschangedsink-onitemschanged">ISearchPersistentItemsChangedSink::OnItemsChanged</a>.
     * @type {Integer (Int32)}
     */
    static SEARCH_CHANGE_MOVE_RENAME => 3

    /**
     * An item is a directory. The item needs to be crawled rather than just reindexed as a document would be.
     * @type {Integer (Int32)}
     */
    static SEARCH_CHANGE_SEMANTICS_DIRECTORY => 262144

    /**
     * Index directory properties were changed for an item.
     * @type {Integer (Int32)}
     */
    static SEARCH_CHANGE_SEMANTICS_SHALLOW => 524288

    /**
     * Security on an item was changed.
     * @type {Integer (Int32)}
     */
    static SEARCH_CHANGE_SEMANTICS_UPDATE_SECURITY => 4194304
}
