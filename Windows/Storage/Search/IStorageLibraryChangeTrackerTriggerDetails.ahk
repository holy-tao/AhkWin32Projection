#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\StorageFolder.ahk
#Include ..\StorageLibraryChangeTracker.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IStorageLibraryChangeTrackerTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageLibraryChangeTrackerTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{1dc7a369-b7a3-4df2-9d61-eba85a0343d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Folder", "get_ChangeTracker"]

    /**
     * @type {StorageFolder} 
     */
    Folder {
        get => this.get_Folder()
    }

    /**
     * @type {StorageLibraryChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
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
     * @returns {StorageLibraryChangeTracker} 
     */
    get_ChangeTracker() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageLibraryChangeTracker(value)
    }
}
