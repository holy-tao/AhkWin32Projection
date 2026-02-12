#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderKnownFolderEntry.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a known folder that is registered with the provider.
 * @remarks
 * Use this class to get information about a known folder that is registered with the provider, including its current sync status.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfolderentry
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderKnownFolderEntry extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderKnownFolderEntry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderKnownFolderEntry.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A Guid representing the identifier of the known folder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfolderentry.knownfolderid
     * @type {Guid} 
     */
    KnownFolderId {
        get => this.get_KnownFolderId()
        set => this.put_KnownFolderId(value)
    }

    /**
     * The [StorageProviderKnownFolderSyncStatus](storageproviderknownfoldersyncstatus.md) of the known folder.
     * @remarks
     * The three possible states are:
     * 
     * - **Available**: A specific known folder is eligible to be backed up by the cloud files provider and is not already enrolled or enrolling.
     * - **Enrolling**: A cloud files provider started the process of enrolling a known folder. Typically, this represents the time during which files are moved from the known folder to the storage provider’s root and the known folder redirection is applied.
     * - **Enrolled**: A specific folder is already backed up by the cloud files provider.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderknownfolderentry.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of a [StorageProviderKnownFolderEntry](storageproviderknownfolderentry.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderKnownFolderEntry")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_KnownFolderId() {
        if (!this.HasProp("__IStorageProviderKnownFolderEntry")) {
            if ((queryResult := this.QueryInterface(IStorageProviderKnownFolderEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderKnownFolderEntry := IStorageProviderKnownFolderEntry(outPtr)
        }

        return this.__IStorageProviderKnownFolderEntry.get_KnownFolderId()
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_KnownFolderId(value) {
        if (!this.HasProp("__IStorageProviderKnownFolderEntry")) {
            if ((queryResult := this.QueryInterface(IStorageProviderKnownFolderEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderKnownFolderEntry := IStorageProviderKnownFolderEntry(outPtr)
        }

        return this.__IStorageProviderKnownFolderEntry.put_KnownFolderId(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IStorageProviderKnownFolderEntry")) {
            if ((queryResult := this.QueryInterface(IStorageProviderKnownFolderEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderKnownFolderEntry := IStorageProviderKnownFolderEntry(outPtr)
        }

        return this.__IStorageProviderKnownFolderEntry.get_Status()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IStorageProviderKnownFolderEntry")) {
            if ((queryResult := this.QueryInterface(IStorageProviderKnownFolderEntry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderKnownFolderEntry := IStorageProviderKnownFolderEntry(outPtr)
        }

        return this.__IStorageProviderKnownFolderEntry.put_Status(value)
    }

;@endregion Instance Methods
}
