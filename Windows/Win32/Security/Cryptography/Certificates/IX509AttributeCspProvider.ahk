#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Attribute.ahk

/**
 * Represents an attribute that identifies the cryptographic provider used by the entity requesting the certificate.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509attributecspprovider
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509AttributeCspProvider extends IX509Attribute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509AttributeCspProvider
     * @type {Guid}
     */
    static IID => Guid("{728ab32b-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_KeySpec", "get_ProviderName", "get_Signature"]

    /**
     * 
     * @param {Integer} KeySpec 
     * @param {BSTR} strProviderName 
     * @param {Integer} Encoding 
     * @param {BSTR} strSignature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributecspprovider-initializeencode
     */
    InitializeEncode(KeySpec, strProviderName, Encoding, strSignature) {
        strProviderName := strProviderName is String ? BSTR.Alloc(strProviderName).Value : strProviderName
        strSignature := strSignature is String ? BSTR.Alloc(strSignature).Value : strSignature

        result := ComCall(10, this, "int", KeySpec, "ptr", strProviderName, "int", Encoding, "ptr", strSignature, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributecspprovider-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributecspprovider-get_keyspec
     */
    get_KeySpec(pValue) {
        result := ComCall(12, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributecspprovider-get_providername
     */
    get_ProviderName(pValue) {
        result := ComCall(13, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributecspprovider-get_signature
     */
    get_Signature(Encoding, pValue) {
        result := ComCall(14, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }
}
