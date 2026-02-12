#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageItemAccessList.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents your app's future-access list (obtained from the static [StorageApplicationPermissions.FutureAccessList](storageapplicationpermissions_futureaccesslist.md) property). By picking files and folders, your user grants your app permission to access items that might not be accessible otherwise. If you add these items to your future-access list then you'll retain that permission when your app wants to access those items again later. Items are stored in the future-access list as [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md) objects.
 * @remarks
 * Use this future-access list to preserve access to files and locations that may not be included with the accessible locations specified by the capabilities in your app manifest. For example, if your app uses a file picker to access a file (or location), we recommend that you store the [StorageFile](../windows.storage/storagefile.md) that is returned from the file picker in this future-access list.
 * 
 * This list can store up to 1000 items and must be maintained by the app.
 * 
 * To see more code examples, see the [File picker sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/FilePicker) and the [File access sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/FileAccess).
 * 
 * To learn about using the [FutureAccessList](storageapplicationpermissions_futureaccesslist.md) and [MostRecentlyUsedList](storageapplicationpermissions_mostrecentlyusedlist.md), see [Track recently used files and folders](/windows/uwp/files/how-to-track-recently-used-files-and-folders).
 * 
 * To learn more about what files and locations your app has permission to access, see [File access permissions](/windows/uwp/files/file-access-permissions).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class StorageItemAccessList extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageItemAccessList

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageItemAccessList.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object for retrieving storage items from the access list.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.entries
     * @type {AccessListEntryView} 
     */
    Entries {
        get => this.get_Entries()
    }

    /**
     * Gets the maximum number of storage items that the access list can contain.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.maximumitemsallowed
     * @type {Integer} 
     */
    MaximumItemsAllowed {
        get => this.get_MaximumItemsAllowed()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Adds a new storage item and accompanying metadata to the access list.
     * @param {IStorageItem} file_ The storage item to add.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.add
     */
    AddOverloadDefaultMetadata(file_) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.AddOverloadDefaultMetadata(file_)
    }

    /**
     * Adds a new storage item to the access list.
     * @param {IStorageItem} file_ The storage item to add.
     * @param {HSTRING} metadata 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.add
     */
    Add(file_, metadata) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.Add1(file_, metadata)
    }

    /**
     * Adds a new storage item to the access list, or replaces the specified item if it already exists in the list.
     * @param {HSTRING} token The token associated with the new storage item. If the access list already contains a storage item that has this token, the new item replaces the existing one.
     * @param {IStorageItem} file_ The storage item to add or replace.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.addorreplace
     */
    AddOrReplaceOverloadDefaultMetadata(token, file_) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.AddOrReplaceOverloadDefaultMetadata(token, file_)
    }

    /**
     * Adds a new storage item and accompanying metadata to the access list, or replaces the specified item if it already exists in the list.
     * @param {HSTRING} token A token that the app can use later to retrieve this storage item.
     * @param {IStorageItem} file_ The storage item to add or replace.
     * @param {HSTRING} metadata Optional metadata to associate with the storage item.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.addorreplace
     */
    AddOrReplace(token, file_, metadata) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.AddOrReplace1(token, file_, metadata)
    }

    /**
     * Retrieves the specified item (like a file or folder) from the list using the specified options.
     * @param {HSTRING} token The token of the item to retrieve.
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.getitemasync
     */
    GetItemAsync(token) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.GetItemAsync(token)
    }

    /**
     * Retrieves the [StorageFile](../windows.storage/storagefile.md) from the list using the specified options.
     * @param {HSTRING} token The token of the [StorageFile](../windows.storage/storagefile.md) to retrieve.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.getfileasync
     */
    GetFileAsync(token) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.GetFileAsync(token)
    }

    /**
     * Retrieves the specified [StorageFolder](../windows.storage/storagefolder.md) from the list using the specified options.
     * @param {HSTRING} token The token of the [StorageFolder](../windows.storage/storagefolder.md) to retrieve.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.getfolderasync
     */
    GetFolderAsync(token) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.GetFolderAsync(token)
    }

    /**
     * Retrieves the specified item (like a file or folder) from the most recently used (MRU) list.
     * @param {HSTRING} token The token of the item to retrieve.
     * @param {Integer} options 
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.getitemasync
     */
    GetItemWithOptionsAsync(token, options) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.GetItemWithOptionsAsync(token, options)
    }

    /**
     * Retrieves the specified [StorageFile](../windows.storage/storagefile.md) from the list.
     * @param {HSTRING} token The token of the [StorageFile](../windows.storage/storagefile.md) to retrieve.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.getfileasync
     */
    GetFileWithOptionsAsync(token, options) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.GetFileWithOptionsAsync(token, options)
    }

    /**
     * Retrieves the specified [StorageFolder](../windows.storage/storagefolder.md) from the list.
     * @param {HSTRING} token The token of the [StorageFolder](../windows.storage/storagefolder.md) to retrieve.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.getfolderasync
     */
    GetFolderWithOptionsAsync(token, options) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.GetFolderWithOptionsAsync(token, options)
    }

    /**
     * Removes the specified storage item from the access list.
     * @param {HSTRING} token The token of the storage item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.remove
     */
    Remove(token) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.Remove(token)
    }

    /**
     * Determines whether the access list contains the specified storage item.
     * @param {HSTRING} token The token of the storage item to look for.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.containsitem
     */
    ContainsItem(token) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.ContainsItem(token)
    }

    /**
     * Removes all storage items from the access list.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.clear
     */
    Clear() {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.Clear()
    }

    /**
     * Determines whether the app has access to the specified storage item in the access list.
     * @param {IStorageItem} file_ The storage item to check for access.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemaccesslist.checkaccess
     */
    CheckAccess(file_) {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.CheckAccess(file_)
    }

    /**
     * 
     * @returns {AccessListEntryView} 
     */
    get_Entries() {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.get_Entries()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaximumItemsAllowed() {
        if (!this.HasProp("__IStorageItemAccessList")) {
            if ((queryResult := this.QueryInterface(IStorageItemAccessList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemAccessList := IStorageItemAccessList(outPtr)
        }

        return this.__IStorageItemAccessList.get_MaximumItemsAllowed()
    }

;@endregion Instance Methods
}
