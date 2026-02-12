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
class IDownloadsFolderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadsFolderStatics
     * @type {Guid}
     */
    static IID => Guid("{27862ed0-404e-47df-a1e2-e37308be7b37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFileAsync", "CreateFolderAsync", "CreateFileWithCollisionOptionAsync", "CreateFolderWithCollisionOptionAsync"]

    /**
     * 
     * @param {HSTRING} desiredName 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    CreateFileAsync(desiredName) {
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
     * 
     * @param {HSTRING} desiredName 
     * @returns {IAsyncOperation<StorageFolder>} 
     */
    CreateFolderAsync(desiredName) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(7, this, "ptr", desiredName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }

    /**
     * 
     * @param {HSTRING} desiredName 
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    CreateFileWithCollisionOptionAsync(desiredName, option) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(8, this, "ptr", desiredName, "int", option, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }

    /**
     * 
     * @param {HSTRING} desiredName 
     * @param {Integer} option 
     * @returns {IAsyncOperation<StorageFolder>} 
     */
    CreateFolderWithCollisionOptionAsync(desiredName, option) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(9, this, "ptr", desiredName, "int", option, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }
}
