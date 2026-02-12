#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies whether a deleted item is moved to the Recycle Bin or permanently deleted.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storagedeleteoption
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageDeleteOption extends Win32Enum{

    /**
     * Specifies the default behavior.
     * 
     * 
     * + If the item is in an application storage location (that is, a location that can be accessed through the [ApplicationData](applicationdata.md) class), it's permanently deleted. It's not moved to the Recycle Bin.
     * + If the item is in another location, the item is deleted according to the default behavior of File Explorer for that location. The item may be moved to the Recycle Bin, or it may be permanently deleted.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Permanently deletes the item. The item is not moved to the Recycle Bin.
     * @type {Integer (Int32)}
     */
    static PermanentDelete => 1
}
