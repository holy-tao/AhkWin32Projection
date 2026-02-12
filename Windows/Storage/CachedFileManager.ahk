#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICachedFileManagerStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Lets apps manage real-time updates to files.
 * @remarks
 * This class is static and cannot be instantiated. Call the methods directly instead.
 * 
 * Typically, Windows implicitly initiates updates for files that are provided by other apps when those files change.  However, you can control when updates are initiated by calling [DeferUpdates](cachedfilemanager_deferupdates_1404792989.md). If you use this method are deferred until you call [CompleteUpdatesAsync](cachedfilemanager_completeupdatesasync_1507988567.md) to initiate them.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.cachedfilemanager
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class CachedFileManager extends IInspectable {
;@region Static Methods
    /**
     * Lets apps defer real-time updates for a specified file.
     * @remarks
     * Typically, Windows implicitly initiates updates for files that are provided by other apps when those files change.  However, you can control when updates are initiated by calling DeferUpdates.
     * @param {IStorageFile} file_ The file to defer updates for.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.cachedfilemanager.deferupdates
     */
    static DeferUpdates(file_) {
        if (!CachedFileManager.HasProp("__ICachedFileManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.CachedFileManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICachedFileManagerStatics.IID)
            CachedFileManager.__ICachedFileManagerStatics := ICachedFileManagerStatics(factoryPtr)
        }

        return CachedFileManager.__ICachedFileManagerStatics.DeferUpdates(file_)
    }

    /**
     * Initiates updates for the specified file. This method contacts the app that provided the file to perform the updates.
     * @remarks
     * Using this method ensures that the updates to the file are completed which may require Windows to ask for user input.  For example, the app that provided the file may be activated to perform updates and that app may display UI through a file picker.
     * @param {IStorageFile} file_ The file to update.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.cachedfilemanager.completeupdatesasync
     */
    static CompleteUpdatesAsync(file_) {
        if (!CachedFileManager.HasProp("__ICachedFileManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.CachedFileManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICachedFileManagerStatics.IID)
            CachedFileManager.__ICachedFileManagerStatics := ICachedFileManagerStatics(factoryPtr)
        }

        return CachedFileManager.__ICachedFileManagerStatics.CompleteUpdatesAsync(file_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
