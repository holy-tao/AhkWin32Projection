#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemRefresher extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemRefresher
     * @type {Guid}
     */
    static IID => Guid("{14d8250e-d9c2-11d3-b38f-00105a1f473a}")

    /**
     * The class identifier for SWbemRefresher
     * @type {Guid}
     */
    static CLSID => Guid("{d269bf5c-d9c1-11d3-b38f-00105a1f473a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "Add", "AddEnum", "Remove", "Refresh", "get_AutoReconnect", "put_AutoReconnect", "DeleteAll"]

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(pUnk) {
        result := ComCall(7, this, "ptr*", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Pointer<ISWbemRefreshableItem>} objWbemRefreshableItem 
     * @returns {HRESULT} 
     */
    Item(iIndex, objWbemRefreshableItem) {
        result := ComCall(8, this, "int", iIndex, "ptr*", objWbemRefreshableItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} iCount 
     * @returns {HRESULT} 
     */
    get_Count(iCount) {
        result := ComCall(9, this, "int*", iCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISWbemServicesEx} objWbemServices 
     * @param {BSTR} bsInstancePath 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {Pointer<ISWbemRefreshableItem>} objWbemRefreshableItem 
     * @returns {HRESULT} 
     */
    Add(objWbemServices, bsInstancePath, iFlags, objWbemNamedValueSet, objWbemRefreshableItem) {
        bsInstancePath := bsInstancePath is String ? BSTR.Alloc(bsInstancePath).Value : bsInstancePath

        result := ComCall(10, this, "ptr", objWbemServices, "ptr", bsInstancePath, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", objWbemRefreshableItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISWbemServicesEx} objWbemServices 
     * @param {BSTR} bsClassName 
     * @param {Integer} iFlags 
     * @param {IDispatch} objWbemNamedValueSet 
     * @param {Pointer<ISWbemRefreshableItem>} objWbemRefreshableItem 
     * @returns {HRESULT} 
     */
    AddEnum(objWbemServices, bsClassName, iFlags, objWbemNamedValueSet, objWbemRefreshableItem) {
        bsClassName := bsClassName is String ? BSTR.Alloc(bsClassName).Value : bsClassName

        result := ComCall(11, this, "ptr", objWbemServices, "ptr", bsClassName, "int", iFlags, "ptr", objWbemNamedValueSet, "ptr*", objWbemRefreshableItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     */
    Remove(iIndex, iFlags) {
        result := ComCall(12, this, "int", iIndex, "int", iFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     */
    Refresh(iFlags) {
        result := ComCall(13, this, "int", iFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bCount 
     * @returns {HRESULT} 
     */
    get_AutoReconnect(bCount) {
        result := ComCall(14, this, "ptr", bCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bCount 
     * @returns {HRESULT} 
     */
    put_AutoReconnect(bCount) {
        result := ComCall(15, this, "short", bCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAll() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
