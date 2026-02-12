#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\StorageFolder.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IApplicationData3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationData3
     * @type {Guid}
     */
    static IID => Guid("{dc222cf4-2772-4c1d-aa2c-c9f743ade8d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPublisherCacheFolder", "ClearPublisherCacheFolderAsync", "get_SharedLocalFolder"]

    /**
     * @type {StorageFolder} 
     */
    SharedLocalFolder {
        get => this.get_SharedLocalFolder()
    }

    /**
     * 
     * @param {HSTRING} folderName 
     * @returns {StorageFolder} 
     */
    GetPublisherCacheFolder(folderName) {
        if(folderName is String) {
            pin := HSTRING.Create(folderName)
            folderName := pin.Value
        }
        folderName := folderName is Win32Handle ? NumGet(folderName, "ptr") : folderName

        result := ComCall(6, this, "ptr", folderName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @param {HSTRING} folderName 
     * @returns {IAsyncAction} 
     */
    ClearPublisherCacheFolderAsync(folderName) {
        if(folderName is String) {
            pin := HSTRING.Create(folderName)
            folderName := pin.Value
        }
        folderName := folderName is Win32Handle ? NumGet(folderName, "ptr") : folderName

        result := ComCall(7, this, "ptr", folderName, "ptr*", &clearOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(clearOperation)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_SharedLocalFolder() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }
}
