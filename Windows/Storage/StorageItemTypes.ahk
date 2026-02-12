#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Describes whether an item that implements the [IStorageItem](istorageitem.md) interface is a file or a folder.
 * @remarks
 * A value from this enumeration is returned by the [IStorageItem.IsOfType](istorageitem_isoftype_1417811226.md), [StorageFile.IsOfType](storagefile_isoftype_1417811226.md), and [StorageFolder.IsOfType](storagefolder_isoftype_1417811226.md) methods.
 * 
 * The **IsOfType** method is useful for processing the results from a method that returns [IStorageItem](istorageitem.md) instances that can be files or folders. For example, the [GetItemAsync](storagefolder_getitemasync_1847090456.md) and [GetItemsAsync](storagefolder_getitemsasync_1518547059.md) methods returns [IStorageItem](istorageitem.md) instances. To work with the returned items, call the [IsOfType](istorageitem_isoftype_1417811226.md) method of the [IStorageItem](istorageitem.md) interface to determine whether each item is a file or a folder. Then cast the item to a [StorageFolder](storagefolder.md) or [StorageFile](storagefile.md).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storageitemtypes
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageItemTypes extends Win32BitflagEnum{

    /**
     * A storage item that is neither a file nor a folder.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * A file that is represented as a [StorageFile](storagefile.md) instance.
     * @type {Integer (UInt32)}
     */
    static File => 1

    /**
     * A folder that is represented as a [StorageFolder](storagefolder.md) instance.
     * @type {Integer (UInt32)}
     */
    static Folder => 2
}
