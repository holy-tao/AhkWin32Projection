#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemProperty extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemProperty
     * @type {Guid}
     */
    static IID => Guid("{1a388f98-d4ba-11d1-8b09-00600806d9b6}")

    /**
     * The class identifier for SWbemProperty
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d5d-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Value", "get_Name", "get_IsLocal", "get_Origin", "get_CIMType", "get_Qualifiers_", "get_IsArray"]

    /**
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    get_Value(varValue) {
        result := ComCall(7, this, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(8, this, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    get_Name(strName) {
        result := ComCall(9, this, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bIsLocal 
     * @returns {HRESULT} 
     */
    get_IsLocal(bIsLocal) {
        result := ComCall(10, this, "ptr", bIsLocal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strOrigin 
     * @returns {HRESULT} 
     */
    get_Origin(strOrigin) {
        result := ComCall(11, this, "ptr", strOrigin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} iCimType 
     * @returns {HRESULT} 
     */
    get_CIMType(iCimType) {
        iCimTypeMarshal := iCimType is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, iCimTypeMarshal, iCimType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemQualifierSet>} objWbemQualifierSet 
     * @returns {HRESULT} 
     */
    get_Qualifiers_(objWbemQualifierSet) {
        result := ComCall(13, this, "ptr*", objWbemQualifierSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bIsArray 
     * @returns {HRESULT} 
     */
    get_IsArray(bIsArray) {
        result := ComCall(14, this, "ptr", bIsArray, "HRESULT")
        return result
    }
}
