#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies values that identify the types of changes that can be made to a collection.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_collectionchange
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_COLLECTIONCHANGE{

    /**
     * Insert an item into the collection.
     * @type {Integer (Int32)}
     */
    static UI_COLLECTIONCHANGE_INSERT => 0

    /**
     * Delete an item from the collection.
     * @type {Integer (Int32)}
     */
    static UI_COLLECTIONCHANGE_REMOVE => 1

    /**
     * Replace an item in the collection.
     * @type {Integer (Int32)}
     */
    static UI_COLLECTIONCHANGE_REPLACE => 2

    /**
     * Delete all items from the collection.
     * @type {Integer (Int32)}
     */
    static UI_COLLECTIONCHANGE_RESET => 3
}
