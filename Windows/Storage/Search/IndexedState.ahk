#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates whether a [StorageFolder](../windows.storage/storagefolder.md) is included in the system index.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.indexedstate
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IndexedState extends Win32Enum{

    /**
     * The indexed state is not known.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The folder is not indexed.
     * @type {Integer (Int32)}
     */
    static NotIndexed => 1

    /**
     * Some folders in the library are indexed, but not all of them. This value is relevant only for libraries.
     * @type {Integer (Int32)}
     */
    static PartiallyIndexed => 2

    /**
     * The folder contains indexed content. 
     * 
     * > [!NOTE]
     * > The folder might contain subfolders that are not indexed.
     * @type {Integer (Int32)}
     */
    static FullyIndexed => 3
}
