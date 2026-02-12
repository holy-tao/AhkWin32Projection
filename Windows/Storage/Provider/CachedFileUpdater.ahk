#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICachedFileUpdaterStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages files so that they can be updated in real-time by an app that participates in the Cached File Updater contract.
 * @remarks
 * Access methods in this class statically.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.cachedfileupdater
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class CachedFileUpdater extends IInspectable {
;@region Static Methods
    /**
     * Configures update policies for a local file.
     * @remarks
     * In order to use this method your app must participate in the Cached File Updater contract.
     * 
     * You can use this method to control how other apps can access a file that is provided by your app and to control when Windows requests updates for that file.
     * @param {IStorageFile} file_ The local file.
     * @param {HSTRING} contentId A unique identifier for the local file.
     * 
     * You can use this identifier to associate a file in your app's repository with the local file. When updates are requested by Windows, you can use this *contentId* to identify the correct file in your app's repository.
     * @param {Integer} readMode A value that specifies whether Windows will request updates before the local file is retrieved from an app's [MostRecentlyUsedList](../windows.storage.accesscache/storageapplicationpermissions_mostrecentlyusedlist.md) or [FutureAccessList](../windows.storage.accesscache/storageapplicationpermissions_futureaccesslist.md).
     * @param {Integer} writeMode A value that specifies whether other apps can write to the local file and, if so, whether Windows will request updates after the local file is written.
     * @param {Integer} options A value that specifies additional circumstances and behaviors for when Windows requests updates.
     * 
     * For example, you could require Windows to request an update every time the local file is accessed by using [CachedFileOptions.RequireUpdateOnAccess](cachedfileoptions.md). For more information about possible options, see [CachedFileOptions](cachedfileoptions.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.cachedfileupdater.setupdateinformation
     */
    static SetUpdateInformation(file_, contentId, readMode, writeMode, options) {
        if (!CachedFileUpdater.HasProp("__ICachedFileUpdaterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.CachedFileUpdater")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICachedFileUpdaterStatics.IID)
            CachedFileUpdater.__ICachedFileUpdaterStatics := ICachedFileUpdaterStatics(factoryPtr)
        }

        return CachedFileUpdater.__ICachedFileUpdaterStatics.SetUpdateInformation(file_, contentId, readMode, writeMode, options)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
