#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\StorageFile.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\StorageFolder.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IDownloadsFolderStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadsFolderStatics2
     * @type {Guid}
     */
    static IID => Guid("{e93045bd-8ef8-4f8e-8d15-ac0e265f390d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFileForUserAsync", "CreateFolderForUserAsync", "CreateFileForUserWithCollisionOptionAsync", "CreateFolderForUserWithCollisionOptionAsync"]

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} desiredName 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    CreateFileForUserAsync(user_, desiredName) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(6, this, "ptr", user_, "ptr", desiredName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} desiredName 
     * @returns {IAsyncOperation<StorageFolder>} 
     */
    CreateFolderForUserAsync(user_, desiredName) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(7, this, "ptr", user_, "ptr", desiredName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} desiredName 
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    CreateFileForUserWithCollisionOptionAsync(user_, desiredName, option) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(8, this, "ptr", user_, "ptr", desiredName, "int", option, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} desiredName 
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFolder>} 
     */
    CreateFolderForUserWithCollisionOptionAsync(user_, desiredName, option) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(9, this, "ptr", user_, "ptr", desiredName, "int", option, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }
}
