#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StorageProviderKnownFolderSyncInfo.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface that a cloud files provider implements to provide information about the sync status of known folders.
 * @remarks
 * File Explorer obtains an instance of **IStorageProviderKnownFolderSyncInfoSource** for a given provider by calling [GetKnownFolderSyncInfoSource](istorageproviderknownfoldersyncinfosourcefactory_getknownfoldersyncinfosource_1598084472.md).
 * 
 * This interface provides a [KnownFolderSyncInfoChanged](istorageproviderknownfoldersyncinfosource_knownfoldersyncinfochanged.md) event, which the app raises when any property or folder status changes, including the display name. The cloud files provider should not expect **GetKnownFolderSyncInfoSource** to be called immediately after raising the event. File Explorer will only request a new object as it's needed.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderknownfoldersyncinfosource
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderKnownFolderSyncInfoSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderKnownFolderSyncInfoSource
     * @type {Guid}
     */
    static IID => Guid("{51359342-f7c0-53d0-bbb6-1cdc098ebda9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetKnownFolderSyncInfo", "add_KnownFolderSyncInfoChanged", "remove_KnownFolderSyncInfoChanged"]

    /**
     * **GetKnownFolderSyncInfo** is called by File Explorer whenever it needs to get the latest known folder sync status from the cloud files provider.
     * @remarks
     * Once returned, the [StorageProviderKnownFolderSyncInfo](storageproviderknownfoldersyncinfo.md) is considered immutable.
     * 
     * A [SyncRequested](storageproviderknownfoldersyncinfo_syncrequested.md) handler must be set on the returned object to be considered valid and to be displayed in File Explorer.
     * @returns {StorageProviderKnownFolderSyncInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderknownfoldersyncinfosource.getknownfoldersyncinfo
     */
    GetKnownFolderSyncInfo() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderKnownFolderSyncInfo(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<IStorageProviderKnownFolderSyncInfoSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KnownFolderSyncInfoChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_KnownFolderSyncInfoChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
