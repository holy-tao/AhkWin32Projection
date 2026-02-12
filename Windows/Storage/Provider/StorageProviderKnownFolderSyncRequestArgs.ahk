#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderKnownFolderSyncRequestArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * The arguments that are provided to a [StorageProviderKnownFolderSyncRequestedHandler](storageproviderknownfoldersyncrequestedhandler.md) delegate when a sync operation is requested for a known folder.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfoldersyncrequestargs
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderKnownFolderSyncRequestArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderKnownFolderSyncRequestArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderKnownFolderSyncRequestArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A list of IDs of the known folders that are being synced.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfoldersyncrequestargs.knownfolders
     * @type {IVectorView<Guid>} 
     */
    KnownFolders {
        get => this.get_KnownFolders()
    }

    /**
     * The [StorageFolder](../Windows.Storage/storagefolder.md) that represents the folder that is being synced.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfoldersyncrequestargs.source
     * @type {StorageFolder} 
     */
    Source {
        get => this.get_Source()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<Guid>} 
     */
    get_KnownFolders() {
        if (!this.HasProp("__IStorageProviderKnownFolderSyncRequestArgs")) {
            if ((queryResult := this.QueryInterface(IStorageProviderKnownFolderSyncRequestArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderKnownFolderSyncRequestArgs := IStorageProviderKnownFolderSyncRequestArgs(outPtr)
        }

        return this.__IStorageProviderKnownFolderSyncRequestArgs.get_KnownFolders()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_Source() {
        if (!this.HasProp("__IStorageProviderKnownFolderSyncRequestArgs")) {
            if ((queryResult := this.QueryInterface(IStorageProviderKnownFolderSyncRequestArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderKnownFolderSyncRequestArgs := IStorageProviderKnownFolderSyncRequestArgs(outPtr)
        }

        return this.__IStorageProviderKnownFolderSyncRequestArgs.get_Source()
    }

;@endregion Instance Methods
}
