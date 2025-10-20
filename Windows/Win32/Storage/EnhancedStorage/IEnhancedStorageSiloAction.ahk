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
     * 
     * @param {Pointer<PWSTR>} ppwszActionName 
     * @returns {HRESULT} 
     */
    GetName(ppwszActionName) {
        result := ComCall(3, this, "ptr", ppwszActionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszActionDescription 
     * @returns {HRESULT} 
     */
    GetDescription(ppwszActionDescription) {
        result := ComCall(4, this, "ptr", ppwszActionDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Invoke() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
