#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include .\StorageFolder.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IKnownFoldersStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownFoldersStatics4
     * @type {Guid}
     */
    static IID => Guid("{1722e6bf-9ff9-4b21-bed5-90ecb13a192e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessAsync", "RequestAccessForUserAsync", "GetFolderAsync"]

    /**
     * 
     * @param {Integer} folderId 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync(folderId) {
        result := ComCall(6, this, "int", folderId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {Integer} folderId 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessForUserAsync(user_, folderId) {
        result := ComCall(7, this, "ptr", user_, "int", folderId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Integer} folderId 
     * @returns {IAsyncOperation<StorageFolder>} 
     */
    GetFolderAsync(folderId) {
        result := ComCall(8, this, "int", folderId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }
}
