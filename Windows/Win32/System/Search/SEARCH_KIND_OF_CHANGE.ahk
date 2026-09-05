#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the kind of change affecting an item when a source sink notifies a client that an item has been changed.
 * @remarks
 * SEARCH_CHANGE_ADD, SEARCH_CHANGE_DELETE, and SEARCH_CHANGE_MODIFY are mutually exclusive. Only one of them can be used at a time. However, any one of them can be combined with the remaining flags.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-search_kind_of_change
 * @namespace Windows.Win32.System.Search
 */
class SEARCH_KIND_OF_CHANGE extends Win32Enum {

    /**
     * An item was added.
     * Native name: SEARCH_CHANGE_ADD
     * @type {Integer (Int32)}
     */
    static ADD => 0

    /**
     * An item was deleted.
     * Native name: SEARCH_CHANGE_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 1

    /**
     * An item was modified.
     * Native name: SEARCH_CHANGE_MODIFY
     * @type {Integer (Int32)}
     */
    static MODIFY => 2

    /**
     * An item was moved or renamed. Not currently supported for use with <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchpersistentitemschangedsink-onitemschanged">ISearchPersistentItemsChangedSink::OnItemsChanged</a>.
     * Native name: SEARCH_CHANGE_MOVE_RENAME
     * @type {Integer (Int32)}
     */
    static MOVE_RENAME => 3

    /**
     * An item is a directory. The item needs to be crawled rather than just reindexed as a document would be.
     * Native name: SEARCH_CHANGE_SEMANTICS_DIRECTORY
     * @type {Integer (Int32)}
     */
    static SEMANTICS_DIRECTORY => 262144

    /**
     * Index directory properties were changed for an item.
     * Native name: SEARCH_CHANGE_SEMANTICS_SHALLOW
     * @type {Integer (Int32)}
     */
    static SEMANTICS_SHALLOW => 524288

    /**
     * Security on an item was changed.
     * Native name: SEARCH_CHANGE_SEMANTICS_UPDATE_SECURITY
     * @type {Integer (Int32)}
     */
    static SEMANTICS_UPDATE_SECURITY => 4194304
}
