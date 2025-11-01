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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromName", "InitializeFromValue", "InitializeFromAlgorithmName", "get_Name", "get_FriendlyName", "put_FriendlyName", "get_Value", "GetAlgorithmName"]

    /**
     * 
     * @param {Integer} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-iobjectid-initializefromname
     */
    InitializeFromName(Name) {
        result := ComCall(7, this, "int", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-iobjectid-initializefromvalue
     */
    InitializeFromValue(strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(8, this, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} GroupId 
     * @param {Integer} KeyFlags 
     * @param {Integer} AlgFlags 
     * @param {BSTR} strAlgorithmName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-iobjectid-initializefromalgorithmname
     */
    InitializeFromAlgorithmName(GroupId, KeyFlags, AlgFlags, strAlgorithmName) {
        strAlgorithmName := strAlgorithmName is String ? BSTR.Alloc(strAlgorithmName).Value : strAlgorithmName

        result := ComCall(9, this, "int", GroupId, "int", KeyFlags, "int", AlgFlags, "ptr", strAlgorithmName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-iobjectid-get_name
     */
    get_Name(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-iobjectid-get_friendlyname
     */
    get_FriendlyName(pValue) {
        result := ComCall(11, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-iobjectid-put_friendlyname
     */
    put_FriendlyName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(12, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-iobjectid-get_value
     */
    get_Value(pValue) {
        result := ComCall(13, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} GroupId 
     * @param {Integer} KeyFlags 
     * @param {Pointer<BSTR>} pstrAlgorithmName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-iobjectid-getalgorithmname
     */
    GetAlgorithmName(GroupId, KeyFlags, pstrAlgorithmName) {
        result := ComCall(14, this, "int", GroupId, "int", KeyFlags, "ptr", pstrAlgorithmName, "HRESULT")
        return result
    }
}
