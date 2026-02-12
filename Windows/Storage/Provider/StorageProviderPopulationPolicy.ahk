#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Allows a sync provider to control how a placeholder file or directory
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderpopulationpolicy
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderPopulationPolicy extends Win32Enum{

    /**
     * If the placeholder files or directories are not fully populated, the platform will request that the sync provider populate them before completing a user request.
     * @type {Integer (Int32)}
     */
    static Full => 1

    /**
     * The platform will assume that placeholder files and directories are always available locally.
     * @type {Integer (Int32)}
     */
    static AlwaysFull => 2
}
