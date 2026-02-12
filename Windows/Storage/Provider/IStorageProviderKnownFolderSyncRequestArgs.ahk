#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\StorageFolder.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderKnownFolderSyncRequestArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderKnownFolderSyncRequestArgs
     * @type {Guid}
     */
    static IID => Guid("{eda6d569-b4e8-542f-ab8d-f3613f250a4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KnownFolders", "get_Source"]

    /**
     * @type {IVectorView<Guid>} 
     */
    KnownFolders {
        get => this.get_KnownFolders()
    }

    /**
     * @type {StorageFolder} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * 
     * @returns {IVectorView<Guid>} 
     */
    get_KnownFolders() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetGuid(), value)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_Source() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }
}
