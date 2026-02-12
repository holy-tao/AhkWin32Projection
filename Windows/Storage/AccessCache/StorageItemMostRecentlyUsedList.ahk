#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageItemMostRecentlyUsedList.ahk
#Include .\IStorageItemAccessList.ahk
#Include .\IStorageItemMostRecentlyUsedList2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\StorageItemMostRecentlyUsedList.ahk
#Include .\ItemRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents your app's most recently used list (MRU) (obtained from the static [StorageApplicationPermissions.MostRecentlyUsedList](storageapplicationpermissions_mostrecentlyusedlist.md) property). You use your MRU to track items (files and/or folders) that the user has accessed most recently. Items are stored in the MRU as [StorageFile](../windows.storage/storagefile.md) and [StorageFolder](../windows.storage/storagefolder.md) objects.
 * @remarks
 * Use the most recently used (MRU) list to track files and/or locations that your user accesses frequently.
 * 
 * This list can store up to 25 items. While the app must add items to the MRU in order to track them, Windows maintains the 25-item limit by removing stale items if necessary.
 * 
 * > [!NOTE]
 * > If you want to respond to [ItemRemoved](storageitemmostrecentlyusedlist_itemremoved.md) events you must register your event handler every time you get a new reference to the StorageItemMostRecentlyUsedList.
 * 
 * To see more code examples, see the [File picker sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/FilePicker) and the [File access sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/FileAccess).
 * 
 * To learn about using the [FutureAccessList](storageapplicationpermissions_futureaccesslist.md) and [MostRecentlyUsedList](storageapplicationpermissions_mostrecentlyusedlist.md), see [Track recently used files and folders](/windows/uwp/files/how-to-track-recently-used-files-and-folders).
 * 
 * To learn more about what files and locations your app has permission to access, see [File access permissions](/windows/uwp/files/file-access-permissions).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class StorageItemMostRecentlyUsedList extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageItemMostRecentlyUsedList

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageItemMostRecentlyUsedList.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object for retrieving storage items from the most recently used (MRU) list.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.entries
     * @type {AccessListEntryView} 
     */
    Entries {
        get => this.get_Entries()
    }

    /**
     * Gets the maximum number of storage items that the most recently used (MRU) list can contain.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.maximumitemsallowed
     * @type {Integer} 
     */
    MaximumItemsAllowed {
        get => this.get_MaximumItemsAllowed()
    }

    /**
     * Fires when a storage item is removed from the most recently used (MRU) list.
     * @remarks
     * > [!NOTE]
     * > If you want to respond to ItemRemoved events you must register your event handle every time you get a new reference to the [StorageItemMostRecentlyUsedList](storageitemmostrecentlyusedlist.md).
     * @type {TypedEventHandler<StorageItemMostRecentlyUsedList, ItemRemovedEventArgs>}
    */
    OnItemRemoved {
        get {
            if(!this.HasProp("__OnItemRemoved")){
                this.__OnItemRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{029dace8-98d1-5bf7-b780-9717e95027ff}"),
                    StorageItemMostRecentlyUsedList,
                    ItemRemovedEventArgs
                )
                this.__OnItemRemovedToken := this.add_ItemRemoved(this.__OnItemRemoved.iface)
            }
            return this.__OnItemRemoved
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnItemRemovedToken")) {
            this.remove_ItemRemoved(this.__OnItemRemovedToken)
            this.__OnItemRemoved.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<StorageItemMostRecentlyUsedList, ItemRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemRemoved(handler) {
        if (!this.HasProp("__IStorageItemMostRecentlyUsedList")) {
            if ((queryResult := this.QueryInterface(IStorageItemMostRecentlyUsedList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemMostRecentlyUsedList := IStorageItemMostRecentlyUsedList(outPtr)
        }

        return this.__IStorageItemMostRecentlyUsedList.add_ItemRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_ItemRemoved(eventCookie) {
        if (!this.HasProp("__IStorageItemMostRecentlyUsedList")) {
            if ((queryResult := this.QueryInterface(IStorageItemMostRecentlyUsedList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemMostRecentlyUsedList := IStorageItemMostRecentlyUsedList(outPtr)
        }

        return this.__IStorageItemMostRecentlyUsedList.remove_ItemRemoved(eventCookie)
    }

    /**
     * Adds a new storage item and accompanying metadata to the most recently used (MRU) list.
     * @param {IStorageItem} file_ The storage item to add.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.add
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
     * Adds a new storage item and accompanying metadata to the most recently used (MRU) list, specifying the extent of its visibility in the list.
     * @param {IStorageItem} file_ The storage item to add.
     * @param {HSTRING} metadata Optional metadata to associate with the storage item.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.add
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
     * Adds a new storage item to the most recently used (MRU) list, or replaces the specified item if it already exists in the list.
     * @param {HSTRING} token The token associated with the new storage item. If the access list already contains a storage item that has this token, the new item replaces the existing one.
     * @param {IStorageItem} file_ The storage item to add or replace.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.addorreplace
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
     * Adds a new storage item and accompanying metadata to the most recently used (MRU) list, or replaces the specified item if it already exists in the list.
     * @param {HSTRING} token The token associated with the new storage item. If the access list already contains a storage item that has this token, the new item replaces the existing one.
     * @param {IStorageItem} file_ The storage item to add or replace.
     * @param {HSTRING} metadata Optional metadata to associate with the storage item.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.addorreplace
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
     * Retrieves the specified item (like a file or folder) from the most recently used (MRU) list using the specified options.
     * @param {HSTRING} token The token of the item to retrieve.
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.getitemasync
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
     * Retrieves the specified [storageFile](../windows.storage/storagefile.md) from the most recently used (MRU) list using the specified options.
     * @param {HSTRING} token The token of the [storageFile](../windows.storage/storagefile.md) to retrieve.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.getfileasync
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
     * Retrieves the specified [StorageFolder](../windows.storage/storagefolder.md) from the most recently used (MRU) list using the specified options.
     * @param {HSTRING} token The token of the [StorageFolder](../windows.storage/storagefolder.md) to retrieve.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.getfolderasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.getitemasync
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
     * Retrieves the specified [storageFile](../windows.storage/storagefile.md) from the most recently used (MRU) list.
     * @param {HSTRING} token The token of the [storageFile](../windows.storage/storagefile.md) to retrieve.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.getfileasync
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
     * Retrieves the specified [StorageFolder](../windows.storage/storagefolder.md) from the most recently used (MRU) list.
     * @param {HSTRING} token The token of the [StorageFolder](../windows.storage/storagefolder.md) to retrieve.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.getfolderasync
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
     * Removes the specified storage item from the most recently used (MRU) list.
     * @param {HSTRING} token The token of the storage item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.remove
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
     * Determines whether the most recently used (MRU) list contains the specified storage item.
     * @param {HSTRING} token The token of the storage item to look for.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.containsitem
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
     * Removes all storage items from the most recently used (MRU) list.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.clear
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
     * Determines whether the app has access to the specified storage item in the most recently used (MRU) list.
     * @param {IStorageItem} file_ The storage item to check for access.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.checkaccess
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

    /**
     * Adds a new storage item to the most recently used (MRU) list.
     * @param {IStorageItem} file_ The storage item to add.
     * @param {HSTRING} metadata 
     * @param {Integer} visibility_ 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.add
     */
    AddWithMetadataAndVisibility(file_, metadata, visibility_) {
        if (!this.HasProp("__IStorageItemMostRecentlyUsedList2")) {
            if ((queryResult := this.QueryInterface(IStorageItemMostRecentlyUsedList2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemMostRecentlyUsedList2 := IStorageItemMostRecentlyUsedList2(outPtr)
        }

        return this.__IStorageItemMostRecentlyUsedList2.AddWithMetadataAndVisibility(file_, metadata, visibility_)
    }

    /**
     * Adds a new storage item and accompanying metadata to the most recently used (MRU) list, or replaces the specified item if it already exists in the list. Also specifies the extent of its visibility in the list.
     * @param {HSTRING} token The token associated with the new storage item. If the access list already contains a storage item that has this token, the new item replaces the existing one.
     * @param {IStorageItem} file_ The storage item to add or replace.
     * @param {HSTRING} metadata Optional metadata to associate with the storage item.
     * @param {Integer} visibility_ The extent of the visibility of the storage item in the list.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageitemmostrecentlyusedlist.addorreplace
     */
    AddOrReplaceWithMetadataAndVisibility(token, file_, metadata, visibility_) {
        if (!this.HasProp("__IStorageItemMostRecentlyUsedList2")) {
            if ((queryResult := this.QueryInterface(IStorageItemMostRecentlyUsedList2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemMostRecentlyUsedList2 := IStorageItemMostRecentlyUsedList2(outPtr)
        }

        return this.__IStorageItemMostRecentlyUsedList2.AddOrReplaceWithMetadataAndVisibility(token, file_, metadata, visibility_)
    }

;@endregion Instance Methods
}
