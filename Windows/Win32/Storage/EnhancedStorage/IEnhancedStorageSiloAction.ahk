#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface as a point of access for actions involving IEEE 1667 silos.
 * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nn-ehstorapi-ienhancedstoragesiloaction
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class IEnhancedStorageSiloAction extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnhancedStorageSiloAction
     * @type {Guid}
     */
    static IID => Guid("{b6f7f311-206f-4ff8-9c4b-27efee77a86f}")

    /**
     * The class identifier for EnhancedStorageSiloAction
     * @type {Guid}
     */
    static CLSID => Guid("{886d29dd-b506-466b-9fbf-b44ff383fb3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetDescription", "Invoke"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstoragesiloaction-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppwszActionName := 0, "HRESULT")
        return ppwszActionName
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstoragesiloaction-getdescription
     */
    GetDescription() {
        result := ComCall(4, this, "ptr*", &ppwszActionDescription := 0, "HRESULT")
        return ppwszActionDescription
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/nf-ehstorapi-ienhancedstoragesiloaction-invoke
     */
    Invoke() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
