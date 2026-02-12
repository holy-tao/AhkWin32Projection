#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * An enumeration of file hydration policy values for a placeholder file. The hydration policy allows a sync root to customize behavior for retrieving data for a placeholder file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderhydrationpolicy
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderHydrationPolicy extends Win32Enum{

    /**
     * Hydration is performed at the user's request. Hydration does not continue in the background.
     * @type {Integer (Int32)}
     */
    static Partial => 0

    /**
     * On demand hyrdration is performed. If hydration has not finished, it will continue in the background.
     * @type {Integer (Int32)}
     */
    static Progressive => 1

    /**
     * Full hydration is performed. Ensures that the placeholder is available locally before completing a request.
     * @type {Integer (Int32)}
     */
    static Full => 2

    /**
     * If this is selected and a placeholder cannot be fully hydrated, the platform will fail with: ERROR_CLOUD_FILE_INVALID_REQUEST.
     * @type {Integer (Int32)}
     */
    static AlwaysFull => 3
}
