#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderKnownFolderSyncInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * The **StorageProviderKnownFolderSyncInfo** class encapsulates all the information relevant to the provider’s backup/sync capability and status.
 * @remarks
 * **StorageProviderKnownFolderSyncInfo** lets the provider specify a friendly name and status for known folders. Once the object is returned by [GetKnownFolderSyncInfoSource](istorageproviderknownfoldersyncinfosourcefactory_getknownfoldersyncinfosource_1598084472.md) it should be considered immutable. Changing a property on the object after it has been returned could result in undefined behavior. To update any property on **StorageProviderKnownFolderSyncInfo**, the cloud files provider should raise the [KnownFolderSyncInfoChanged](istorageproviderknownfoldersyncinfosource_knownfoldersyncinfochanged.md) event on [IStorageProviderKnownFolderSyncInfoSource](istorageproviderknownfoldersyncinfosource.md) and be ready to provide a new **StorageProviderKnownFolderSyncInfo** object.
 * 
 * Any missing property or invalid Uri on the **StorageProviderKnownFolderSyncInfo** will result in the enrollment button not being shown for this provider.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfoldersyncinfo
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderKnownFolderSyncInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderKnownFolderSyncInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderKnownFolderSyncInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The friendly name of the provider.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfoldersyncinfo.providerdisplayname
     * @type {HSTRING} 
     */
    ProviderDisplayName {
        get => this.get_ProviderDisplayName()
        set => this.put_ProviderDisplayName(value)
    }

    /**
     * The list of known folders that are registered with the provider.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfoldersyncinfo.knownfolderentries
     * @type {IVector<StorageProviderKnownFolderEntry>} 
     */
    KnownFolderEntries {
        get => this.get_KnownFolderEntries()
    }

    /**
     * The **SyncRequested** event is raised when the user requests a sync operation on a known folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfoldersyncinfo.syncrequested
     * @type {StorageProviderKnownFolderSyncRequestedHandler} 
     */
    SyncRequested {
        get => this.get_SyncRequested()
        set => this.put_SyncRequested(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of [StorageProviderKnownFolderSyncInfo](storageproviderknownfoldersyncinfo.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderKnownFolderSyncInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderDisplayName() {
        if (!this.HasProp("__IStorageProviderKnownFolderSyncInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderKnownFolderSyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderKnownFolderSyncInfo := IStorageProviderKnownFolderSyncInfo(outPtr)
        }

        return this.__IStorageProviderKnownFolderSyncInfo.get_ProviderDisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ProviderDisplayName(value) {
        if (!this.HasProp("__IStorageProviderKnownFolderSyncInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderKnownFolderSyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderKnownFolderSyncInfo := IStorageProviderKnownFolderSyncInfo(outPtr)
        }

        return this.__IStorageProviderKnownFolderSyncInfo.put_ProviderDisplayName(value)
    }

    /**
     * 
     * @returns {IVector<StorageProviderKnownFolderEntry>} 
     */
    get_KnownFolderEntries() {
        if (!this.HasProp("__IStorageProviderKnownFolderSyncInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderKnownFolderSyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderKnownFolderSyncInfo := IStorageProviderKnownFolderSyncInfo(outPtr)
        }

        return this.__IStorageProviderKnownFolderSyncInfo.get_KnownFolderEntries()
    }

    /**
     * 
     * @returns {StorageProviderKnownFolderSyncRequestedHandler} 
     */
    get_SyncRequested() {
        if (!this.HasProp("__IStorageProviderKnownFolderSyncInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderKnownFolderSyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderKnownFolderSyncInfo := IStorageProviderKnownFolderSyncInfo(outPtr)
        }

        return this.__IStorageProviderKnownFolderSyncInfo.get_SyncRequested()
    }

    /**
     * 
     * @param {StorageProviderKnownFolderSyncRequestedHandler} value 
     * @returns {HRESULT} 
     */
    put_SyncRequested(value) {
        if (!this.HasProp("__IStorageProviderKnownFolderSyncInfo")) {
            if ((queryResult := this.QueryInterface(IStorageProviderKnownFolderSyncInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderKnownFolderSyncInfo := IStorageProviderKnownFolderSyncInfo(outPtr)
        }

        return this.__IStorageProviderKnownFolderSyncInfo.put_SyncRequested(value)
    }

;@endregion Instance Methods
}
