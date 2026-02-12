#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the kind of match that was found in a search query.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchmatchkind
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderSearchMatchKind extends Win32Enum{

    /**
     * The match was found via a lexical comparison of the file metadata.
     * @type {Integer (Int32)}
     */
    static Lexical => 0

    /**
     * The match was found via a semantic algorithm.
     * @type {Integer (Int32)}
     */
    static Semantic => 1
}
