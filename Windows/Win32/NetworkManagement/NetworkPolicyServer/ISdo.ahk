#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the ISdo interface to store, retrieve, and update Server Data Objects (SDO) information.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/nn-sdoias-isdo
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ISdo extends IDispatch{
    /**
     * The interface identifier for ISdo
     * @type {Guid}
     */
    static IID => Guid("{56bc53de-96db-11d1-bf3f-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<IUnknown>} ppPropertyInfo 
     * @returns {HRESULT} 
     */
    GetPropertyInfo(Id, ppPropertyInfo) {
        result := ComCall(7, this, "int", Id, "ptr", ppPropertyInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     */
    GetProperty(Id, pValue) {
        result := ComCall(8, this, "int", Id, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     */
    PutProperty(Id, pValue) {
        result := ComCall(9, this, "int", Id, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {HRESULT} 
     */
    ResetProperty(Id) {
        result := ComCall(10, this, "int", Id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Apply() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Restore() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnumVARIANT 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppEnumVARIANT) {
        result := ComCall(13, this, "ptr", ppEnumVARIANT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
