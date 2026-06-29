#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISignerCertificate.ahk" { ISignerCertificate }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IX509CertificateRequestPkcs10.ahk" { IX509CertificateRequestPkcs10 }
#Import ".\IX500DistinguishedName.ahk" { IX500DistinguishedName }
#Import ".\EncodingType.ahk" { EncodingType }
#Import ".\IX509PublicKey.ahk" { IX509PublicKey }

/**
 * The IX509CertificateRequestCertificate interface represents a request object for a self-generated certificate, enabling you to create a certificate directly without going through a registration or certification authority.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509certificaterequestcertificate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509CertificateRequestCertificate extends IX509CertificateRequestPkcs10 {
    /**
     * The interface identifier for IX509CertificateRequestCertificate
     * @type {Guid}
     */
    static IID := Guid("{728ab343-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509CertificateRequestCertificate interfaces
    */
    struct Vtbl extends IX509CertificateRequestPkcs10.Vtbl {
        CheckPublicKeySignature : IntPtr
        get_Issuer              : IntPtr
        put_Issuer              : IntPtr
        get_NotBefore           : IntPtr
        put_NotBefore           : IntPtr
        get_NotAfter            : IntPtr
        put_NotAfter            : IntPtr
        get_SerialNumber        : IntPtr
        put_SerialNumber        : IntPtr
        get_SignerCertificate   : IntPtr
        put_SignerCertificate   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509CertificateRequestCertificate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IX500DistinguishedName} 
     */
    Issuer {
        get => this.get_Issuer()
        set => this.put_Issuer(value)
    }

    /**
     * @type {Float} 
     */
    NotBefore {
        get => this.get_NotBefore()
        set => this.put_NotBefore(value)
    }

    /**
     * @type {Float} 
     */
    NotAfter {
        get => this.get_NotAfter()
        set => this.put_NotAfter(value)
    }

    /**
     * @type {ISignerCertificate} 
     */
    SignerCertificate {
        get => this.get_SignerCertificate()
        set => this.put_SignerCertificate(value)
    }

    /**
     * Verifies the certificate signature by using the public key of the signing certificate.
     * @remarks
     * This method decrypts the signature and compares it to a hash of the certificate, using the hash algorithm specified by the signature. You must initialize the request object before calling this property. For more information, see any of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {IX509PublicKey} pPublicKey Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509publickey">IX509PublicKey</a> interface that represents the public key.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>CRYPT_E_NO_SIGNER</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The signature cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_INVALID_STATE)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509publickey">IX509PublicKey</a> object has not been initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>OLE_E_BLANK</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request object has not been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-checkpublickeysignature
     */
    CheckPublicKeySignature(pPublicKey) {
        result := ComCall(60, this, "ptr", pPublicKey, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the name of the certificate issuer. (Get)
     * @remarks
     * If you do not specify this property before calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a>, the property value is set by using the subject of the signing certificate. If no signing certificate was supplied, the property value is set by using the subject of the request object.
     * 
     * You must initialize the request object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {IX500DistinguishedName} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_issuer
     */
    get_Issuer() {
        result := ComCall(61, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX500DistinguishedName(ppValue)
    }

    /**
     * Specifies or retrieves the name of the certificate issuer. (Put)
     * @remarks
     * If you do not specify this property before calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a>, the property value is set by using the subject of the signing certificate. If no signing certificate was supplied, the property value is set by using the subject of the request object.
     * 
     * You must initialize the request object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {IX500DistinguishedName} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-put_issuer
     */
    put_Issuer(pValue) {
        result := ComCall(62, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the date and time before which the certificate is not valid. (Get)
     * @remarks
     * The expiration date is stored as an 8-byte real value that represents a Coordinated Universal Time (Greenwich Mean Time) value between January 1, 1900 and December 31, 9999, inclusive. The value 2.0 represents January 1, 1900; 3.0 represents January 2, 1900. Adding 1 to the value increments the date by a day. The fractional part of the value represents the time of day. Therefore, 2.5 represents 12:00 on January 1, 1900; 3.25 represents 06:00 on January 2, 1900.
     * 
     * For dates between 1950 and 2049 inclusive, the date and time is encoded Coordinated Universal Time in the form YYMMDDHHMMSS. For dates before 1950 or after 2049, encoded generalized time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four digit year, and is precise to milliseconds. The <b>NotBefore</b> time is, however, only precise to seconds.
     * 
     * After calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a>, the default value equals the current time plus one year minus ten minutes to compensate for clock skew. Typically, this value is adjusted by time zone and daylight saving time, if applicable, before it is displayed.
     * 
     * You must initialize the request object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_notbefore
     */
    get_NotBefore() {
        result := ComCall(63, this, "double*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the date and time before which the certificate is not valid. (Put)
     * @remarks
     * The expiration date is stored as an 8-byte real value that represents a Coordinated Universal Time (Greenwich Mean Time) value between January 1, 1900 and December 31, 9999, inclusive. The value 2.0 represents January 1, 1900; 3.0 represents January 2, 1900. Adding 1 to the value increments the date by a day. The fractional part of the value represents the time of day. Therefore, 2.5 represents 12:00 on January 1, 1900; 3.25 represents 06:00 on January 2, 1900.
     * 
     * For dates between 1950 and 2049 inclusive, the date and time is encoded Coordinated Universal Time in the form YYMMDDHHMMSS. For dates before 1950 or after 2049, encoded generalized time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four digit year, and is precise to milliseconds. The <b>NotBefore</b> time is, however, only precise to seconds.
     * 
     * After calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a>, the default value equals the current time plus one year minus ten minutes to compensate for clock skew. Typically, this value is adjusted by time zone and daylight saving time, if applicable, before it is displayed.
     * 
     * You must initialize the request object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-put_notbefore
     */
    put_NotBefore(Value) {
        result := ComCall(64, this, "double", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the date and time after which the certificate is no longer valid. (Get)
     * @remarks
     * The expiration date is stored as an 8-byte real value that represents a Coordinated Universal Time (Greenwich Mean Time) value between January 1, 1900 and December 31, 9999, inclusive. The value 2.0 represents January 1, 1900; 3.0 represents January 2, 1900. Adding 1 to the value increments the date by a day. The fractional part of the value represents the time of day. Therefore, 2.5 represents 12:00 on January 1, 1900; 3.25 represents 06:00 on January 2, 1900.
     * 
     * For dates between 1950 and 2049 inclusive, the date and time is encoded Coordinated Universal Time in the form YYMMDDHHMMSS. For dates before 1950 or after 2049, encoded generalized time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four digit year, and is precise to milliseconds. The <b>NotAfter</b> time is, however, only precise to seconds.
     * 
     * After calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a>, the default value equals the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_notbefore">NotBefore</a> property value plus one year plus ten minutes to compensate for clock skew. Typically, this value is adjusted by time zone and daylight saving time, if applicable, before it is displayed.
     * 
     * You must initialize the request object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_notafter
     */
    get_NotAfter() {
        result := ComCall(65, this, "double*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the date and time after which the certificate is no longer valid. (Put)
     * @remarks
     * The expiration date is stored as an 8-byte real value that represents a Coordinated Universal Time (Greenwich Mean Time) value between January 1, 1900 and December 31, 9999, inclusive. The value 2.0 represents January 1, 1900; 3.0 represents January 2, 1900. Adding 1 to the value increments the date by a day. The fractional part of the value represents the time of day. Therefore, 2.5 represents 12:00 on January 1, 1900; 3.25 represents 06:00 on January 2, 1900.
     * 
     * For dates between 1950 and 2049 inclusive, the date and time is encoded Coordinated Universal Time in the form YYMMDDHHMMSS. For dates before 1950 or after 2049, encoded generalized time is used. Encoded generalized time is in the form YYYYMMDDHHMMSSMMM, using a four digit year, and is precise to milliseconds. The <b>NotAfter</b> time is, however, only precise to seconds.
     * 
     * After calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a>, the default value equals the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_notbefore">NotBefore</a> property value plus one year plus ten minutes to compensate for clock skew. Typically, this value is adjusted by time zone and daylight saving time, if applicable, before it is displayed.
     * 
     * You must initialize the request object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-put_notafter
     */
    put_NotAfter(Value) {
        result := ComCall(66, this, "double", Value, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves the certificate serial number. (Get)
     * @remarks
     * After calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a>, the default value is a GUID with a high-order nibble that is not zero (to ensure that the hexadecimal representation of the serial number has an even number of digits). The high-order nibble is in the range 1 to 7. You must initialize the request object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_serialnumber
     */
    get_SerialNumber(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(67, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves the certificate serial number. (Put)
     * @remarks
     * After calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a>, the default value is a GUID with a high-order nibble that is not zero (to ensure that the hexadecimal representation of the serial number has an even number of digits). The high-order nibble is in the range 1 to 7. You must initialize the request object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {EncodingType} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-put_serialnumber
     */
    put_SerialNumber(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(68, this, EncodingType, Encoding, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the ISignerCertificate object used to sign the certificate. (Get)
     * @remarks
     * You can set this property if you are not creating a self-signed certificate. If you do not specify the  property value before calling  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a>, the private key associated with the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestcertificate">IX509CertificateRequestCertificate</a> object is used to sign the certificate, and the name of the issuer is set, by default, to the subject name.
     * 
     * You must initialize the request object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @returns {ISignerCertificate} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_signercertificate
     */
    get_SignerCertificate() {
        result := ComCall(69, this, "ptr*", &ppValue := 0, "HRESULT")
        return ISignerCertificate(ppValue)
    }

    /**
     * Specifies or retrieves the ISignerCertificate object used to sign the certificate. (Put)
     * @remarks
     * You can set this property if you are not creating a self-signed certificate. If you do not specify the  property value before calling  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a>, the private key associated with the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestcertificate">IX509CertificateRequestCertificate</a> object is used to sign the certificate, and the name of the issuer is set, by default, to the subject name.
     * 
     * You must initialize the request object before calling this property. For more information, see any of the following methods:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode">InitializeDecode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate">InitializeFromCertificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey">InitializeFromPrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey">InitializeFromPublicKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename">InitializeFromTemplateName</a>
     * </li>
     * </ul>
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-put_signercertificate
     */
    put_SignerCertificate(pValue) {
        result := ComCall(70, this, "ptr", pValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IX509CertificateRequestCertificate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckPublicKeySignature := CallbackCreate(GetMethod(implObj, "CheckPublicKeySignature"), flags, 2)
        this.vtbl.get_Issuer := CallbackCreate(GetMethod(implObj, "get_Issuer"), flags, 2)
        this.vtbl.put_Issuer := CallbackCreate(GetMethod(implObj, "put_Issuer"), flags, 2)
        this.vtbl.get_NotBefore := CallbackCreate(GetMethod(implObj, "get_NotBefore"), flags, 2)
        this.vtbl.put_NotBefore := CallbackCreate(GetMethod(implObj, "put_NotBefore"), flags, 2)
        this.vtbl.get_NotAfter := CallbackCreate(GetMethod(implObj, "get_NotAfter"), flags, 2)
        this.vtbl.put_NotAfter := CallbackCreate(GetMethod(implObj, "put_NotAfter"), flags, 2)
        this.vtbl.get_SerialNumber := CallbackCreate(GetMethod(implObj, "get_SerialNumber"), flags, 3)
        this.vtbl.put_SerialNumber := CallbackCreate(GetMethod(implObj, "put_SerialNumber"), flags, 3)
        this.vtbl.get_SignerCertificate := CallbackCreate(GetMethod(implObj, "get_SignerCertificate"), flags, 2)
        this.vtbl.put_SignerCertificate := CallbackCreate(GetMethod(implObj, "put_SignerCertificate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckPublicKeySignature)
        CallbackFree(this.vtbl.get_Issuer)
        CallbackFree(this.vtbl.put_Issuer)
        CallbackFree(this.vtbl.get_NotBefore)
        CallbackFree(this.vtbl.put_NotBefore)
        CallbackFree(this.vtbl.get_NotAfter)
        CallbackFree(this.vtbl.put_NotAfter)
        CallbackFree(this.vtbl.get_SerialNumber)
        CallbackFree(this.vtbl.put_SerialNumber)
        CallbackFree(this.vtbl.get_SignerCertificate)
        CallbackFree(this.vtbl.put_SignerCertificate)
    }
}
