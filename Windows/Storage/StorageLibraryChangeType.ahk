#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Describes the type of change that occurred to the storage library item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangetype
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageLibraryChangeType extends Win32Enum{

    /**
     * The item was created.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The item was deleted.
     * @type {Integer (Int32)}
     */
    static Deleted => 1

    /**
     * The item was moved or renamed.
     * @type {Integer (Int32)}
     */
    static MovedOrRenamed => 2

    /**
     * The contents of the item changed.
     * @type {Integer (Int32)}
     */
    static ContentsChanged => 3

    /**
     * The item was moved out of a library.
     * @type {Integer (Int32)}
     */
    static MovedOutOfLibrary => 4

    /**
     * The item was moved into a library
     * @type {Integer (Int32)}
     */
    static MovedIntoLibrary => 5

    /**
     * The contents have been replaced.
     * @type {Integer (Int32)}
     */
    static ContentsReplaced => 6

    /**
     * The item was changed from one where the content can be indexed to one where the content can't be indexed, or vice versa. Content indexing permits rapid searching of data by building a database of selected content.
     * @type {Integer (Int32)}
     */
    static IndexingStatusChanged => 7

    /**
     * The encryption applied to this item has changed.
     * @type {Integer (Int32)}
     */
    static EncryptionChanged => 8

    /**
     * The change tracking information associated with the item was lost. Call [Reset](storagelibrarychangetracker_reset_1636126115.md) to reestablish continuity with the storage library.
     * @type {Integer (Int32)}
     */
    static ChangeTrackingLost => 9
}
