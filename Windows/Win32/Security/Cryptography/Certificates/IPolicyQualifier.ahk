#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a qualifier that can be associated with a certificate policy.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ipolicyqualifier
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IPolicyQualifier extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPolicyQualifier
     * @type {Guid}
     */
    static IID => Guid("{728ab31c-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "get_ObjectId", "get_Qualifier", "get_Type", "get_RawData"]

    /**
     * 
     * @param {BSTR} strQualifier 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ipolicyqualifier-initializeencode
     */
    InitializeEncode(strQualifier, Type) {
        strQualifier := strQualifier is String ? BSTR.Alloc(strQualifier).Value : strQualifier

        result := ComCall(7, this, "ptr", strQualifier, "int", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ipolicyqualifier-get_objectid
     */
    get_ObjectId(ppValue) {
        result := ComCall(8, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ipolicyqualifier-get_qualifier
     */
    get_Qualifier(pValue) {
        result := ComCall(9, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ipolicyqualifier-get_type
     */
    get_Type(pValue) {
        result := ComCall(10, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ipolicyqualifier-get_rawdata
     */
    get_RawData(Encoding, pValue) {
        result := ComCall(11, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }
}
