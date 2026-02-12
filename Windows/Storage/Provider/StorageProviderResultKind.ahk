#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the possible kinds of storage provider results.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderresultkind
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderResultKind extends Win32Enum{

    /**
     * The result is a search result.
     * @type {Integer (Int32)}
     */
    static Search => 0

    /**
     * The result is a recommended item.
     * @type {Integer (Int32)}
     */
    static Recommended => 1

    /**
     * The result is a favorite item.
     * @type {Integer (Int32)}
     */
    static Favorites => 2

    /**
     * The result is a recent item.
     * @type {Integer (Int32)}
     */
    static Recent => 3

    /**
     * The result is a shared item.
     * @type {Integer (Int32)}
     */
    static Shared => 4

    /**
     * The result is a related file.
     * @type {Integer (Int32)}
     */
    static RelatedFiles => 5

    /**
     * The result is a related conversation.
     * @type {Integer (Int32)}
     */
    static RelatedConversations => 6
}
