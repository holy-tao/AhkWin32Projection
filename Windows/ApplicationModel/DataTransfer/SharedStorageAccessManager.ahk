#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISharedStorageAccessManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables an app to share a file with another app by passing a token via Uri activation, app service, REST API, etc. The target app redeems the token to get the file shared by the source app.
 * @remarks
 * Here is the sequence of steps that enables an app to share a file with another app by passing a token as part of a Uri activation, for example.
 * 
 * 
 * + The source app calls the [AddFile](sharedstorageaccessmanager_addfile_731286892.md) method to get the sharing token that it passes to the target app, which it launches with a Uri.
 * + The target app calls the [RedeemTokenForFileAsync](sharedstorageaccessmanager_redeemtokenforfileasync_2095026872.md) method to get the shared file.
 * + Optionally, the source app can call the [RemoveFile](sharedstorageaccessmanager_removefile_245169084.md) method to revoke a token that it obtained previously by calling the [AddFile](sharedstorageaccessmanager_addfile_731286892.md) method.
 * For more info about Uri activation, see [Launch the default app for a URI](/windows/uwp/launch-resume/launch-default-app).
 * 
 * The use of the SharedStorageAccessManager class and of sharing tokens is subject to the following requirements and restrictions.
 * 
 * 
 * + A sharing token can only be redeemed one time. After that, the token is no longer valid.
 * + A sharing token expires after 14 days and is no longer valid.
 * + The source app cannot get more than one thousand sharing tokens. After a token is redeemed, removed, or expires, however, it no longer counts against the quota of the source app.
 * 
 * Network files are not supported with this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharedstorageaccessmanager
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class SharedStorageAccessManager extends IInspectable {
;@region Static Methods
    /**
     * Gets the sharing token that enables an app to share the specified file with another app.
     * @remarks
     * When a source app shares a file with a target app, the source app calls the AddFile method to get the sharing token that it passes to the target app.
     * 
     * For a code sample, see [SharedStorageAccessManager](sharedstorageaccessmanager.md).
     * @param {IStorageFile} file_ The file to share with the target app.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharedstorageaccessmanager.addfile
     */
    static AddFile(file_) {
        if (!SharedStorageAccessManager.HasProp("__ISharedStorageAccessManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.SharedStorageAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISharedStorageAccessManagerStatics.IID)
            SharedStorageAccessManager.__ISharedStorageAccessManagerStatics := ISharedStorageAccessManagerStatics(factoryPtr)
        }

        return SharedStorageAccessManager.__ISharedStorageAccessManagerStatics.AddFile(file_)
    }

    /**
     * Gets a file shared by another app by providing the sharing token received from the source app.
     * @remarks
     * When a source app shares a file with a target app, the target app calls the RedeemTokenForFileAsync method to get the shared file.
     * 
     * For a code sample, see [SharedStorageAccessManager](sharedstorageaccessmanager.md).
     * @param {HSTRING} token The sharing token for the shared file.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharedstorageaccessmanager.redeemtokenforfileasync
     */
    static RedeemTokenForFileAsync(token) {
        if (!SharedStorageAccessManager.HasProp("__ISharedStorageAccessManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.SharedStorageAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISharedStorageAccessManagerStatics.IID)
            SharedStorageAccessManager.__ISharedStorageAccessManagerStatics := ISharedStorageAccessManagerStatics(factoryPtr)
        }

        return SharedStorageAccessManager.__ISharedStorageAccessManagerStatics.RedeemTokenForFileAsync(token)
    }

    /**
     * Revokes an existing sharing token.
     * @remarks
     * The source app can optionally call the RemoveFile method to revoke a token that it obtained previously by calling the [AddFile](sharedstorageaccessmanager_addfile_731286892.md) method.
     * @param {HSTRING} token The sharing token to revoke.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharedstorageaccessmanager.removefile
     */
    static RemoveFile(token) {
        if (!SharedStorageAccessManager.HasProp("__ISharedStorageAccessManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.SharedStorageAccessManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISharedStorageAccessManagerStatics.IID)
            SharedStorageAccessManager.__ISharedStorageAccessManagerStatics := ISharedStorageAccessManagerStatics(factoryPtr)
        }

        return SharedStorageAccessManager.__ISharedStorageAccessManagerStatics.RemoveFile(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
