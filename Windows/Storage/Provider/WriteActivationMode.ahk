#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates whether other apps can write to the locally cached version of the file and when Windows will request an update if another app writes to that local file.
 * @remarks
 * If your app participates in the Cached File Updater contract, associate this information with the locally cached copy of a file by calling [CachedFileUpdater.SetUpdateInformation](cachedfileupdater_setupdateinformation_1837385638.md).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.writeactivationmode
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class WriteActivationMode extends Win32Enum{

    /**
     * Other apps can't write to the local file.
     * @type {Integer (Int32)}
     */
    static ReadOnly => 0

    /**
     * Windows will trigger a file update request when another app writes to the local file.
     * @type {Integer (Int32)}
     */
    static NotNeeded => 1

    /**
     * Windows will trigger a file update request after another app writes to the local file.
     * @type {Integer (Int32)}
     */
    static AfterWrite => 2
}
