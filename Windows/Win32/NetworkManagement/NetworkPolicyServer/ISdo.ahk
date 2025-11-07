#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the ISdo interface to store, retrieve, and update Server Data Objects (SDO) information.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/nn-sdoias-isdo
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ISdo extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyInfo", "GetProperty", "PutProperty", "ResetProperty", "Apply", "Restore", "get__NewEnum"]

    /**
     * 
     * @param {Integer} Id 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-getpropertyinfo
     */
    GetPropertyInfo(Id) {
        result := ComCall(7, this, "int", Id, "ptr*", &ppPropertyInfo := 0, "HRESULT")
        return IUnknown(ppPropertyInfo)
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-getproperty
     */
    GetProperty(Id) {
        pValue := VARIANT()
        result := ComCall(8, this, "int", Id, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-putproperty
     */
    PutProperty(Id, pValue) {
        result := ComCall(9, this, "int", Id, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-resetproperty
     */
    ResetProperty(Id) {
        result := ComCall(10, this, "int", Id, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-apply
     */
    Apply() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-restore
     */
    Restore() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdo-get__newenum
     */
    get__NewEnum() {
        result := ComCall(13, this, "ptr*", &ppEnumVARIANT := 0, "HRESULT")
        return IUnknown(ppEnumVARIANT)
    }
}
