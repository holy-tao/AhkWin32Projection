#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ISWbemNamedValue.ahk
#Include .\ISWbemNamedValueSet.ahk
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
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @returns {ISWbemNamedValue} 
     */
    Item(strName, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "int", iFlags, "ptr*", &objWbemNamedValue := 0, "HRESULT")
        return ISWbemNamedValue(objWbemNamedValue)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &iCount := 0, "HRESULT")
        return iCount
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT>} varValue 
     * @param {Integer} iFlags 
     * @returns {ISWbemNamedValue} 
     */
    Add(strName, varValue, iFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(10, this, "ptr", strName, "ptr", varValue, "int", iFlags, "ptr*", &objWbemNamedValue := 0, "HRESULT")
        return ISWbemNamedValue(objWbemNamedValue)
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
     * @returns {ISWbemNamedValueSet} 
     */
    Clone() {
        result := ComCall(12, this, "ptr*", &objWbemNamedValueSet := 0, "HRESULT")
        return ISWbemNamedValueSet(objWbemNamedValueSet)
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
