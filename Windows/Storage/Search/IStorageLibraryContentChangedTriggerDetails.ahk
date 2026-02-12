#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\StorageFolder.ahk
#Include .\StorageItemQueryResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IStorageLibraryContentChangedTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageLibraryContentChangedTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{2a371977-abbf-4e1d-8aa5-6385d8884799}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Folder", "CreateModifiedSinceQuery"]

    /**
     * @type {StorageFolder} 
     */
    Folder {
        get => this.get_Folder()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_Folder() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }

    /**
     * 
     * @param {DateTime} lastQueryTime 
     * @returns {StorageItemQueryResult} 
     */
    CreateModifiedSinceQuery(lastQueryTime) {
        result := ComCall(7, this, "ptr", lastQueryTime, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageItemQueryResult(result_)
    }
}
