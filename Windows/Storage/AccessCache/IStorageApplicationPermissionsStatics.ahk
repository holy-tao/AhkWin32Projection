#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StorageItemAccessList.ahk
#Include .\StorageItemMostRecentlyUsedList.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class IStorageApplicationPermissionsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageApplicationPermissionsStatics
     * @type {Guid}
     */
    static IID => Guid("{4391dfaa-d033-48f9-8060-3ec847d2e3f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FutureAccessList", "get_MostRecentlyUsedList"]

    /**
     * @type {StorageItemAccessList} 
     */
    FutureAccessList {
        get => this.get_FutureAccessList()
    }

    /**
     * @type {StorageItemMostRecentlyUsedList} 
     */
    MostRecentlyUsedList {
        get => this.get_MostRecentlyUsedList()
    }

    /**
     * 
     * @returns {StorageItemAccessList} 
     */
    get_FutureAccessList() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageItemAccessList(value)
    }

    /**
     * 
     * @returns {StorageItemMostRecentlyUsedList} 
     */
    get_MostRecentlyUsedList() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageItemMostRecentlyUsedList(value)
    }
}
