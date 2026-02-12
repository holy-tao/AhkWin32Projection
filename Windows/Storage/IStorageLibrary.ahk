#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\StorageFolder.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Foundation\Collections\IObservableVector.ahk
#Include ..\Foundation\EventRegistrationToken.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageLibrary extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageLibrary
     * @type {Guid}
     */
    static IID => Guid("{1edd7103-0e5e-4d6c-b5e8-9318983d6a03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAddFolderAsync", "RequestRemoveFolderAsync", "get_Folders", "get_SaveFolder", "add_DefinitionChanged", "remove_DefinitionChanged"]

    /**
     * @type {IObservableVector<StorageFolder>} 
     */
    Folders {
        get => this.get_Folders()
    }

    /**
     * @type {StorageFolder} 
     */
    SaveFolder {
        get => this.get_SaveFolder()
    }

    /**
     * 
     * @returns {IAsyncOperation<StorageFolder>} 
     */
    RequestAddFolderAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }

    /**
     * 
     * @param {StorageFolder} folder_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestRemoveFolderAsync(folder_) {
        result := ComCall(7, this, "ptr", folder_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IObservableVector<StorageFolder>} 
     */
    get_Folders() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObservableVector(StorageFolder, value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_SaveFolder() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @param {TypedEventHandler<StorageLibrary, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DefinitionChanged(handler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_DefinitionChanged(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(11, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
