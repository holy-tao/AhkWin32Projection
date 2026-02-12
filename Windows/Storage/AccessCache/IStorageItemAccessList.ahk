#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\IStorageItem.ahk
#Include ..\StorageFile.ahk
#Include ..\StorageFolder.ahk
#Include .\AccessListEntryView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a list of storage items that the app has stored for efficient future access.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class IStorageItemAccessList extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItemAccessList
     * @type {Guid}
     */
    static IID => Guid("{2caff6ad-de90-47f5-b2c3-dd36c9fdd453}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddOverloadDefaultMetadata", "Add1", "AddOrReplaceOverloadDefaultMetadata", "AddOrReplace1", "GetItemAsync", "GetFileAsync", "GetFolderAsync", "GetItemWithOptionsAsync", "GetFileWithOptionsAsync", "GetFolderWithOptionsAsync", "Remove", "ContainsItem", "Clear", "CheckAccess", "get_Entries", "get_MaximumItemsAllowed"]

    /**
     * Gets an object for retrieving storage items from the access list.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.entries
     * @type {AccessListEntryView} 
     */
    Entries {
        get => this.get_Entries()
    }

    /**
     * Gets the maximum number of storage items that the access list can contain.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.maximumitemsallowed
     * @type {Integer} 
     */
    MaximumItemsAllowed {
        get => this.get_MaximumItemsAllowed()
    }

    /**
     * Adds a new storage item and accompanying metadata to the access list.
     * @param {IStorageItem} file_ The storage item to add.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.add
     */
    AddOverloadDefaultMetadata(file_) {
        token := HSTRING()
        result := ComCall(6, this, "ptr", file_, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * Adds a new storage item to the access list.
     * @param {IStorageItem} file_ The storage item to add.
     * @param {HSTRING} metadata 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.add
     */
    Add1(file_, metadata) {
        if(metadata is String) {
            pin := HSTRING.Create(metadata)
            metadata := pin.Value
        }
        metadata := metadata is Win32Handle ? NumGet(metadata, "ptr") : metadata

        token := HSTRING()
        result := ComCall(7, this, "ptr", file_, "ptr", metadata, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * Adds a new storage item to the access list, or replaces the specified item if it already exists in the list.
     * @param {HSTRING} token The token associated with the new storage item. If the access list already contains a storage item that has this token, the new item replaces the existing one.
     * @param {IStorageItem} file_ The storage item to add or replace.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.addorreplace
     */
    AddOrReplaceOverloadDefaultMetadata(token, file_) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "ptr", file_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a new storage item and accompanying metadata to the access list, or replaces the specified item if it already exists in the list.
     * @param {HSTRING} token The token associated with the new storage item. If the access list already contains a storage item that has this token, the new item replaces the existing one.
     * @param {IStorageItem} file_ The storage item to add or replace.
     * @param {HSTRING} metadata Optional metadata to associate with the storage item.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.addorreplace
     */
    AddOrReplace1(token, file_, metadata) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token
        if(metadata is String) {
            pin := HSTRING.Create(metadata)
            metadata := pin.Value
        }
        metadata := metadata is Win32Handle ? NumGet(metadata, "ptr") : metadata

        result := ComCall(9, this, "ptr", token, "ptr", file_, "ptr", metadata, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the specified item (like a file or folder) from the list using the specified options.
     * @param {HSTRING} token The token of the item to retrieve.
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.getitemasync
     */
    GetItemAsync(token) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IStorageItem, operation)
    }

    /**
     * Retrieves the specified [StorageFile](../windows.storage/storagefile.md) from the list using the specified options.
     * @param {HSTRING} token The token of the [StorageFile](../windows.storage/storagefile.md) to retrieve.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.getfileasync
     */
    GetFileAsync(token) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * Retrieves the specified [StorageFolder](../windows.storage/storagefolder.md) from the list using the specified options.
     * @param {HSTRING} token The token of the [StorageFolder](../windows.storage/storagefolder.md) to retrieve.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.getfolderasync
     */
    GetFolderAsync(token) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }

    /**
     * Retrieves the specified item (like a file or folder) from the list.
     * @param {HSTRING} token The token of the item to retrieve.
     * @param {Integer} options 
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.getitemasync
     */
    GetItemWithOptionsAsync(token, options) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IStorageItem, operation)
    }

    /**
     * Retrieves the specified [StorageFile](../windows.storage/storagefile.md) from the list.
     * @param {HSTRING} token The token of the [StorageFile](../windows.storage/storagefile.md) to retrieve.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.getfileasync
     */
    GetFileWithOptionsAsync(token, options) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * Retrieves the specified [StorageFolder](../windows.storage/storagefolder.md) from the list.
     * @param {HSTRING} token The token of the [StorageFolder](../windows.storage/storagefolder.md) to retrieve.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.getfolderasync
     */
    GetFolderWithOptionsAsync(token, options) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "uint", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }

    /**
     * Removes the specified storage item from the access list.
     * @param {HSTRING} token The token of the storage item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.remove
     */
    Remove(token) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the access list contains the specified storage item.
     * @param {HSTRING} token The token of the storage item to look for.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.containsitem
     */
    ContainsItem(token) {
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Removes all storage items from the access list.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.clear
     */
    Clear() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the app has access to the specified storage item in the access list.
     * @param {IStorageItem} file_ The storage item to check for access.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.istorageitemaccesslist.checkaccess
     */
    CheckAccess(file_) {
        result := ComCall(19, this, "ptr", file_, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AccessListEntryView} 
     */
    get_Entries() {
        result := ComCall(20, this, "ptr*", &entries := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AccessListEntryView(entries)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaximumItemsAllowed() {
        result := ComCall(21, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
