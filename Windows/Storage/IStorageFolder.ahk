#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\StorageFile.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\StorageFolder.ahk
#Include .\IStorageItem.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Manipulates folders and their contents, and provides information about them.
  * 
  * 
  * 
  * > > [!IMPORTANT]
  * > If you simply want to work with folders in your app, see the [StorageFolder](storagefolder.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageFolder extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFolder
     * @type {Guid}
     */
    static IID => Guid("{72d1cb78-b3ef-4f75-a80b-6fd9dae2944b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFileAsyncOverloadDefaultOptions", "CreateFileAsync1", "CreateFolderAsyncOverloadDefaultOptions", "CreateFolderAsync1", "GetFileAsync", "GetFolderAsync", "GetItemAsync", "GetFilesAsyncOverloadDefaultOptionsStartAndCount", "GetFoldersAsyncOverloadDefaultOptionsStartAndCount", "GetItemsAsyncOverloadDefaultStartAndCount"]

    /**
     * Creates a new file in the current folder, and specifies what to do if a file with the same name already exists in the current folder.
     * @param {HSTRING} desiredName The desired name of the file to create.
     * 
     * If there is an existing file in the current folder that already has the specified *desiredName*, the specified [CreationCollisionOption](creationcollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder.createfileasync
     */
    CreateFileAsyncOverloadDefaultOptions(desiredName) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(6, this, "ptr", desiredName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * Creates a new file in the current folder.
     * @param {HSTRING} desiredName The desired name of the file to create.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder.createfileasync
     */
    CreateFileAsync1(desiredName, options) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(7, this, "ptr", desiredName, "int", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * Creates a new folder in the current folder, and specifies what to do if a folder with the same name already exists in the current folder.
     * @param {HSTRING} desiredName The desired name of the folder to create.
     * 
     * If there is an existing folder in the current folder that already has the specified *desiredName*, the specified [CreationCollisionOption](creationcollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder.createfolderasync
     */
    CreateFolderAsyncOverloadDefaultOptions(desiredName) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(8, this, "ptr", desiredName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }

    /**
     * Creates a new folder in the current folder.
     * @param {HSTRING} desiredName The desired name of the folder to create.
     * @param {Integer} options 
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder.createfolderasync
     */
    CreateFolderAsync1(desiredName, options) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(9, this, "ptr", desiredName, "int", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }

    /**
     * Gets the specified file from the current folder.
     * @param {HSTRING} name The name (or path relative to the current folder) of the file to retrieve.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder.getfileasync
     */
    GetFileAsync(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(10, this, "ptr", name, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * Gets the specified folder from the current folder.
     * @param {HSTRING} name The name of the child folder to retrieve.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder.getfolderasync
     */
    GetFolderAsync(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(11, this, "ptr", name, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }

    /**
     * Gets the specified item from the [IStorageFolder](istoragefolder.md).
     * @param {HSTRING} name The name of the item to retrieve.
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder.getitemasync
     */
    GetItemAsync(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(12, this, "ptr", name, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IStorageItem, operation)
    }

    /**
     * Gets the files from the current folder.
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder.getfilesasync
     */
    GetFilesAsyncOverloadDefaultOptionsStartAndCount() {
        result := ComCall(13, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageFile), operation)
    }

    /**
     * Gets the folders in the current folder.
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder.getfoldersasync
     */
    GetFoldersAsyncOverloadDefaultOptionsStartAndCount() {
        result := ComCall(14, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorageFolder), operation)
    }

    /**
     * Gets the items from the current folder.
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder.getitemsasync
     */
    GetItemsAsyncOverloadDefaultStartAndCount() {
        result := ComCall(15, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IStorageItem), operation)
    }
}
