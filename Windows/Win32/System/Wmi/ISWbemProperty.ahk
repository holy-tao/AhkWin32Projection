#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemProperty extends IDispatch{
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
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    get_Value(varValue) {
        result := ComCall(7, this, "ptr", varValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(8, this, "ptr", varValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    get_Name(strName) {
        result := ComCall(9, this, "ptr", strName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bIsLocal 
     * @returns {HRESULT} 
     */
    get_IsLocal(bIsLocal) {
        result := ComCall(10, this, "ptr", bIsLocal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strOrigin 
     * @returns {HRESULT} 
     */
    get_Origin(strOrigin) {
        result := ComCall(11, this, "ptr", strOrigin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} iCimType 
     * @returns {HRESULT} 
     */
    get_CIMType(iCimType) {
        result := ComCall(12, this, "int*", iCimType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemQualifierSet>} objWbemQualifierSet 
     * @returns {HRESULT} 
     */
    get_Qualifiers_(objWbemQualifierSet) {
        result := ComCall(13, this, "ptr", objWbemQualifierSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bIsArray 
     * @returns {HRESULT} 
     */
    get_IsArray(bIsArray) {
        result := ComCall(14, this, "ptr", bIsArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
