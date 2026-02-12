#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates when Windows will request a file update if another app retrieves the file from its [MostRecentlyUsedList](../windows.storage.accesscache/storageapplicationpermissions_mostrecentlyusedlist.md) or [FutureAccessList](../windows.storage.accesscache/storageapplicationpermissions_futureaccesslist.md).
 * @remarks
 * If your app participates in the Cached File Updater contract, associate this information with the locally cached copy of a file by calling [CachedFileUpdater.SetUpdateInformation](cachedfileupdater_setupdateinformation_1837385638.md).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.readactivationmode
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class ReadActivationMode extends Win32Enum{

    /**
     * Windows will not trigger a file update request when another app retrieves the local file.
     * @type {Integer (Int32)}
     */
    static NotNeeded => 0

    /**
     * Windows will trigger a file update request just before it has been retrieved from the app's [MostRecentlyUsedList](../windows.storage.accesscache/storageapplicationpermissions_mostrecentlyusedlist.md) or [FutureAccessList](../windows.storage.accesscache/storageapplicationpermissions_futureaccesslist.md).
     * @type {Integer (Int32)}
     */
    static BeforeAccess => 1
}
