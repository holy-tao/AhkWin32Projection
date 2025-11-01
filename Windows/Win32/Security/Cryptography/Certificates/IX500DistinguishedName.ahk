#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an X.500 distinguished name (DN).
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix500distinguishedname
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX500DistinguishedName extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX500DistinguishedName
     * @type {Guid}
     */
    static IID => Guid("{728ab303-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Decode", "Encode", "get_Name", "get_EncodedName"]

    /**
     * 
     * @param {BSTR} strEncodedName 
     * @param {Integer} Encoding 
     * @param {Integer} NameFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix500distinguishedname-decode
     */
    Decode(strEncodedName, Encoding, NameFlags) {
        strEncodedName := strEncodedName is String ? BSTR.Alloc(strEncodedName).Value : strEncodedName

        result := ComCall(7, this, "ptr", strEncodedName, "int", Encoding, "int", NameFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Integer} NameFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix500distinguishedname-encode
     */
    Encode(strName, NameFlags) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "int", NameFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix500distinguishedname-get_name
     */
    get_Name(pValue) {
        result := ComCall(9, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix500distinguishedname-get_encodedname
     */
    get_EncodedName(Encoding, pValue) {
        result := ComCall(10, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }
}
