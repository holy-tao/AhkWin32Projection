#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an algorithm implemented by a cryptographic provider.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icspalgorithm
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICspAlgorithm extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICspAlgorithm
     * @type {Guid}
     */
    static IID => Guid("{728ab305-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAlgorithmOid", "get_DefaultLength", "get_IncrementLength", "get_LongName", "get_Valid", "get_MaxLength", "get_MinLength", "get_Name", "get_Type", "get_Operations"]

    /**
     * 
     * @param {Integer} Length 
     * @param {Integer} AlgFlags 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-getalgorithmoid
     */
    GetAlgorithmOid(Length, AlgFlags, ppValue) {
        result := ComCall(7, this, "int", Length, "int", AlgFlags, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_defaultlength
     */
    get_DefaultLength(pValue) {
        result := ComCall(8, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_incrementlength
     */
    get_IncrementLength(pValue) {
        result := ComCall(9, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_longname
     */
    get_LongName(pValue) {
        result := ComCall(10, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_valid
     */
    get_Valid(pValue) {
        result := ComCall(11, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_maxlength
     */
    get_MaxLength(pValue) {
        result := ComCall(12, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_minlength
     */
    get_MinLength(pValue) {
        result := ComCall(13, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_name
     */
    get_Name(pValue) {
        result := ComCall(14, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_type
     */
    get_Type(pValue) {
        result := ComCall(15, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icspalgorithm-get_operations
     */
    get_Operations(pValue) {
        result := ComCall(16, this, "int*", pValue, "HRESULT")
        return result
    }
}
