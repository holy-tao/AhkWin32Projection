#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnroll2.ahk

/**
 * The IEnroll4 interface represents the Certificate Enrollment Control and is used primarily to generate certificate requests.
 * @see https://docs.microsoft.com/windows/win32/api//xenroll/nn-xenroll-ienroll4
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnroll4 extends IEnroll2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnroll4
     * @type {Guid}
     */
    static IID => Guid("{f8053fe5-78f4-448f-a0db-41d61b73446b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 91

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ThumbPrintWStr", "get_ThumbPrintWStr", "SetPrivateKeyArchiveCertificate", "GetPrivateKeyArchiveCertificate", "binaryBlobToString", "stringToBinaryBlob", "addExtensionToRequestWStr", "addAttributeToRequestWStr", "addNameValuePairToRequestWStr", "resetExtensions", "resetAttributes", "createRequestWStr", "createFileRequestWStr", "acceptResponseBlob", "acceptFileResponseWStr", "getCertContextFromResponseBlob", "getCertContextFromFileResponseWStr", "createPFXWStr", "createFilePFXWStr", "setPendingRequestInfoWStr", "enumPendingRequestWStr", "removePendingRequestWStr", "GetKeyLenEx", "InstallPKCS7BlobEx", "AddCertTypeToRequestWStrEx", "getProviderTypeWStr", "addBlobPropertyToCertificateWStr", "SetSignerCertificate", "put_ClientId", "get_ClientId", "put_IncludeSubjectKeyID", "get_IncludeSubjectKeyID"]

    /**
     */
    ThumbPrintWStr {
        get => this.get_ThumbPrintWStr()
        set => this.put_ThumbPrintWStr(value)
    }

    /**
     */
    ClientId {
        get => this.get_ClientId()
        set => this.put_ClientId(value)
    }

    /**
     */
    IncludeSubjectKeyID {
        get => this.get_IncludeSubjectKeyID()
        set => this.put_IncludeSubjectKeyID(value)
    }

    /**
     * Sets or retrieves a hash of the certificate data. The thumbprint is used to point to the pending certificate.
     * @param {CRYPT_INTEGER_BLOB} thumbPrintBlob 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-put_thumbprintwstr
     */
    put_ThumbPrintWStr(thumbPrintBlob) {
        result := ComCall(91, this, "ptr", thumbPrintBlob, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a hash of the certificate data. The thumbprint is used to point to the pending certificate.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} thumbPrintBlob 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-get_thumbprintwstr
     */
    get_ThumbPrintWStr(thumbPrintBlob) {
        result := ComCall(92, this, "ptr", thumbPrintBlob, "HRESULT")
        return result
    }

    /**
     * The SetPrivateKeyArchiveCertificate method specifies the certificate used to archive the private key. This method was first defined in the IEnroll4 interface.
     * @param {Pointer<CERT_CONTEXT>} pPrivateKeyArchiveCert A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that specifies the certificate used to archive the private key.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-setprivatekeyarchivecertificate
     */
    SetPrivateKeyArchiveCertificate(pPrivateKeyArchiveCert) {
        result := ComCall(93, this, "ptr", pPrivateKeyArchiveCert, "HRESULT")
        return result
    }

    /**
     * The GetPrivateKeyArchiveCertificate method retrieves the certificate used to archive the private key. This method was first defined in the IEnroll4 interface.
     * @returns {Pointer<CERT_CONTEXT>} Pointer to a <a href="/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that represents the certificate used to archive the private key, or <b>NULL</b> if an error is encountered.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-getprivatekeyarchivecertificate
     */
    GetPrivateKeyArchiveCertificate() {
        result := ComCall(94, this, "ptr")
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
     * <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-binaryblobtostring
     */
    binaryBlobToString(Flags, pblobBinary, ppwszString) {
        ppwszStringMarshal := ppwszString is VarRef ? "ptr*" : "ptr"

        result := ComCall(95, this, "int", Flags, "ptr", pblobBinary, ppwszStringMarshal, ppwszString, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-stringtobinaryblob
     */
    stringToBinaryBlob(Flags, pwszString, pblobBinary, pdwSkip, pdwFlags) {
        pwszString := pwszString is String ? StrPtr(pwszString) : pwszString

        pdwSkipMarshal := pdwSkip is VarRef ? "int*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "int*" : "ptr"

        result := ComCall(96, this, "int", Flags, "ptr", pwszString, "ptr", pblobBinary, pdwSkipMarshal, pdwSkip, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Adds an extension to the request.
     * @param {Integer} Flags Specifies whether the extension is critical. 
     * If <b>TRUE</b>, the extension being added is critical. If <b>FALSE</b>, it is not critical.
     * @param {PWSTR} pwszName A pointer to a null-terminated wide character string that represents the Object Identifier (OID) for the extension name.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobValue A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the extension value.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>, with S_OK returned if the call is successful.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-addextensiontorequestwstr
     */
    addExtensionToRequestWStr(Flags, pwszName, pblobValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(97, this, "int", Flags, "ptr", pwszName, "ptr", pblobValue, "HRESULT")
        return result
    }

    /**
     * Adds an attribute to the certificate request.
     * @param {Integer} Flags This parameter is reserved for future use and must be set to zero.
     * @param {PWSTR} pwszName A pointer to a null-terminated wide character string that represents the object identifier (OID) for the attribute name.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobValue A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the attribute value.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-addattributetorequestwstr
     */
    addAttributeToRequestWStr(Flags, pwszName, pblobValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(98, this, "int", Flags, "ptr", pwszName, "ptr", pblobValue, "HRESULT")
        return result
    }

    /**
     * Adds an unauthenticated name-value string pair to the request.
     * @param {Integer} Flags This parameter is reserved for future use and must be set to zero.
     * @param {PWSTR} pwszName A pointer to a null-terminated wide character string that represents the name portion of the name-value pair.
     * @param {PWSTR} pwszValue A pointer to a null-terminated wide character string that represents the value portion of the name-value pair.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-addnamevaluepairtorequestwstr
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
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-resetextensions
     */
    resetExtensions() {
        result := ComCall(100, this, "HRESULT")
        return result
    }

    /**
     * Removes all attributes from the request.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-resetattributes
     */
    resetAttributes() {
        result := ComCall(101, this, "HRESULT")
        return result
    }

    /**
     * Creates a PKCS
     * @param {Integer} Flags 
     * @param {PWSTR} pwszDNName A pointer to a <b>null</b>-terminated Unicode string that contains the distinguished name (DN) of the entity for which the request is being made. The DN name must follow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> naming convention, for example "CN=User, O=Microsoft". If a two-letter prefix does not exist, an object identifier (OID) may be provided instead. This parameter may be <b>NULL</b>.
     * @param {PWSTR} pwszUsage A pointer to a <b>null</b>-terminated Unicode string that contains the OID that describes the purpose of the certificate being generated, for example, individual or commercial Authenticode certificate, or client authentication. You can also specify multiple OIDs separated by a comma.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobRequest A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that receives the request.
     * 
     * When you have finished using this memory, free it by passing the <b>pbData</b> member of this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-createrequestwstr
     */
    createRequestWStr(Flags, pwszDNName, pwszUsage, pblobRequest) {
        pwszDNName := pwszDNName is String ? StrPtr(pwszDNName) : pwszDNName
        pwszUsage := pwszUsage is String ? StrPtr(pwszUsage) : pwszUsage

        result := ComCall(102, this, "int", Flags, "ptr", pwszDNName, "ptr", pwszUsage, "ptr", pblobRequest, "HRESULT")
        return result
    }

    /**
     * Creates a PKCS
     * @param {Integer} Flags 
     * @param {PWSTR} pwszDNName A pointer to a <b>null</b>-terminated wide character string that represents the distinguished name (DN) of the entity for which the request is being made. The DN name must follow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> naming convention, for example "CN=User, O=Microsoft". If a two-letter prefix does not exist, an object identifier (OID) may be provided instead. This parameter may be <b>NULL</b>.
     * @param {PWSTR} pwszUsage A pointer to a <b>null</b>-terminated wide character string for the OID that describes the purpose of the certificate being generated, for example, individual or commercial Authenticode certificate, or client authentication. You can also specify multiple OIDs separated by a comma.
     * @param {PWSTR} pwszRequestFileName A pointer to a <b>null</b>-terminated wide character string that contains the name of the file that will receive the request.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-createfilerequestwstr
     */
    createFileRequestWStr(Flags, pwszDNName, pwszUsage, pwszRequestFileName) {
        pwszDNName := pwszDNName is String ? StrPtr(pwszDNName) : pwszDNName
        pwszUsage := pwszUsage is String ? StrPtr(pwszUsage) : pwszUsage
        pwszRequestFileName := pwszRequestFileName is String ? StrPtr(pwszRequestFileName) : pwszRequestFileName

        result := ComCall(103, this, "int", Flags, "ptr", pwszDNName, "ptr", pwszUsage, "ptr", pwszRequestFileName, "HRESULT")
        return result
    }

    /**
     * Accepts delivery of the credentials issued in response to an earlier call to createRequestWStr and places the credentials in the appropriate store.
     * @remarks
     * 
     * The response must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a PKCS #7 or a full CMC response; however, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * 
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobResponse A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the response.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-acceptresponseblob
     */
    acceptResponseBlob(pblobResponse) {
        result := ComCall(104, this, "ptr", pblobResponse, "HRESULT")
        return result
    }

    /**
     * Accepts delivery of the credentials issued in response to an earlier call to createFileRequestWStr, and it places the credentials in the appropriate store.
     * @remarks
     * 
     * The response named in the <i>pwszResponseFileName</i> parameter must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a PKCS #7 or a full CMC response; however, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * 
     * 
     * @param {PWSTR} pwszResponseFileName A pointer to a null-terminated wide character string that represents the name of the file that contains the response.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-acceptfileresponsewstr
     */
    acceptFileResponseWStr(pwszResponseFileName) {
        pwszResponseFileName := pwszResponseFileName is String ? StrPtr(pwszResponseFileName) : pwszResponseFileName

        result := ComCall(105, this, "ptr", pwszResponseFileName, "HRESULT")
        return result
    }

    /**
     * Retrieves the certificate from a certification authority's response.
     * @remarks
     * 
     * The response contained in <i>pblobResponse</i> must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a PKCS #7 or a full <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Management over CMS</a> (CMC) response. However, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * 
     * 
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobResponse A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the response.
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppCertContext A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure  that receives the certificate retrieved from the response.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-getcertcontextfromresponseblob
     */
    getCertContextFromResponseBlob(pblobResponse, ppCertContext) {
        ppCertContextMarshal := ppCertContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(106, this, "ptr", pblobResponse, ppCertContextMarshal, ppCertContext, "HRESULT")
        return result
    }

    /**
     * Retrieves the certificate from a file containing a response from a certification authority.
     * @remarks
     * 
     * The response contained in <i>pwszResponseFileName</i> must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a PKCS #7 or a full <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Management over CMS</a> (CMC) response. However, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * 
     * 
     * @param {PWSTR} pwszResponseFileName A pointer to a null-terminated wide character string that represents the name of the file containing the response.
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppCertContext A pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that receives the certificate retrieved from the response.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-getcertcontextfromfileresponsewstr
     */
    getCertContextFromFileResponseWStr(pwszResponseFileName, ppCertContext) {
        pwszResponseFileName := pwszResponseFileName is String ? StrPtr(pwszResponseFileName) : pwszResponseFileName

        ppCertContextMarshal := ppCertContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(107, this, "ptr", pwszResponseFileName, ppCertContextMarshal, ppCertContext, "HRESULT")
        return result
    }

    /**
     * Saves the accepted certificate chain and private key in a Personal Information Exchange (PFX) format string. The PFX format is also known as PKCS
     * @param {PWSTR} pwszPassword A pointer to a null-terminated Unicode string that represents the password for the PFX-format message. This value may be empty or <b>NULL</b> to indicate that no password is used. When you have finished using the password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pblobPFX A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure  that receives the base64-encoded PFX format certificate information.
     * 
     * When you have finished using this memory, free it by passing the <b>pbData</b> member of this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-createpfxwstr
     */
    createPFXWStr(pwszPassword, pblobPFX) {
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        result := ComCall(108, this, "ptr", pwszPassword, "ptr", pblobPFX, "HRESULT")
        return result
    }

    /**
     * Saves the accepted certificate chain and private key in a file in Personal Information Exchange (PFX) format.
     * @param {PWSTR} pwszPassword A pointer to a <b>null</b>-terminated wide character string that represents the password for the PFX-format message. This value may be empty or <b>NULL</b> to indicate that no password is used. When you have finished using the password, remove the sensitive information from memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a>. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {PWSTR} pwszPFXFileName A pointer to a <b>null</b>-terminated wide character string that contains the name of the file that will receive the base64-encoded PFX data.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-createfilepfxwstr
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
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-setpendingrequestinfowstr
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
     * @param {Integer} lDesiredProperty 
     * @param {Pointer<Void>} ppProperty A pointer to a <b>VOID</b> that receives the value of the retrieved property.
     * @returns {HRESULT} If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-enumpendingrequestwstr
     */
    enumPendingRequestWStr(lIndex, lDesiredProperty, ppProperty) {
        ppPropertyMarshal := ppProperty is VarRef ? "ptr" : "ptr"

        result := ComCall(111, this, "int", lIndex, "int", lDesiredProperty, ppPropertyMarshal, ppProperty, "HRESULT")
        return result
    }

    /**
     * Removes a pending request from the client's request store.
     * @param {CRYPT_INTEGER_BLOB} thumbPrintBlob <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that represents the thumbprint, or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a>, of the certificate data.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-removependingrequestwstr
     */
    removePendingRequestWStr(thumbPrintBlob) {
        result := ComCall(112, this, "ptr", thumbPrintBlob, "HRESULT")
        return result
    }

    /**
     * Retrieves size information for the signature and exchange keys.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> does not support this method, an error is returned.
     * 
     * For additional details on the XEKL_KEYSIZE_INC value, see PP_SIG_KEYSIZE_INC usage in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptgetprovparam">CryptGetProvParam</a> reference page.
     * 
     * 
     * @param {Integer} lSizeSpec 
     * @param {Integer} lKeySpec 
     * @param {Pointer<Integer>} pdwKeySize A pointer to <b>LONG</b> that receives the key size information, in bits.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-getkeylenex
     */
    GetKeyLenEx(lSizeSpec, lKeySpec, pdwKeySize) {
        pdwKeySizeMarshal := pdwKeySize is VarRef ? "int*" : "ptr"

        result := ComCall(113, this, "int", lSizeSpec, "int", lKeySpec, pdwKeySizeMarshal, pdwKeySize, "HRESULT")
        return result
    }

    /**
     * The same as InstallPKCS7Blob except that it returns the number of certificates actually installed in local stores.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pBlobPKCS7 A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains a certificate or chain of certificates.
     * @param {Pointer<Integer>} plCertInstalled Returns the number of certificates installed into local stores.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-installpkcs7blobex
     */
    InstallPKCS7BlobEx(pBlobPKCS7, plCertInstalled) {
        plCertInstalledMarshal := plCertInstalled is VarRef ? "int*" : "ptr"

        result := ComCall(114, this, "ptr", pBlobPKCS7, plCertInstalledMarshal, plCertInstalled, "HRESULT")
        return result
    }

    /**
     * Adds a certificate template (also known as certificate type) to a request.
     * @param {Integer} lType 
     * @param {PWSTR} pwszOIDOrName A pointer to a null-terminated character string that represents the fully qualified name of the certificate template that is being added to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a>. This value is interpreted by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>.
     * @param {Integer} lMajorVersion Value that specifies the major version of the template. This parameter is ignored if <i>lType</i> is XECT_EXTENSION_V1.
     * @param {BOOL} fMinorVersion Value that specifies whether a minor version of the template is used. This parameter is ignored if <i>lType</i> is XECT_EXTENSION_V1.
     * @param {Integer} lMinorVersion Value that specifies the minor version of the template. This parameter is ignored if <i>lType</i> is XECT_EXTENSION_V1 or if <i>fMinorVersion</i> is <b>FALSE</b>.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>, with S_OK returned if the call is successful.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-addcerttypetorequestwstrex
     */
    AddCertTypeToRequestWStrEx(lType, pwszOIDOrName, lMajorVersion, fMinorVersion, lMinorVersion) {
        pwszOIDOrName := pwszOIDOrName is String ? StrPtr(pwszOIDOrName) : pwszOIDOrName

        result := ComCall(115, this, "int", lType, "ptr", pwszOIDOrName, "int", lMajorVersion, "int", fMinorVersion, "int", lMinorVersion, "HRESULT")
        return result
    }

    /**
     * Retrieves the type of the specified cryptographic service provider (CSP).
     * @param {PWSTR} pwszProvName A pointer to a null-terminated wide character string that contains the name of the CSP whose type is being requested. This method was first defined in the <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nn-xenroll-ienroll4">IEnroll4</a> interface.
     * @param {Pointer<Integer>} plProvType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-getprovidertypewstr
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
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-addblobpropertytocertificatewstr
     */
    addBlobPropertyToCertificateWStr(lPropertyId, lReserved, pBlobProperty) {
        result := ComCall(117, this, "int", lPropertyId, "int", lReserved, "ptr", pBlobProperty, "HRESULT")
        return result
    }

    /**
     * The SetSignerCertificate method specifies the signer's certificate. This method was first defined in the IEnroll4 interface.
     * @param {Pointer<CERT_CONTEXT>} pSignerCert A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that represents the signer's certificate.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-setsignercertificate
     */
    SetSignerCertificate(pSignerCert) {
        result := ComCall(118, this, "ptr", pSignerCert, "HRESULT")
        return result
    }

    /**
     * The ClientId property sets or retrieves a client ID request attribute. The client ID request attribute indicates the source of the certificate request. This property was first defined in the IEnroll4 interface.
     * @param {Integer} lClientId 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-put_clientid
     */
    put_ClientId(lClientId) {
        result := ComCall(119, this, "int", lClientId, "HRESULT")
        return result
    }

    /**
     * The ClientId property sets or retrieves a client ID request attribute. The client ID request attribute indicates the source of the certificate request. This property was first defined in the IEnroll4 interface.
     * @param {Pointer<Integer>} plClientId 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-get_clientid
     */
    get_ClientId(plClientId) {
        plClientIdMarshal := plClientId is VarRef ? "int*" : "ptr"

        result := ComCall(120, this, plClientIdMarshal, plClientId, "HRESULT")
        return result
    }

    /**
     * The IncludeSubjectKeyID property of IEnroll4 determines whether the subject key ID extension is added to the certificate request that is generated.
     * @param {BOOL} fInclude 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-put_includesubjectkeyid
     */
    put_IncludeSubjectKeyID(fInclude) {
        result := ComCall(121, this, "int", fInclude, "HRESULT")
        return result
    }

    /**
     * The IncludeSubjectKeyID property of IEnroll4 determines whether the subject key ID extension is added to the certificate request that is generated.
     * @param {Pointer<BOOL>} pfInclude 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-ienroll4-get_includesubjectkeyid
     */
    get_IncludeSubjectKeyID(pfInclude) {
        pfIncludeMarshal := pfInclude is VarRef ? "int*" : "ptr"

        result := ComCall(122, this, pfIncludeMarshal, pfInclude, "HRESULT")
        return result
    }
}
