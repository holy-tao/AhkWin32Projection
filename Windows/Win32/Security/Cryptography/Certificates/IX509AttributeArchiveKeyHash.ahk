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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncodeFromEncryptedKeyBlob", "InitializeDecode", "get_EncryptedKeyHashBlob"]

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncryptedKeyBlob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializeencodefromencryptedkeyblob
     */
    InitializeEncodeFromEncryptedKeyBlob(Encoding, strEncryptedKeyBlob) {
        strEncryptedKeyBlob := strEncryptedKeyBlob is String ? BSTR.Alloc(strEncryptedKeyBlob).Value : strEncryptedKeyBlob

        result := ComCall(10, this, "int", Encoding, "ptr", strEncryptedKeyBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributearchivekeyhash-get_encryptedkeyhashblob
     */
    get_EncryptedKeyHashBlob(Encoding) {
        pValue := BSTR()
        result := ComCall(12, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }
}
