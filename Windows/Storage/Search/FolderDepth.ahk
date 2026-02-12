#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates whether all files and subfolders of the folder being queried will be enumerated or if only the top-level files and subfolders will be enumerated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.folderdepth
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class FolderDepth extends Win32Enum{

    /**
     * Perform a shallow enumeration of the folder being queried. Only the top-level, child files and folders of the folder being queried will be returned. This is similar to the view that Windows Explorer would provide for the folder being queried.
     * @type {Integer (Int32)}
     */
    static Shallow => 0

    /**
     * Perform a deep enumeration of the folder contents. Windows traverses through subfolders to discover content and presents the results in a single list that combines all discovered content.
     * @type {Integer (Int32)}
     */
    static Deep => 1
}
