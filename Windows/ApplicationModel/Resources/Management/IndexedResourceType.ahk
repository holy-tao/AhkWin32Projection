#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether an [IndexedResourceCandidate](indexedresourcecandidate.md) is a file or a string.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.resources.management.indexedresourcetype
 * @namespace Windows.ApplicationModel.Resources.Management
 * @version WindowsRuntime 1.4
 */
class IndexedResourceType extends Win32Enum{

    /**
     * The [IndexedResourceCandidate](indexedresourcecandidate.md) is a string.
     * @type {Integer (Int32)}
     */
    static String => 0

    /**
     * The [IndexedResourceCandidate](indexedresourcecandidate.md) is a file.
     * @type {Integer (Int32)}
     */
    static Path => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static EmbeddedData => 2
}
