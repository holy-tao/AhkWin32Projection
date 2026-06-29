#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CERT_CREATE_REQUEST_FLAGS.ahk" { CERT_CREATE_REQUEST_FLAGS }
#Import "..\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\PENDING_REQUEST_DESIRED_PROPERTY.ahk" { PENDING_REQUEST_DESIRED_PROPERTY }
#Import ".\XEKL_KEYSIZE.ahk" { XEKL_KEYSIZE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\XEKL_KEYSPEC.ahk" { XEKL_KEYSPEC }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import ".\IEnroll2.ahk" { IEnroll2 }
#Import ".\ADDED_CERT_TYPE.ahk" { ADDED_CERT_TYPE }

/**
 * The IEnroll4 interface represents the Certificate Enrollment Control and is used primarily to generate certificate requests.
 * @see https://learn.microsoft.com/windows/win32/api/xenroll/nn-xenroll-ienroll4
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IEnroll4 extends IEnroll2 {
    /**
     * The interface identifier for IEnroll4
     * @type {Guid}
     */
    static IID := Guid("{f8053fe5-78f4-448f-a0db-41d61b73446b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnroll4 interfaces
    */
    struct Vtbl extends IEnroll2.Vtbl {
        put_ThumbPrintWStr                 : IntPtr
        get_ThumbPrintWStr                 : IntPtr
        SetPrivateKeyArchiveCertificate    : IntPtr
        GetPrivateKeyArchiveCertificate    : IntPtr
        binaryBlobToString                 : IntPtr
        stringToBinaryBlob                 : IntPtr
        addExtensionToRequestWStr          : IntPtr
        addAttributeToRequestWStr          : IntPtr
        addNameValuePairToRequestWStr      : IntPtr
        resetExtensions                    : IntPtr
        resetAttributes                    : IntPtr
        createRequestWStr                  : IntPtr
        createFileRequestWStr              : IntPtr
        acceptResponseBlob                 : IntPtr
        acceptFileResponseWStr             : IntPtr
        getCertContextFromResponseBlob     : IntPtr
        getCertContextFromFileResponseWStr : IntPtr
        createPFXWStr                      : IntPtr
        createFilePFXWStr                  : IntPtr
        setPendingRequestInfoWStr          : IntPtr
        enumPendingRequestWStr             : IntPtr
        removePendingRequestWStr           : IntPtr
        GetKeyLenEx                        : IntPtr
        InstallPKCS7BlobEx                 : IntPtr
        AddCertTypeToRequestWStrEx         : IntPtr
        getProviderTypeWStr                : IntPtr
        addBlobPropertyToCertificateWStr   : IntPtr
        SetSignerCertificate               : IntPtr
        put_ClientId                       : IntPtr
        get_ClientId                       : IntPtr
        put_IncludeSubjectKeyID            : IntPtr
        get_IncludeSubjectKeyID            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnroll4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB} 
     */
    ThumbPrintWStr {
        get => this.get_ThumbPrintWStr()
        set => this.put_ThumbPrintWStr(value)
    }

    /**
     * @type {Integer} 
     */
    ClientId {
        get => this.get_ClientId()
        set => this.put_ClientId(value)
    }

    /**
     * @type {BOOL} 
     */
    IncludeSubjectKeyID {
        get => this.get_IncludeSubjectKeyID()
        set => this.put_IncludeSubjectKeyID(value)
    }

    /**
     * Sets or retrieves a hash of the certificate data. The thumbprint is used to point to the pending certificate. (Put)
     * @param {CRYPT_INTEGER_BLOB} thumbPrintBlob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-put_thumbprintwstr
     */
    put_ThumbPrintWStr(thumbPrintBlob) {
        result := ComCall(91, this, CRYPT_INTEGER_BLOB, thumbPrintBlob, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a hash of the certificate data. The thumbprint is used to point to the pending certificate. (Get)
     * @param {Pointer<CRYPT_INTEGER_BLOB>} thumbPrintBlob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-get_thumbprintwstr
     */
    get_ThumbPrintWStr(thumbPrintBlob) {
        result := ComCall(92, this, CRYPT_INTEGER_BLOB.Ptr, thumbPrintBlob, "HRESULT")
        return result
    }

    /**
     * The SetPrivateKeyArchiveCertificate method specifies the certificate used to archive the private key. This method was first defined in the IEnroll4 interface.
     * @param {Pointer<CERT_CONTEXT>} pPrivateKeyArchiveCert A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that specifies the certificate used to archive the private key.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-setprivatekeyarchivecertificate
     */
    SetPrivateKeyArchiveCertificate(pPrivateKeyArchiveCert) {
        result := ComCall(93, this, CERT_CONTEXT.Ptr, pPrivateKeyArchiveCert, "HRESULT")
        return result
    }

    /**
     * The GetPrivateKeyArchiveCertificate method retrieves the certificate used to archive the private key. This method was first defined in the IEnroll4 interface.
     * @returns {Pointer<CERT_CONTEXT>} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that represents the certificate used to archive the private key, or <b>NULL</b> if an error is encountered.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-getprivatekeyarchivecertificate
     */
    GetPrivateKeyArchiveCertificate() {
        result := ComCall(94, this, CERT_CONTEXT.Ptr)
        return result
    }

    /**
     * Converts a binary data BLOB to a string. This method uses the CryptBinaryToString function to perform the conversion. This method was first defined in the IEnroll4 interface.
     * @param {Integer} Flags Value passed to the <i>dwFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptbinarytostringa">CryptBinaryToString</a> function. For a description of possible values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptbinarytostringa">CryptBinaryToString</a>.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobBinary A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that represents the binary BLOB to  convert to a string.
     * @param {Pointer<PWSTR>} ppwszString A pointer to a <b>LPWSTR</b> that receives the encoded data.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-binaryblobtostring
     */
    binaryBlobToString(Flags, pblobBinary, ppwszString) {
        ppwszStringMarshal := ppwszString is VarRef ? "ptr*" : "ptr"

        result := ComCall(95, this, "int", Flags, CRYPT_INTEGER_BLOB.Ptr, pblobBinary, ppwszStringMarshal, ppwszString, "HRESULT")
        return result
    }

    /**
     * Converts an encoded string to a binary data BLOB.
     * @param {Integer} Flags Value passed to the <i>dwFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptstringtobinarya">CryptStringToBinary</a> function. For valid values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptstringtobinarya">CryptStringToBinary</a> .
     * @param {PWSTR} pwszString Encoded string to be converted to a binary data BLOB.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobBinary A pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that receives the binary data.
     * @param {Pointer<Integer>} pdwSkip A pointer to <b>LONG</b> that receives the number of characters in any skipped strings up to the beginning of actual base64 or hexadecimal strings.
     * @param {Pointer<Integer>} pdwFlags A pointer to <b>LONG</b> that receives the actual format used in the conversion
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-stringtobinaryblob
     */
    stringToBinaryBlob(Flags, pwszString, pblobBinary, pdwSkip, pdwFlags) {
        pwszString := pwszString is String ? StrPtr(pwszString) : pwszString

        pdwSkipMarshal := pdwSkip is VarRef ? "int*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(96, this, "int", Flags, "ptr", pwszString, CRYPT_INTEGER_BLOB.Ptr, pblobBinary, pdwSkipMarshal, pdwSkip, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Adds an extension to the request.
     * @param {Integer} Flags Specifies whether the extension is critical. 
     * If <b>TRUE</b>, the extension being added is critical. If <b>FALSE</b>, it is not critical.
     * @param {PWSTR} pwszName A pointer to a null-terminated wide character string that represents the Object Identifier (OID) for the extension name.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobValue A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the extension value.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>, with S_OK returned if the call is successful.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-addextensiontorequestwstr
     */
    addExtensionToRequestWStr(Flags, pwszName, pblobValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(97, this, "int", Flags, "ptr", pwszName, CRYPT_INTEGER_BLOB.Ptr, pblobValue, "HRESULT")
        return result
    }

    /**
     * Adds an attribute to the certificate request.
     * @param {Integer} Flags This parameter is reserved for future use and must be set to zero.
     * @param {PWSTR} pwszName A pointer to a null-terminated wide character string that represents the object identifier (OID) for the attribute name.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobValue A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the attribute value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-addattributetorequestwstr
     */
    addAttributeToRequestWStr(Flags, pwszName, pblobValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(98, this, "int", Flags, "ptr", pwszName, CRYPT_INTEGER_BLOB.Ptr, pblobValue, "HRESULT")
        return result
    }

    /**
     * Adds an unauthenticated name-value string pair to the request.
     * @param {Integer} Flags This parameter is reserved for future use and must be set to zero.
     * @param {PWSTR} pwszName A pointer to a null-terminated wide character string that represents the name portion of the name-value pair.
     * @param {PWSTR} pwszValue A pointer to a null-terminated wide character string that represents the value portion of the name-value pair.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-addnamevaluepairtorequestwstr
     */
    addNameValuePairToRequestWStr(Flags, pwszName, pwszValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(99, this, "int", Flags, "ptr", pwszName, "ptr", pwszValue, "HRESULT")
        return result
    }

    /**
     * Removes all extensions from the request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-resetextensions
     */
    resetExtensions() {
        result := ComCall(100, this, "HRESULT")
        return result
    }

    /**
     * Removes all attributes from the request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-resetattributes
     */
    resetAttributes() {
        result := ComCall(101, this, "HRESULT")
        return result
    }

    /**
     * Creates a PKCS (IEnroll4.createRequestWStr)
     * @param {CERT_CREATE_REQUEST_FLAGS} Flags 
     * @param {PWSTR} pwszDNName A pointer to a <b>null</b>-terminated Unicode string that contains the distinguished name (DN) of the entity for which the request is being made. The DN name must follow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> naming convention, for example "CN=User, O=Microsoft". If a two-letter prefix does not exist, an object identifier (OID) may be provided instead. This parameter may be <b>NULL</b>.
     * @param {PWSTR} pwszUsage A pointer to a <b>null</b>-terminated Unicode string that contains the OID that describes the purpose of the certificate being generated, for example, individual or commercial Authenticode certificate, or client authentication. You can also specify multiple OIDs separated by a comma.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobRequest A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that receives the request.
     * 
     * When you have finished using this memory, free it by passing the <b>pbData</b> member of this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-createrequestwstr
     */
    createRequestWStr(Flags, pwszDNName, pwszUsage, pblobRequest) {
        pwszDNName := pwszDNName is String ? StrPtr(pwszDNName) : pwszDNName
        pwszUsage := pwszUsage is String ? StrPtr(pwszUsage) : pwszUsage

        result := ComCall(102, this, CERT_CREATE_REQUEST_FLAGS, Flags, "ptr", pwszDNName, "ptr", pwszUsage, CRYPT_INTEGER_BLOB.Ptr, pblobRequest, "HRESULT")
        return result
    }

    /**
     * Creates a PKCS (IEnroll4.createFileRequestWStr)
     * @param {CERT_CREATE_REQUEST_FLAGS} Flags 
     * @param {PWSTR} pwszDNName A pointer to a <b>null</b>-terminated wide character string that represents the distinguished name (DN) of the entity for which the request is being made. The DN name must follow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> naming convention, for example "CN=User, O=Microsoft". If a two-letter prefix does not exist, an object identifier (OID) may be provided instead. This parameter may be <b>NULL</b>.
     * @param {PWSTR} pwszUsage A pointer to a <b>null</b>-terminated wide character string for the OID that describes the purpose of the certificate being generated, for example, individual or commercial Authenticode certificate, or client authentication. You can also specify multiple OIDs separated by a comma.
     * @param {PWSTR} pwszRequestFileName A pointer to a <b>null</b>-terminated wide character string that contains the name of the file that will receive the request.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-createfilerequestwstr
     */
    createFileRequestWStr(Flags, pwszDNName, pwszUsage, pwszRequestFileName) {
        pwszDNName := pwszDNName is String ? StrPtr(pwszDNName) : pwszDNName
        pwszUsage := pwszUsage is String ? StrPtr(pwszUsage) : pwszUsage
        pwszRequestFileName := pwszRequestFileName is String ? StrPtr(pwszRequestFileName) : pwszRequestFileName

        result := ComCall(103, this, CERT_CREATE_REQUEST_FLAGS, Flags, "ptr", pwszDNName, "ptr", pwszUsage, "ptr", pwszRequestFileName, "HRESULT")
        return result
    }

    /**
     * Accepts delivery of the credentials issued in response to an earlier call to createRequestWStr and places the credentials in the appropriate store.
     * @remarks
     * The response must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a PKCS #7 or a full CMC response; however, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobResponse A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the response.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-acceptresponseblob
     */
    acceptResponseBlob(pblobResponse) {
        result := ComCall(104, this, CRYPT_INTEGER_BLOB.Ptr, pblobResponse, "HRESULT")
        return result
    }

    /**
     * Accepts delivery of the credentials issued in response to an earlier call to createFileRequestWStr, and it places the credentials in the appropriate store.
     * @remarks
     * The response named in the <i>pwszResponseFileName</i> parameter must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a PKCS #7 or a full CMC response; however, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * @param {PWSTR} pwszResponseFileName A pointer to a null-terminated wide character string that represents the name of the file that contains the response.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-acceptfileresponsewstr
     */
    acceptFileResponseWStr(pwszResponseFileName) {
        pwszResponseFileName := pwszResponseFileName is String ? StrPtr(pwszResponseFileName) : pwszResponseFileName

        result := ComCall(105, this, "ptr", pwszResponseFileName, "HRESULT")
        return result
    }

    /**
     * Retrieves the certificate from a certification authority's response.
     * @remarks
     * The response contained in <i>pblobResponse</i> must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a PKCS #7 or a full <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Management over CMS</a> (CMC) response. However, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobResponse A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the response.
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppCertContext A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure  that receives the certificate retrieved from the response.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-getcertcontextfromresponseblob
     */
    getCertContextFromResponseBlob(pblobResponse, ppCertContext) {
        ppCertContextMarshal := ppCertContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(106, this, CRYPT_INTEGER_BLOB.Ptr, pblobResponse, ppCertContextMarshal, ppCertContext, "HRESULT")
        return result
    }

    /**
     * Retrieves the certificate from a file containing a response from a certification authority.
     * @remarks
     * The response contained in <i>pwszResponseFileName</i> must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a PKCS #7 or a full <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Management over CMS</a> (CMC) response. However, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * @param {PWSTR} pwszResponseFileName A pointer to a null-terminated wide character string that represents the name of the file containing the response.
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppCertContext A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that receives the certificate retrieved from the response.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-getcertcontextfromfileresponsewstr
     */
    getCertContextFromFileResponseWStr(pwszResponseFileName, ppCertContext) {
        pwszResponseFileName := pwszResponseFileName is String ? StrPtr(pwszResponseFileName) : pwszResponseFileName

        ppCertContextMarshal := ppCertContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(107, this, "ptr", pwszResponseFileName, ppCertContextMarshal, ppCertContext, "HRESULT")
        return result
    }

    /**
     * Saves the accepted certificate chain and private key in a Personal Information Exchange (PFX) format string. The PFX format is also known as PKCS (IEnroll4.createPFXWStr)
     * @param {PWSTR} pwszPassword A pointer to a null-terminated Unicode string that represents the password for the PFX-format message. This value may be empty or <b>NULL</b> to indicate that no password is used. When you have finished using the password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobPFX A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure  that receives the base64-encoded PFX format certificate information.
     * 
     * When you have finished using this memory, free it by passing the <b>pbData</b> member of this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-createpfxwstr
     */
    createPFXWStr(pwszPassword, pblobPFX) {
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        result := ComCall(108, this, "ptr", pwszPassword, CRYPT_INTEGER_BLOB.Ptr, pblobPFX, "HRESULT")
        return result
    }

    /**
     * Saves the accepted certificate chain and private key in a file in Personal Information Exchange (PFX) format.
     * @param {PWSTR} pwszPassword A pointer to a <b>null</b>-terminated wide character string that represents the password for the PFX-format message. This value may be empty or <b>NULL</b> to indicate that no password is used. When you have finished using the password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {PWSTR} pwszPFXFileName A pointer to a <b>null</b>-terminated wide character string that contains the name of the file that will receive the base64-encoded PFX data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-createfilepfxwstr
     */
    createFilePFXWStr(pwszPassword, pwszPFXFileName) {
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword
        pwszPFXFileName := pwszPFXFileName is String ? StrPtr(pwszPFXFileName) : pwszPFXFileName

        result := ComCall(109, this, "ptr", pwszPassword, "ptr", pwszPFXFileName, "HRESULT")
        return result
    }

    /**
     * Sets properties for a pending request.
     * @param {Integer} lRequestID Identifier for the request, as assigned by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA).
     * @param {PWSTR} pwszCADNS A pointer to a null-terminated wide character string that represents the CA's Domain Name System (DNS) name. This parameter cannot be null.
     * @param {PWSTR} pwszCAName A pointer to a null-terminated wide character string that represents the CA's name. This parameter cannot be null.
     * @param {PWSTR} pwszFriendlyName A pointer to a null-terminated wide character string that represents the CA's display name. This parameter may be null.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-setpendingrequestinfowstr
     */
    setPendingRequestInfoWStr(lRequestID, pwszCADNS, pwszCAName, pwszFriendlyName) {
        pwszCADNS := pwszCADNS is String ? StrPtr(pwszCADNS) : pwszCADNS
        pwszCAName := pwszCAName is String ? StrPtr(pwszCAName) : pwszCAName
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        result := ComCall(110, this, "int", lRequestID, "ptr", pwszCADNS, "ptr", pwszCAName, "ptr", pwszFriendlyName, "HRESULT")
        return result
    }

    /**
     * Enumerates pending certificate requests and retrieves a specified property from each.
     * @param {Integer} lIndex Specifies the ordinal position of the pending request whose property will be retrieved. Specify zero for the first request.
     * @param {PENDING_REQUEST_DESIRED_PROPERTY} lDesiredProperty 
     * @param {Pointer<Void>} ppProperty A pointer to a <b>VOID</b> that receives the value of the retrieved property.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * 
     * If the following values are specified for <i>lDesiredProperty</i>, this method returns E_NOTIMPL:
     * 
     * <ul>
     * <li>XEPR_DATE</li>
     * <li>XEPR_V1TEMPLATENAME</li>
     * <li>XEPR_V2TEMPLATEOID</li>
     * <li>XEPR_VERSION</li>
     * </ul>
     * 
     * 
     * If you specify any other value for <i>lDesiredProperty</i>, this method returns E_INVALIDARG.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-enumpendingrequestwstr
     */
    enumPendingRequestWStr(lIndex, lDesiredProperty, ppProperty) {
        ppPropertyMarshal := ppProperty is VarRef ? "ptr" : "ptr"

        result := ComCall(111, this, "int", lIndex, PENDING_REQUEST_DESIRED_PROPERTY, lDesiredProperty, ppPropertyMarshal, ppProperty, "HRESULT")
        return result
    }

    /**
     * Removes a pending request from the client's request store.
     * @param {CRYPT_INTEGER_BLOB} thumbPrintBlob <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the thumbprint, or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a>, of the certificate data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-removependingrequestwstr
     */
    removePendingRequestWStr(thumbPrintBlob) {
        result := ComCall(112, this, CRYPT_INTEGER_BLOB, thumbPrintBlob, "HRESULT")
        return result
    }

    /**
     * Retrieves size information for the signature and exchange keys.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> does not support this method, an error is returned.
     * 
     * For additional details on the XEKL_KEYSIZE_INC value, see PP_SIG_KEYSIZE_INC usage in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptgetprovparam">CryptGetProvParam</a> reference page.
     * @param {XEKL_KEYSIZE} lSizeSpec 
     * @param {XEKL_KEYSPEC} lKeySpec 
     * @param {Pointer<Integer>} pdwKeySize A pointer to <b>LONG</b> that receives the key size information, in bits.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-getkeylenex
     */
    GetKeyLenEx(lSizeSpec, lKeySpec, pdwKeySize) {
        pdwKeySizeMarshal := pdwKeySize is VarRef ? "int*" : "ptr"

        result := ComCall(113, this, XEKL_KEYSIZE, lSizeSpec, XEKL_KEYSPEC, lKeySpec, pdwKeySizeMarshal, pdwKeySize, "HRESULT")
        return result
    }

    /**
     * The same as InstallPKCS7Blob except that it returns the number of certificates actually installed in local stores.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains a certificate or chain of certificates.
     * @param {Pointer<Integer>} plCertInstalled Returns the number of certificates installed into local stores.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-installpkcs7blobex
     */
    InstallPKCS7BlobEx(pBlobPKCS7, plCertInstalled) {
        plCertInstalledMarshal := plCertInstalled is VarRef ? "int*" : "ptr"

        result := ComCall(114, this, CRYPT_INTEGER_BLOB.Ptr, pBlobPKCS7, plCertInstalledMarshal, plCertInstalled, "HRESULT")
        return result
    }

    /**
     * Adds a certificate template (also known as certificate type) to a request.
     * @remarks
     * This method supports only the new request method, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll4-createrequestwstr">createRequestWStr</a>. It does not support the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-ienroll-createpkcs10wstr">createPKCS10WStr</a> method.
     * 
     * This method can be called multiple times to establish multiple certificate templates for the request.
     * @param {ADDED_CERT_TYPE} lType 
     * @param {PWSTR} pwszOIDOrName A pointer to a null-terminated character string that represents the fully qualified name of the certificate template that is being added to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a>. This value is interpreted by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>.
     * @param {Integer} lMajorVersion Value that specifies the major version of the template. This parameter is ignored if <i>lType</i> is XECT_EXTENSION_V1.
     * @param {BOOL} fMinorVersion Value that specifies whether a minor version of the template is used. This parameter is ignored if <i>lType</i> is XECT_EXTENSION_V1.
     * @param {Integer} lMinorVersion Value that specifies the minor version of the template. This parameter is ignored if <i>lType</i> is XECT_EXTENSION_V1 or if <i>fMinorVersion</i> is <b>FALSE</b>.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>, with S_OK returned if the call is successful.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-addcerttypetorequestwstrex
     */
    AddCertTypeToRequestWStrEx(lType, pwszOIDOrName, lMajorVersion, fMinorVersion, lMinorVersion) {
        pwszOIDOrName := pwszOIDOrName is String ? StrPtr(pwszOIDOrName) : pwszOIDOrName

        result := ComCall(115, this, ADDED_CERT_TYPE, lType, "ptr", pwszOIDOrName, "int", lMajorVersion, BOOL, fMinorVersion, "int", lMinorVersion, "HRESULT")
        return result
    }

    /**
     * Retrieves the type of the specified cryptographic service provider (CSP).
     * @param {PWSTR} pwszProvName A pointer to a null-terminated wide character string that contains the name of the CSP whose type is being requested. This method was first defined in the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nn-xenroll-ienroll4">IEnroll4</a> interface.
     * @param {Pointer<Integer>} plProvType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-getprovidertypewstr
     */
    getProviderTypeWStr(pwszProvName, plProvType) {
        pwszProvName := pwszProvName is String ? StrPtr(pwszProvName) : pwszProvName

        plProvTypeMarshal := plProvType is VarRef ? "int*" : "ptr"

        result := ComCall(116, this, "ptr", pwszProvName, plProvTypeMarshal, plProvType, "HRESULT")
        return result
    }

    /**
     * The IEnroll4::addBlobPropertyToCertificateWStr method adds a BLOB property to a certificate.
     * @param {Integer} lPropertyId The identifier of the BLOB property to add to the certificate.
     * @param {Integer} lReserved This parameter is reserved. Must be zero.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobProperty A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the data for  the BLOB property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-addblobpropertytocertificatewstr
     */
    addBlobPropertyToCertificateWStr(lPropertyId, lReserved, pBlobProperty) {
        result := ComCall(117, this, "int", lPropertyId, "int", lReserved, CRYPT_INTEGER_BLOB.Ptr, pBlobProperty, "HRESULT")
        return result
    }

    /**
     * The SetSignerCertificate method specifies the signer's certificate. This method was first defined in the IEnroll4 interface.
     * @param {Pointer<CERT_CONTEXT>} pSignerCert A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that represents the signer's certificate.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-setsignercertificate
     */
    SetSignerCertificate(pSignerCert) {
        result := ComCall(118, this, CERT_CONTEXT.Ptr, pSignerCert, "HRESULT")
        return result
    }

    /**
     * The ClientId property sets or retrieves a client ID request attribute. The client ID request attribute indicates the source of the certificate request. This property was first defined in the IEnroll4 interface. (Put)
     * @param {Integer} lClientId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-put_clientid
     */
    put_ClientId(lClientId) {
        result := ComCall(119, this, "int", lClientId, "HRESULT")
        return result
    }

    /**
     * The ClientId property sets or retrieves a client ID request attribute. The client ID request attribute indicates the source of the certificate request. This property was first defined in the IEnroll4 interface. (Get)
     * @param {Pointer<Integer>} plClientId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-get_clientid
     */
    get_ClientId(plClientId) {
        plClientIdMarshal := plClientId is VarRef ? "int*" : "ptr"

        result := ComCall(120, this, plClientIdMarshal, plClientId, "HRESULT")
        return result
    }

    /**
     * The IncludeSubjectKeyID property of IEnroll4 determines whether the subject key ID extension is added to the certificate request that is generated. (Put)
     * @param {BOOL} fInclude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-put_includesubjectkeyid
     */
    put_IncludeSubjectKeyID(fInclude) {
        result := ComCall(121, this, BOOL, fInclude, "HRESULT")
        return result
    }

    /**
     * The IncludeSubjectKeyID property of IEnroll4 determines whether the subject key ID extension is added to the certificate request that is generated. (Get)
     * @param {Pointer<BOOL>} pfInclude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-ienroll4-get_includesubjectkeyid
     */
    get_IncludeSubjectKeyID(pfInclude) {
        pfIncludeMarshal := pfInclude is VarRef ? "int*" : "ptr"

        result := ComCall(122, this, pfIncludeMarshal, pfInclude, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEnroll4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_ThumbPrintWStr := CallbackCreate(GetMethod(implObj, "put_ThumbPrintWStr"), flags, 2)
        this.vtbl.get_ThumbPrintWStr := CallbackCreate(GetMethod(implObj, "get_ThumbPrintWStr"), flags, 2)
        this.vtbl.SetPrivateKeyArchiveCertificate := CallbackCreate(GetMethod(implObj, "SetPrivateKeyArchiveCertificate"), flags, 2)
        this.vtbl.GetPrivateKeyArchiveCertificate := CallbackCreate(GetMethod(implObj, "GetPrivateKeyArchiveCertificate"), flags, 1)
        this.vtbl.binaryBlobToString := CallbackCreate(GetMethod(implObj, "binaryBlobToString"), flags, 4)
        this.vtbl.stringToBinaryBlob := CallbackCreate(GetMethod(implObj, "stringToBinaryBlob"), flags, 6)
        this.vtbl.addExtensionToRequestWStr := CallbackCreate(GetMethod(implObj, "addExtensionToRequestWStr"), flags, 4)
        this.vtbl.addAttributeToRequestWStr := CallbackCreate(GetMethod(implObj, "addAttributeToRequestWStr"), flags, 4)
        this.vtbl.addNameValuePairToRequestWStr := CallbackCreate(GetMethod(implObj, "addNameValuePairToRequestWStr"), flags, 4)
        this.vtbl.resetExtensions := CallbackCreate(GetMethod(implObj, "resetExtensions"), flags, 1)
        this.vtbl.resetAttributes := CallbackCreate(GetMethod(implObj, "resetAttributes"), flags, 1)
        this.vtbl.createRequestWStr := CallbackCreate(GetMethod(implObj, "createRequestWStr"), flags, 5)
        this.vtbl.createFileRequestWStr := CallbackCreate(GetMethod(implObj, "createFileRequestWStr"), flags, 5)
        this.vtbl.acceptResponseBlob := CallbackCreate(GetMethod(implObj, "acceptResponseBlob"), flags, 2)
        this.vtbl.acceptFileResponseWStr := CallbackCreate(GetMethod(implObj, "acceptFileResponseWStr"), flags, 2)
        this.vtbl.getCertContextFromResponseBlob := CallbackCreate(GetMethod(implObj, "getCertContextFromResponseBlob"), flags, 3)
        this.vtbl.getCertContextFromFileResponseWStr := CallbackCreate(GetMethod(implObj, "getCertContextFromFileResponseWStr"), flags, 3)
        this.vtbl.createPFXWStr := CallbackCreate(GetMethod(implObj, "createPFXWStr"), flags, 3)
        this.vtbl.createFilePFXWStr := CallbackCreate(GetMethod(implObj, "createFilePFXWStr"), flags, 3)
        this.vtbl.setPendingRequestInfoWStr := CallbackCreate(GetMethod(implObj, "setPendingRequestInfoWStr"), flags, 5)
        this.vtbl.enumPendingRequestWStr := CallbackCreate(GetMethod(implObj, "enumPendingRequestWStr"), flags, 4)
        this.vtbl.removePendingRequestWStr := CallbackCreate(GetMethod(implObj, "removePendingRequestWStr"), flags, 2)
        this.vtbl.GetKeyLenEx := CallbackCreate(GetMethod(implObj, "GetKeyLenEx"), flags, 4)
        this.vtbl.InstallPKCS7BlobEx := CallbackCreate(GetMethod(implObj, "InstallPKCS7BlobEx"), flags, 3)
        this.vtbl.AddCertTypeToRequestWStrEx := CallbackCreate(GetMethod(implObj, "AddCertTypeToRequestWStrEx"), flags, 6)
        this.vtbl.getProviderTypeWStr := CallbackCreate(GetMethod(implObj, "getProviderTypeWStr"), flags, 3)
        this.vtbl.addBlobPropertyToCertificateWStr := CallbackCreate(GetMethod(implObj, "addBlobPropertyToCertificateWStr"), flags, 4)
        this.vtbl.SetSignerCertificate := CallbackCreate(GetMethod(implObj, "SetSignerCertificate"), flags, 2)
        this.vtbl.put_ClientId := CallbackCreate(GetMethod(implObj, "put_ClientId"), flags, 2)
        this.vtbl.get_ClientId := CallbackCreate(GetMethod(implObj, "get_ClientId"), flags, 2)
        this.vtbl.put_IncludeSubjectKeyID := CallbackCreate(GetMethod(implObj, "put_IncludeSubjectKeyID"), flags, 2)
        this.vtbl.get_IncludeSubjectKeyID := CallbackCreate(GetMethod(implObj, "get_IncludeSubjectKeyID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_ThumbPrintWStr)
        CallbackFree(this.vtbl.get_ThumbPrintWStr)
        CallbackFree(this.vtbl.SetPrivateKeyArchiveCertificate)
        CallbackFree(this.vtbl.GetPrivateKeyArchiveCertificate)
        CallbackFree(this.vtbl.binaryBlobToString)
        CallbackFree(this.vtbl.stringToBinaryBlob)
        CallbackFree(this.vtbl.addExtensionToRequestWStr)
        CallbackFree(this.vtbl.addAttributeToRequestWStr)
        CallbackFree(this.vtbl.addNameValuePairToRequestWStr)
        CallbackFree(this.vtbl.resetExtensions)
        CallbackFree(this.vtbl.resetAttributes)
        CallbackFree(this.vtbl.createRequestWStr)
        CallbackFree(this.vtbl.createFileRequestWStr)
        CallbackFree(this.vtbl.acceptResponseBlob)
        CallbackFree(this.vtbl.acceptFileResponseWStr)
        CallbackFree(this.vtbl.getCertContextFromResponseBlob)
        CallbackFree(this.vtbl.getCertContextFromFileResponseWStr)
        CallbackFree(this.vtbl.createPFXWStr)
        CallbackFree(this.vtbl.createFilePFXWStr)
        CallbackFree(this.vtbl.setPendingRequestInfoWStr)
        CallbackFree(this.vtbl.enumPendingRequestWStr)
        CallbackFree(this.vtbl.removePendingRequestWStr)
        CallbackFree(this.vtbl.GetKeyLenEx)
        CallbackFree(this.vtbl.InstallPKCS7BlobEx)
        CallbackFree(this.vtbl.AddCertTypeToRequestWStrEx)
        CallbackFree(this.vtbl.getProviderTypeWStr)
        CallbackFree(this.vtbl.addBlobPropertyToCertificateWStr)
        CallbackFree(this.vtbl.SetSignerCertificate)
        CallbackFree(this.vtbl.put_ClientId)
        CallbackFree(this.vtbl.get_ClientId)
        CallbackFree(this.vtbl.put_IncludeSubjectKeyID)
        CallbackFree(this.vtbl.get_IncludeSubjectKeyID)
    }
}
