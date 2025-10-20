#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an object identifier (OID).
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-iobjectid
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IObjectId extends IDispatch{
    /**
     * The interface identifier for IObjectId
     * @type {Guid}
     */
    static IID => Guid("{728ab300-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} Name 
     * @returns {HRESULT} 
     */
    InitializeFromName(Name) {
        result := ComCall(7, this, "int", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    InitializeFromValue(strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(8, this, "ptr", strValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} GroupId 
     * @param {Integer} KeyFlags 
     * @param {Integer} AlgFlags 
     * @param {BSTR} strAlgorithmName 
     * @returns {HRESULT} 
     */
    InitializeFromAlgorithmName(GroupId, KeyFlags, AlgFlags, strAlgorithmName) {
        strAlgorithmName := strAlgorithmName is String ? BSTR.Alloc(strAlgorithmName).Value : strAlgorithmName

        result := ComCall(9, this, "int", GroupId, "int", KeyFlags, "int", AlgFlags, "ptr", strAlgorithmName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_Name(pValue) {
        result := ComCall(10, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_FriendlyName(pValue) {
        result := ComCall(11, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_FriendlyName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(12, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_Value(pValue) {
        result := ComCall(13, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} GroupId 
     * @param {Integer} KeyFlags 
     * @param {Pointer<BSTR>} pstrAlgorithmName 
     * @returns {HRESULT} 
     */
    GetAlgorithmName(GroupId, KeyFlags, pstrAlgorithmName) {
        result := ComCall(14, this, "int", GroupId, "int", KeyFlags, "ptr", pstrAlgorithmName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
