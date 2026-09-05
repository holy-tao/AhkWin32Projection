#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies values that identify the types of changes that can be made to a collection.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_collectionchange
 * @namespace Windows.Win32.UI.Ribbon
 */
class UI_COLLECTIONCHANGE extends Win32Enum {

    /**
     * Insert an item into the collection.
     * Native name: UI_COLLECTIONCHANGE_INSERT
     * @type {Integer (Int32)}
     */
    static INSERT => 0

    /**
     * Delete an item from the collection.
     * Native name: UI_COLLECTIONCHANGE_REMOVE
     * @type {Integer (Int32)}
     */
    static REMOVE => 1

    /**
     * Replace an item in the collection.
     * Native name: UI_COLLECTIONCHANGE_REPLACE
     * @type {Integer (Int32)}
     */
    static REPLACE => 2

    /**
     * Delete all items from the collection.
     * Native name: UI_COLLECTIONCHANGE_RESET
     * @type {Integer (Int32)}
     */
    static RESET => 3
}
