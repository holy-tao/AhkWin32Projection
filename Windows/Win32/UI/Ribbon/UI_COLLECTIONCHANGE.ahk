#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies values that identify the types of changes that can be made to a collection.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ne-uiribbon-ui_collectionchange
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct UI_COLLECTIONCHANGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
