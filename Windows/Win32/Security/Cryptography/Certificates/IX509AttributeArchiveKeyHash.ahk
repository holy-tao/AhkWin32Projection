#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Attribute.ahk

/**
 * Represents an attribute that contains a SHA-1 hash of the encrypted private key to be archived by a certification authority.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509attributearchivekeyhash
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509AttributeArchiveKeyHash extends IX509Attribute{
    /**
     * The interface identifier for IX509AttributeArchiveKeyHash
     * @type {Guid}
     */
    static IID => Guid("{728ab328-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncryptedKeyBlob 
     * @returns {HRESULT} 
     */
    InitializeEncodeFromEncryptedKeyBlob(Encoding, strEncryptedKeyBlob) {
        strEncryptedKeyBlob := strEncryptedKeyBlob is String ? BSTR.Alloc(strEncryptedKeyBlob).Value : strEncryptedKeyBlob

        result := ComCall(10, this, "int", Encoding, "ptr", strEncryptedKeyBlob, "int")
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
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_EncryptedKeyHashBlob(Encoding, pValue) {
        result := ComCall(12, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
