#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemNamedValueSet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemNamedValueSet
     * @type {Guid}
     */
    static IID => Guid("{cf2376ea-ce8c-11d1-8b05-00600806d9b6}")

    /**
     * The class identifier for SWbemNamedValueSet
     * @type {Guid}
     */
    static CLSID => Guid("{9aed384e-ce8b-11d1-8b05-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "Add", "Remove", "Clone", "DeleteAll"]

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
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemNamedValue>} objWbemNamedValue 
     * @returns {HRESULT} 
     */
    Item(strName, iFlags, objWbemNamedValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "int", iFlags, "ptr*", objWbemNamedValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} iCount 
     * @returns {HRESULT} 
     */
    get_Count(iCount) {
        iCountMarshal := iCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, iCountMarshal, iCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT>} varValue 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemNamedValue>} objWbemNamedValue 
     * @returns {HRESULT} 
     */
    Add(strName, varValue, iFlags, objWbemNamedValue) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(10, this, "ptr", strName, "ptr", varValue, "int", iFlags, "ptr*", objWbemNamedValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     */
    Remove(strName, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(11, this, "ptr", strName, "int", iFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemNamedValueSet>} objWbemNamedValueSet 
     * @returns {HRESULT} 
     */
    Clone(objWbemNamedValueSet) {
        result := ComCall(12, this, "ptr*", objWbemNamedValueSet, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAll() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
