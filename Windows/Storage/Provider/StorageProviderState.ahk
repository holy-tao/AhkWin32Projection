#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Enumeration of the status of a storage provider state.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderstate
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderState extends Win32Enum{

    /**
     * The storage provider is currently in-sync.
     * @type {Integer (Int32)}
     */
    static InSync => 0

    /**
     * The storage provider is currently syncing.
     * @type {Integer (Int32)}
     */
    static Syncing => 1

    /**
     * The storage provider has paused syncing.
     * @type {Integer (Int32)}
     */
    static Paused => 2

    /**
     * The storage provider has encountered errors.
     * @type {Integer (Int32)}
     */
    static Error => 3

    /**
     * The storage provider would like to display a warning message to the user.
     * @type {Integer (Int32)}
     */
    static Warning => 4

    /**
     * The storage provider is currently offline.
     * @type {Integer (Int32)}
     */
    static Offline => 5
}
