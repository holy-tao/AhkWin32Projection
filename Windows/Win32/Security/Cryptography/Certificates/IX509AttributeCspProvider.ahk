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
     * 
     * @param {Integer} KeySpec 
     * @param {BSTR} strProviderName 
     * @param {Integer} Encoding 
     * @param {BSTR} strSignature 
     * @returns {HRESULT} 
     */
    InitializeEncode(KeySpec, strProviderName, Encoding, strSignature) {
        strProviderName := strProviderName is String ? BSTR.Alloc(strProviderName).Value : strProviderName
        strSignature := strSignature is String ? BSTR.Alloc(strSignature).Value : strSignature

        result := ComCall(10, this, "int", KeySpec, "ptr", strProviderName, "int", Encoding, "ptr", strSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, "int", Encoding, "ptr", strEncodedData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_KeySpec(pValue) {
        result := ComCall(12, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_ProviderName(pValue) {
        result := ComCall(13, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_Signature(Encoding, pValue) {
        result := ComCall(14, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
