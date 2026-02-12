#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Enumeration of the status of a storage provider URI.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderurisourcestatus
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderUriSourceStatus extends Win32Enum{

    /**
     * The storage provider ID exists.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * There is no sync root registered with the URI source.
     * @type {Integer (Int32)}
     */
    static NoSyncRoot => 1

    /**
     * The URI is not recognized by the sync provider.
     * @type {Integer (Int32)}
     */
    static FileNotFound => 2
}
