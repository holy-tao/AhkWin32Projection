#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Attribute.ahk

/**
 * Represents an attribute that contains an encrypted private key to be archived by a certification authority.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509attributearchivekey
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509AttributeArchiveKey extends IX509Attribute{
    /**
     * The interface identifier for IX509AttributeArchiveKey
     * @type {Guid}
     */
    static IID => Guid("{728ab327-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Pointer<IX509PrivateKey>} pKey 
     * @param {Integer} Encoding 
     * @param {BSTR} strCAXCert 
     * @param {Pointer<IObjectId>} pAlgorithm 
     * @param {Integer} EncryptionStrength 
     * @returns {HRESULT} 
     */
    InitializeEncode(pKey, Encoding, strCAXCert, pAlgorithm, EncryptionStrength) {
        strCAXCert := strCAXCert is String ? BSTR.Alloc(strCAXCert).Value : strCAXCert

        result := ComCall(10, this, "ptr", pKey, "int", Encoding, "ptr", strCAXCert, "ptr", pAlgorithm, "int", EncryptionStrength, "int")
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
    get_EncryptedKeyBlob(Encoding, pValue) {
        result := ComCall(12, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     */
    get_EncryptionAlgorithm(ppValue) {
        result := ComCall(13, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_EncryptionStrength(pValue) {
        result := ComCall(14, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
