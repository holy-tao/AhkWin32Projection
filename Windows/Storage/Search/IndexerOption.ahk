#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether the query should use the system index of the file system when enumerating content in the folder being queried. The indexer can retrieve results faster but is not available in all file locations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.indexeroption
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IndexerOption extends Win32Enum{

    /**
     * Use the system index for content that has been indexed and use the file system directly for content that has not been indexed.
     * @type {Integer (Int32)}
     */
    static UseIndexerWhenAvailable => 0

    /**
     * Use only indexed content and ignore content that has not been indexed.
     * @type {Integer (Int32)}
     */
    static OnlyUseIndexer => 1

    /**
     * Access the file system directly; don't use the system index.
     * @type {Integer (Int32)}
     */
    static DoNotUseIndexer => 2

    /**
     * Only returns the properties specified in [QueryOptions.SetPropertyPrefetch](queryoptions_setpropertyprefetch_770511515.md) for faster results.
     * @type {Integer (Int32)}
     */
    static OnlyUseIndexerAndOptimizeForIndexedProperties => 3
}
