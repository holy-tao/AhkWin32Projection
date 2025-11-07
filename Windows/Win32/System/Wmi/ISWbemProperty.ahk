#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISWbemQualifierSet.ahk
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
     * @returns {VARIANT} 
     */
    get_Value() {
        varValue := VARIANT()
        result := ComCall(7, this, "ptr", varValue, "HRESULT")
        return varValue
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
     * @returns {BSTR} 
     */
    get_Name() {
        strName := BSTR()
        result := ComCall(9, this, "ptr", strName, "HRESULT")
        return strName
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsLocal() {
        result := ComCall(10, this, "short*", &bIsLocal := 0, "HRESULT")
        return bIsLocal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Origin() {
        strOrigin := BSTR()
        result := ComCall(11, this, "ptr", strOrigin, "HRESULT")
        return strOrigin
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CIMType() {
        result := ComCall(12, this, "int*", &iCimType := 0, "HRESULT")
        return iCimType
    }

    /**
     * 
     * @returns {ISWbemQualifierSet} 
     */
    get_Qualifiers_() {
        result := ComCall(13, this, "ptr*", &objWbemQualifierSet := 0, "HRESULT")
        return ISWbemQualifierSet(objWbemQualifierSet)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsArray() {
        result := ComCall(14, this, "short*", &bIsArray := 0, "HRESULT")
        return bIsArray
    }
}
