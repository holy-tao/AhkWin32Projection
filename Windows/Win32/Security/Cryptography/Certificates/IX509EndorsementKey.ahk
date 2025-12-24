#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509PublicKey.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * X.509 Endorsement Key Interface
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509endorsementkey
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509EndorsementKey extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509EndorsementKey
     * @type {Guid}
     */
    static IID => Guid("{b11cd855-f4c4-4fc6-b710-4422237f09e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProviderName", "put_ProviderName", "get_Length", "get_Opened", "AddCertificate", "RemoveCertificate", "GetCertificateByIndex", "GetCertificateCount", "ExportPublicKey", "Open", "Close"]

    /**
     * @type {BSTR} 
     */
    ProviderName {
        get => this.get_ProviderName()
        set => this.put_ProviderName(value)
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Opened {
        get => this.get_Opened()
    }

    /**
     * The name of the encryption provider. The default is the Microsoft Platform Crypto Provider. You must set the ProviderName property before you call the Open method. You cannot change the ProviderName property after you have called the Open method.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509endorsementkey-get_providername
     */
    get_ProviderName() {
        pValue := BSTR()
        result := ComCall(7, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * The name of the encryption provider. The default is the Microsoft Platform Crypto Provider. You must set the ProviderName property before you call the Open method. You cannot change the ProviderName property after you have called the Open method.
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509endorsementkey-put_providername
     */
    put_ProviderName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(8, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * The bit length of the endorsement key. You can only access this property after the Open method has been called.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509endorsementkey-get_length
     */
    get_Length() {
        result := ComCall(9, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Indicates whether the Open method has been successfully called.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509endorsementkey-get_opened
     */
    get_Opened() {
        result := ComCall(10, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Add an endorsement key certificate to the key storage provider (KSP) that supports endorsement keys.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding applied to the certificate. The default value is XCN_CRYPT_STRING_BASE64.
     * @param {BSTR} strCertificate The certificate to add to the store. The public key from this certificate must match the public key of the endorsement key.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509endorsementkey-addcertificate
     */
    AddCertificate(Encoding, strCertificate) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(11, this, "int", Encoding, "ptr", strCertificate, "HRESULT")
        return result
    }

    /**
     * Removes an endorsement certificate related to the endorsement key from the key storage provider. You can only call the RemoveCertificate method after the Open method has been successfully called.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding applied to the  endorsement certificate. The default value is XCN_CRYPT_STRING_BASE64.
     * @param {BSTR} strCertificate The certificate to remove from the store.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509endorsementkey-removecertificate
     */
    RemoveCertificate(Encoding, strCertificate) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(12, this, "int", Encoding, "ptr", strCertificate, "HRESULT")
        return result
    }

    /**
     * Gets the endorsement certificate associated with the endorsement key from the key storage provider for the specified index.
     * @param {VARIANT_BOOL} ManufacturerOnly True to get manufacturer endorsement keys only; otherwise false. The default is false.
     * @param {Integer} dwIndex The index of the requested endorsement certificate.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding applied to the  endorsement certificate. The default value is XCN_CRYPT_STRING_BASE64.
     * @returns {BSTR} The endorsement certificate requested.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509endorsementkey-getcertificatebyindex
     */
    GetCertificateByIndex(ManufacturerOnly, dwIndex, Encoding) {
        pValue := BSTR()
        result := ComCall(13, this, "short", ManufacturerOnly, "int", dwIndex, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Gets the count of the endorsement certificates in the key storage provider.
     * @param {VARIANT_BOOL} ManufacturerOnly True to return the count for only manufacturer certificates. False to return the count for only non-manufacturer certificates.
     * @returns {Integer} The count of endorsement certificates from the key storage provider.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509endorsementkey-getcertificatecount
     */
    GetCertificateCount(ManufacturerOnly) {
        result := ComCall(14, this, "short", ManufacturerOnly, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Exports the endorsement public key.
     * @returns {IX509PublicKey} The exported endorsement public key.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509endorsementkey-exportpublickey
     */
    ExportPublicKey() {
        result := ComCall(15, this, "ptr*", &ppPublicKey := 0, "HRESULT")
        return IX509PublicKey(ppPublicKey)
    }

    /**
     * Opens the endorsement key. The endorsement key must be open before you can retrieve an information from the endorsement key, add or remove certificates, or export the endorsement key.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509endorsementkey-open
     */
    Open() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Closes the endorsement key. You can only call the Close method after the Open method has been successfully called.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509endorsementkey-close
     */
    Close() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
