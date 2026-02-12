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
class IStorageApplicationPermissionsStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageApplicationPermissionsStatics2
     * @type {Guid}
     */
    static IID => Guid("{072716ec-aa05-4294-9a11-1a3d04519ad0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFutureAccessListForUser", "GetMostRecentlyUsedListForUser"]

    /**
     * 
     * @param {User} user_ 
     * @returns {StorageItemAccessList} 
     */
    GetFutureAccessListForUser(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageItemAccessList(value)
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {StorageItemMostRecentlyUsedList} 
     */
    GetMostRecentlyUsedListForUser(user_) {
        result := ComCall(7, this, "ptr", user_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageItemMostRecentlyUsedList(value)
    }
}
