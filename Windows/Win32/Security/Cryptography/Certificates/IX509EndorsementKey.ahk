#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IX509PublicKey.ahk" { IX509PublicKey }

/**
 * X.509 Endorsement Key Interface
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509endorsementkey
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509EndorsementKey extends IDispatch {
    /**
     * The interface identifier for IX509EndorsementKey
     * @type {Guid}
     */
    static IID := Guid("{b11cd855-f4c4-4fc6-b710-4422237f09e9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509EndorsementKey interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ProviderName      : IntPtr
        put_ProviderName      : IntPtr
        get_Length            : IntPtr
        get_Opened            : IntPtr
        AddCertificate        : IntPtr
        RemoveCertificate     : IntPtr
        GetCertificateByIndex : IntPtr
        GetCertificateCount   : IntPtr
        ExportPublicKey       : IntPtr
        Open                  : IntPtr
        Close                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509EndorsementKey.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The name of the encryption provider. The default is the Microsoft Platform Crypto Provider. You must set the ProviderName property before you call the Open method. You cannot change the ProviderName property after you have called the Open method. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-get_providername
     */
    get_ProviderName() {
        pValue := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * The name of the encryption provider. The default is the Microsoft Platform Crypto Provider. You must set the ProviderName property before you call the Open method. You cannot change the ProviderName property after you have called the Open method. (Put)
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-put_providername
     */
    put_ProviderName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(8, this, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * The bit length of the endorsement key. You can only access this property after the Open method has been called.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-get_length
     */
    get_Length() {
        result := ComCall(9, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Indicates whether the Open method has been successfully called.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-get_opened
     */
    get_Opened() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Add an endorsement key certificate to the key storage provider (KSP) that supports endorsement keys.
     * @remarks
     * Only non-manufacturer certificates can be added to the key storage provider.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding applied to the certificate. The default value is XCN_CRYPT_STRING_BASE64.
     * @param {BSTR} strCertificate The certificate to add to the store. The public key from this certificate must match the public key of the endorsement key.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-addcertificate
     */
    AddCertificate(Encoding, strCertificate) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(11, this, EncodingType, Encoding, BSTR, strCertificate, "HRESULT")
        return result
    }

    /**
     * Removes an endorsement certificate related to the endorsement key from the key storage provider. You can only call the RemoveCertificate method after the Open method has been successfully called.
     * @remarks
     * Only non-manufacturer certificates can be removed from the key storage provider.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding applied to the  endorsement certificate. The default value is XCN_CRYPT_STRING_BASE64.
     * @param {BSTR} strCertificate The certificate to remove from the store.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-removecertificate
     */
    RemoveCertificate(Encoding, strCertificate) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(12, this, EncodingType, Encoding, BSTR, strCertificate, "HRESULT")
        return result
    }

    /**
     * Gets the endorsement certificate associated with the endorsement key from the key storage provider for the specified index.
     * @param {VARIANT_BOOL} ManufacturerOnly True to get manufacturer endorsement keys only; otherwise false. The default is false.
     * @param {Integer} dwIndex The index of the requested endorsement certificate.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding applied to the  endorsement certificate. The default value is XCN_CRYPT_STRING_BASE64.
     * @returns {BSTR} The endorsement certificate requested.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-getcertificatebyindex
     */
    GetCertificateByIndex(ManufacturerOnly, dwIndex, Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(13, this, VARIANT_BOOL, ManufacturerOnly, "int", dwIndex, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Gets the count of the endorsement certificates in the key storage provider.
     * @param {VARIANT_BOOL} ManufacturerOnly True to return the count for only manufacturer certificates. False to return the count for only non-manufacturer certificates.
     * @returns {Integer} The count of endorsement certificates from the key storage provider.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-getcertificatecount
     */
    GetCertificateCount(ManufacturerOnly) {
        result := ComCall(14, this, VARIANT_BOOL, ManufacturerOnly, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Exports the endorsement public key.
     * @returns {IX509PublicKey} The exported endorsement public key.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-exportpublickey
     */
    ExportPublicKey() {
        result := ComCall(15, this, "ptr*", &ppPublicKey := 0, "HRESULT")
        return IX509PublicKey(ppPublicKey)
    }

    /**
     * Opens the endorsement key. The endorsement key must be open before you can retrieve an information from the endorsement key, add or remove certificates, or export the endorsement key.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-open
     */
    Open() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Closes the endorsement key. You can only call the Close method after the Open method has been successfully called.
     * @remarks
     * The <b>Close</b> method releases any resources held
     *     by the object except for the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509endorsementkey-get_providername">ProviderName</a>.
     *     The <b>ProviderName</b> is released when it is re-assigned
     *     or when this object is destroyed.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509endorsementkey-close
     */
    Close() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IX509EndorsementKey.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProviderName := CallbackCreate(GetMethod(implObj, "get_ProviderName"), flags, 2)
        this.vtbl.put_ProviderName := CallbackCreate(GetMethod(implObj, "put_ProviderName"), flags, 2)
        this.vtbl.get_Length := CallbackCreate(GetMethod(implObj, "get_Length"), flags, 2)
        this.vtbl.get_Opened := CallbackCreate(GetMethod(implObj, "get_Opened"), flags, 2)
        this.vtbl.AddCertificate := CallbackCreate(GetMethod(implObj, "AddCertificate"), flags, 3)
        this.vtbl.RemoveCertificate := CallbackCreate(GetMethod(implObj, "RemoveCertificate"), flags, 3)
        this.vtbl.GetCertificateByIndex := CallbackCreate(GetMethod(implObj, "GetCertificateByIndex"), flags, 5)
        this.vtbl.GetCertificateCount := CallbackCreate(GetMethod(implObj, "GetCertificateCount"), flags, 3)
        this.vtbl.ExportPublicKey := CallbackCreate(GetMethod(implObj, "ExportPublicKey"), flags, 2)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 1)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProviderName)
        CallbackFree(this.vtbl.put_ProviderName)
        CallbackFree(this.vtbl.get_Length)
        CallbackFree(this.vtbl.get_Opened)
        CallbackFree(this.vtbl.AddCertificate)
        CallbackFree(this.vtbl.RemoveCertificate)
        CallbackFree(this.vtbl.GetCertificateByIndex)
        CallbackFree(this.vtbl.GetCertificateCount)
        CallbackFree(this.vtbl.ExportPublicKey)
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.Close)
    }
}
