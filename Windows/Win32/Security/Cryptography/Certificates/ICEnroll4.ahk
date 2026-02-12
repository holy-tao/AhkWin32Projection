#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\ICEnroll3.ahk

/**
 * The ICEnroll4 interface is one of several interfaces that represent the Certificate Enrollment Control.
 * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nn-xenroll-icenroll4
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICEnroll4 extends ICEnroll3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICEnroll4
     * @type {Guid}
     */
    static IID => Guid("{c1f1188a-2eb5-4a80-841b-7e729a356d90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 83

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_PrivateKeyArchiveCertificate", "get_PrivateKeyArchiveCertificate", "put_ThumbPrint", "get_ThumbPrint", "binaryToString", "stringToBinary", "addExtensionToRequest", "addAttributeToRequest", "addNameValuePairToRequest", "resetExtensions", "resetAttributes", "createRequest", "createFileRequest", "acceptResponse", "acceptFileResponse", "getCertFromResponse", "getCertFromFileResponse", "createPFX", "createFilePFX", "setPendingRequestInfo", "enumPendingRequest", "removePendingRequest", "GetKeyLenEx", "InstallPKCS7Ex", "addCertTypeToRequestEx", "getProviderType", "put_SignerCertificate", "put_ClientId", "get_ClientId", "addBlobPropertyToCertificate", "resetBlobProperties", "put_IncludeSubjectKeyID", "get_IncludeSubjectKeyID"]

    /**
     * @type {BSTR} 
     */
    PrivateKeyArchiveCertificate {
        get => this.get_PrivateKeyArchiveCertificate()
        set => this.put_PrivateKeyArchiveCertificate(value)
    }

    /**
     * @type {BSTR} 
     */
    ThumbPrint {
        get => this.get_ThumbPrint()
        set => this.put_ThumbPrint(value)
    }

    /**
     * @type {HRESULT} 
     */
    SignerCertificate {
        set => this.put_SignerCertificate(value)
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
     * Sets or retrieves the certificate that is used to archive a private key with a PKCS (Put)
     * @param {BSTR} bstrCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-put_privatekeyarchivecertificate
     */
    put_PrivateKeyArchiveCertificate(bstrCert) {
        if(bstrCert is String) {
            pin := BSTR.Alloc(bstrCert)
            bstrCert := pin.Value
        }

        result := ComCall(83, this, "ptr", bstrCert, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves the certificate that is used to archive a private key with a PKCS (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-get_privatekeyarchivecertificate
     */
    get_PrivateKeyArchiveCertificate() {
        pbstrCert := BSTR()
        result := ComCall(84, this, "ptr", pbstrCert, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrCert
    }

    /**
     * Sets or retrieves a hash of the certificate data. (Put)
     * @remarks
     * The thumbprint is used to point to a pending certificate.
     * @param {BSTR} bstrThumbPrint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-put_thumbprint
     */
    put_ThumbPrint(bstrThumbPrint) {
        if(bstrThumbPrint is String) {
            pin := BSTR.Alloc(bstrThumbPrint)
            bstrThumbPrint := pin.Value
        }

        result := ComCall(85, this, "ptr", bstrThumbPrint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves a hash of the certificate data. (Get)
     * @remarks
     * The thumbprint is used to point to a pending certificate.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-get_thumbprint
     */
    get_ThumbPrint() {
        pbstrThumbPrint := BSTR()
        result := ComCall(86, this, "ptr", pbstrThumbPrint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrThumbPrint
    }

    /**
     * Converts a binary data BLOB to a string. This method was first defined in the ICEnroll4 interface.
     * @param {Integer} Flags The value passed to the <i>dwFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptbinarytostringa">CryptBinaryToString</a> function. For a description of possible values, see 
     * <b>CryptBinaryToString</b>.
     * @param {BSTR} strBinary A binary data BLOB to be converted to a string.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that receives the encoded data. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-binarytostring
     */
    binaryToString(Flags, strBinary) {
        if(strBinary is String) {
            pin := BSTR.Alloc(strBinary)
            strBinary := pin.Value
        }

        pstrEncoded := BSTR()
        result := ComCall(87, this, "int", Flags, "ptr", strBinary, "ptr", pstrEncoded, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrEncoded
    }

    /**
     * Converts an encoded string to a binary data BLOB. This method was first defined in the ICEnroll4 interface.
     * @param {Integer} Flags A value passed to the <i>dwFlags</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptstringtobinarya">CryptStringToBinary</a> function. For valid values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptstringtobinarya">CryptStringToBinary</a>.
     * @param {BSTR} strEncoded An encoded string to be converted to a binary data <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a>.
     * @returns {BSTR} A pointer to a  <b>BSTR</b> that receives the binary data. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-stringtobinary
     */
    stringToBinary(Flags, strEncoded) {
        if(strEncoded is String) {
            pin := BSTR.Alloc(strEncoded)
            strEncoded := pin.Value
        }

        pstrBinary := BSTR()
        result := ComCall(88, this, "int", Flags, "ptr", strEncoded, "ptr", pstrBinary, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrBinary
    }

    /**
     * The ICEnroll4::addExtensionToRequest method adds an extension to the request.
     * @param {Integer} Flags Specifies whether the extension is critical. 
     * If <b>TRUE</b>, the extension being added is critical. If <b>FALSE</b>, it is not critical.
     * 
     * Note that <b>TRUE</b> is defined (in a Microsoft header file) for C/C++ programmers as one, while  Visual Basic defines the <b>True</b> keyword as negative one. As a result, Visual Basic developers must use one (instead of <b>True</b>) to set this parameter to <b>TRUE</b>. However, to set this parameter to <b>FALSE</b>, Visual Basic developers can use zero or <b>False</b>.
     * @param {BSTR} strName The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that represents the extension name.
     * @param {BSTR} strValue The base64-encoded or binary extension value.
     * @returns {HRESULT} <h3>VB</h3>
     * The return value is an <b>HRESULT</b>, with <b>S_OK</b> returned if the call is successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-addextensiontorequest
     */
    addExtensionToRequest(Flags, strName, strValue) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }
        if(strValue is String) {
            pin := BSTR.Alloc(strValue)
            strValue := pin.Value
        }

        result := ComCall(89, this, "int", Flags, "ptr", strName, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an attribute to the certificate request. This method was first defined in the ICEnroll4 interface.
     * @param {Integer} Flags This parameter is reserved for future use and must be set to zero.
     * @param {BSTR} strName An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that represents the attribute name.
     * @param {BSTR} strValue A base64-encoded or binary attribute value.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-addattributetorequest
     */
    addAttributeToRequest(Flags, strName, strValue) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }
        if(strValue is String) {
            pin := BSTR.Alloc(strValue)
            strValue := pin.Value
        }

        result := ComCall(90, this, "int", Flags, "ptr", strName, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an unauthenticated name-value string pair to the request. This method was first defined in the ICEnroll4 interface.
     * @param {Integer} Flags This parameter is reserved for future use and must be set to zero.
     * @param {BSTR} strName The name portion of the name-value pair.
     * @param {BSTR} strValue The value portion of the name-value pair.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-addnamevaluepairtorequest
     */
    addNameValuePairToRequest(Flags, strName, strValue) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }
        if(strValue is String) {
            pin := BSTR.Alloc(strValue)
            strValue := pin.Value
        }

        result := ComCall(91, this, "int", Flags, "ptr", strName, "ptr", strValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes all extensions from the request. This method was first defined in the ICEnroll4 interface.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-resetextensions
     */
    resetExtensions() {
        result := ComCall(92, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes all attributes from the request. This method was first defined in the ICEnroll4 interface.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-resetattributes
     */
    resetAttributes() {
        result := ComCall(93, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a PKCS (ICEnroll4.createRequest)
     * @remarks
     * When this method is called from script, the method displays a user interface that asks whether the user will allow creation of a  certificate request. If a .pvk or .spc file was specified, the method displays a user interface that asks whether the user will allow a write operation to the file system.
     * @param {Integer} Flags 
     * @param {BSTR} strDNName This parameter can be <b>NULL</b>; otherwise, this parameter specifies the distinguished name (DN) of the entity for which the request is being made. The DN name must follow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> naming convention, for example "CN=User, O=Microsoft". If a two-letter prefix does not exist, an OID may be provided instead.
     * @param {BSTR} Usage An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that describes the purpose of the certificate being generated, for example, individual or commercial Authenticode certificate, or client authentication. You can also specify multiple OIDs separated by a comma.
     * @returns {BSTR} A pointer to a <b>BSTR</b> (BASE64_HEADER format) that receives the request. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-createrequest
     */
    createRequest(Flags, strDNName, Usage) {
        if(strDNName is String) {
            pin := BSTR.Alloc(strDNName)
            strDNName := pin.Value
        }
        if(Usage is String) {
            pin := BSTR.Alloc(Usage)
            Usage := pin.Value
        }

        pstrRequest := BSTR()
        result := ComCall(94, this, "int", Flags, "ptr", strDNName, "ptr", Usage, "ptr", pstrRequest, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrRequest
    }

    /**
     * Creates a PKCS (ICEnroll4.createFileRequest)
     * @remarks
     * When this method is called from script, the method displays a user interface that asks whether the user will allow creation of a  certificate request and whether the user will allow a write operation to the file system.
     * @param {Integer} Flags 
     * @param {BSTR} strDNName This parameter can be <b>NULL</b>; otherwise, this parameter specifies the distinguished name (DN) of the entity for which the request is being made. The DN name must follow the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> naming convention, for example "CN=User, O=Microsoft". If a two-letter prefix does not exist, an OID can be provided instead.
     * @param {BSTR} strUsage An <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that describes the purpose of the request being generated, for example, individual or commercial Authenticode certificate, or client authentication. You can also specify multiple OIDs separated by a comma.
     * @param {BSTR} strRequestFileName The name of the file that will receive the request.
     * @returns {HRESULT} <h3>VB</h3>
     * If the method succeeds, the method returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-createfilerequest
     */
    createFileRequest(Flags, strDNName, strUsage, strRequestFileName) {
        if(strDNName is String) {
            pin := BSTR.Alloc(strDNName)
            strDNName := pin.Value
        }
        if(strUsage is String) {
            pin := BSTR.Alloc(strUsage)
            strUsage := pin.Value
        }
        if(strRequestFileName is String) {
            pin := BSTR.Alloc(strRequestFileName)
            strRequestFileName := pin.Value
        }

        result := ComCall(95, this, "int", Flags, "ptr", strDNName, "ptr", strUsage, "ptr", strRequestFileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Accepts delivery of the credentials issued in response to an earlier call to createRequest and places the credentials in the appropriate store.
     * @remarks
     * The response must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a PKCS #7 or a full CMC response; however, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * 
     * When this method is called from script, the method displays a user interface that asks whether the user will allow installation of a  certificate.
     * @param {BSTR} strResponse A string that represents the base64-encoded response.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-acceptresponse
     */
    acceptResponse(strResponse) {
        if(strResponse is String) {
            pin := BSTR.Alloc(strResponse)
            strResponse := pin.Value
        }

        result := ComCall(96, this, "ptr", strResponse, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Accepts delivery of the credentials issued in response to an earlier call to createFileRequest, and it places the credentials in the appropriate store.
     * @remarks
     * The response named in the <i>strResponseFileName</i> parameter must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a PKCS #7 or a full CMC response; however, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * 
     * When this method is called from script, the method displays a user interface that asks whether the user will allow installation of a  certificate and whether the user will allow a read operation from the file system.
     * @param {BSTR} strResponseFileName Specifies the name of the file that contains the base64-encoded response.
     * @returns {HRESULT} <h3>VB</h3>
     * If the method succeeds, the method returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-acceptfileresponse
     */
    acceptFileResponse(strResponseFileName) {
        if(strResponseFileName is String) {
            pin := BSTR.Alloc(strResponseFileName)
            strResponseFileName := pin.Value
        }

        result := ComCall(97, this, "ptr", strResponseFileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the certificate from a certification authority's response. This method was first defined by the ICEnroll4 interface.
     * @remarks
     * The response contained in <i>strResponse</i> must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">PKCS #7</a> or a full <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Management over CMS</a> (CMC) response. However, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * @param {BSTR} strResponse The base64-encoded response.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that receives the certificate retrieved from the response. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-getcertfromresponse
     */
    getCertFromResponse(strResponse) {
        if(strResponse is String) {
            pin := BSTR.Alloc(strResponse)
            strResponse := pin.Value
        }

        pstrCert := BSTR()
        result := ComCall(98, this, "ptr", strResponse, "ptr", pstrCert, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrCert
    }

    /**
     * Retrieves the certificate from a file containing a response from a certification authority. This method was first defined in the ICEnroll4 interface.
     * @remarks
     * The response contained in <i>strResponseFileName</i> must contain exactly one certificate; a child certificate cannot be present.
     * 
     * The response may be either a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">PKCS #7</a> or a full <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Management over CMS</a> (CMC) response. However, to accept a full CMC response, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) must support <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) encoding of CMC structures.
     * 
     * When this method is called from script, the method displays a user interface that asks whether the user will allow a read operation from the file system.
     * @param {BSTR} strResponseFileName Specifies the name of the file that contains the response.
     * @returns {BSTR} A pointer to a <b>BSTR</b> value that receives the certificate retrieved from the response. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-getcertfromfileresponse
     */
    getCertFromFileResponse(strResponseFileName) {
        if(strResponseFileName is String) {
            pin := BSTR.Alloc(strResponseFileName)
            strResponseFileName := pin.Value
        }

        pstrCert := BSTR()
        result := ComCall(99, this, "ptr", strResponseFileName, "ptr", pstrCert, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrCert
    }

    /**
     * Saves the accepted certificate chain and private key in a Personal Information Exchange (PFX) format string. The PFX format is also known as PKCS (ICEnroll4.createPFX)
     * @remarks
     * This method is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * @param {BSTR} strPassword A password for the PFX-format message. This value can be empty or <b>NULL</b> to indicate that no password is used.  When you have finished using the password, clear it from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that receives the base64-encoded PFX format certificate information. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-createpfx
     */
    createPFX(strPassword) {
        if(strPassword is String) {
            pin := BSTR.Alloc(strPassword)
            strPassword := pin.Value
        }

        pstrPFX := BSTR()
        result := ComCall(100, this, "ptr", strPassword, "ptr", pstrPFX, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrPFX
    }

    /**
     * Saves the accepted certificate chain and private key in a file in Personal Information Exchange (PFX) format. This method was first defined in the ICEnroll4 interface.
     * @remarks
     * When this method is called from script, the method displays a user interface that asks whether the user will allow a write operation to the file system.
     * @param {BSTR} strPassword A password for the PFX; this value can be empty (or <b>NULL</b>) to indicate that no password is used. When you have finished using the password, clear it from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function.  For more information about handling passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {BSTR} strPFXFileName The name of the file that will receive the base64-encoded PFX data.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-createfilepfx
     */
    createFilePFX(strPassword, strPFXFileName) {
        if(strPassword is String) {
            pin := BSTR.Alloc(strPassword)
            strPassword := pin.Value
        }
        if(strPFXFileName is String) {
            pin := BSTR.Alloc(strPFXFileName)
            strPFXFileName := pin.Value
        }

        result := ComCall(101, this, "ptr", strPassword, "ptr", strPFXFileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets properties for a pending request. This method was first defined in the ICEnroll4 interface.
     * @param {Integer} lRequestID An identifier for the request, as assigned by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>.
     * @param {BSTR} strCADNS The Domain Name System (DNS) name of the certification authority. The  <i>strCADNS</i> parameter cannot be <b>NULL</b>.
     * @param {BSTR} strCAName The name of the certification authority. The <i>strCAName</i> parameter cannot be <b>NULL</b>.
     * @param {BSTR} strFriendlyName The display name of the certification authority. The <i>strFriendlyName</i> parameter can be <b>NULL</b>.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-setpendingrequestinfo
     */
    setPendingRequestInfo(lRequestID, strCADNS, strCAName, strFriendlyName) {
        if(strCADNS is String) {
            pin := BSTR.Alloc(strCADNS)
            strCADNS := pin.Value
        }
        if(strCAName is String) {
            pin := BSTR.Alloc(strCAName)
            strCAName := pin.Value
        }
        if(strFriendlyName is String) {
            pin := BSTR.Alloc(strFriendlyName)
            strFriendlyName := pin.Value
        }

        result := ComCall(102, this, "int", lRequestID, "ptr", strCADNS, "ptr", strCAName, "ptr", strFriendlyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates pending certificate requests and retrieves a specified property from each. This method was first defined in the ICEnroll4 interface.
     * @remarks
     * This method is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * @param {Integer} lIndex Specifies the ordinal position of the pending request whose property will be retrieved. Specify zero for the first request.
     * @param {Integer} lDesiredProperty 
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> that receives the value of the retrieved property. 
     * 
     * 
     * 
     * 
     * When you have finished using the <b>VARIANT</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-enumpendingrequest
     */
    enumPendingRequest(lIndex, lDesiredProperty) {
        pvarProperty := VARIANT()
        result := ComCall(103, this, "int", lIndex, "int", lDesiredProperty, "ptr", pvarProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarProperty
    }

    /**
     * Removes a pending request from the client's request store. This method was first defined in the ICEnroll4 interface.
     * @param {BSTR} strThumbprint The thumbprint, or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a>, of the certificate data.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-removependingrequest
     */
    removePendingRequest(strThumbprint) {
        if(strThumbprint is String) {
            pin := BSTR.Alloc(strThumbprint)
            strThumbprint := pin.Value
        }

        result := ComCall(104, this, "ptr", strThumbprint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves size information for the signature and exchange keys. This method was first defined in the ICEnroll4 interface.
     * @remarks
     * If the CSP does not support this method, an error is returned.
     * 
     * For more information about the XEKL_KEYSIZE_INC value, see PP_SIG_KEYSIZE_INC usage in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptgetprovparam">CryptGetProvParam</a> reference page.
     * @param {Integer} lSizeSpec 
     * @param {Integer} lKeySpec 
     * @returns {Integer} A pointer to a variable that receives the key size, in bits.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-getkeylenex
     */
    GetKeyLenEx(lSizeSpec, lKeySpec) {
        result := ComCall(105, this, "int", lSizeSpec, "int", lKeySpec, "int*", &pdwKeySize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwKeySize
    }

    /**
     * Processes a certificate or chain of certificates, placing them into the appropriate certificate stores.InstallPKCS7 except that it returns the number of certificates actually installed in local stores.
     * @remarks
     * When this method is called from script, the method displays a user interface that asks whether the user will allow installation of a  certificate.
     * @param {BSTR} PKCS7 A string that contains a certificate or chain of certificates.
     * @returns {Integer} Returns the number of certificates installed into local stores.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-installpkcs7ex
     */
    InstallPKCS7Ex(PKCS7) {
        if(PKCS7 is String) {
            pin := BSTR.Alloc(PKCS7)
            PKCS7 := pin.Value
        }

        result := ComCall(106, this, "ptr", PKCS7, "int*", &plCertInstalled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCertInstalled
    }

    /**
     * Adds a certificate template (or &quot;certificate type&quot;) to a request.
     * @remarks
     * This method supports only the new request method, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll4-createrequest">createRequest</a>. It does not support the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a> method.
     * 
     * This method can be called multiple times to establish multiple certificate templates for the request.
     * @param {Integer} lType 
     * @param {BSTR} bstrOIDOrName The certificate template fully qualified name which is being added to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a>. This value is interpreted by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>.
     * @param {Integer} lMajorVersion Sets the major version of the template. This parameter is ignored if <i>lFlag</i> is XECT_EXTENSION_V!.
     * @param {BOOL} fMinorVersion Indicates whether a minor version of the template is used. This parameter is ignored if <i>lFlag</i> is XECT_EXTENSION_V!.
     * @param {Integer} lMinorVersion Sets the minor version of the template. This parameter is ignored if <i>lFlag</i> is XECT_EXTENSION_V1 or if <i>fMinorVersion</i> is <b>FALSE</b>.
     * @returns {HRESULT} <h3>VB</h3>
     *  The return value is an <b>HRESULT</b>, with <b>S_OK</b> returned if the call is successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-addcerttypetorequestex
     */
    addCertTypeToRequestEx(lType, bstrOIDOrName, lMajorVersion, fMinorVersion, lMinorVersion) {
        if(bstrOIDOrName is String) {
            pin := BSTR.Alloc(bstrOIDOrName)
            bstrOIDOrName := pin.Value
        }

        result := ComCall(107, this, "int", lType, "ptr", bstrOIDOrName, "int", lMajorVersion, "int", fMinorVersion, "int", lMinorVersion, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the type of the specified cryptographic service provider (CSP). This method was first defined in the ICEnroll4 interface.
     * @param {BSTR} strProvName A string value that specifies the name of the CSP whose type is being requested.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-getprovidertype
     */
    getProviderType(strProvName) {
        if(strProvName is String) {
            pin := BSTR.Alloc(strProvName)
            strProvName := pin.Value
        }

        result := ComCall(108, this, "ptr", strProvName, "int*", &plProvType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plProvType
    }

    /**
     * Sets the signer's certificate.
     * @param {BSTR} bstrCert 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-put_signercertificate
     */
    put_SignerCertificate(bstrCert) {
        if(bstrCert is String) {
            pin := BSTR.Alloc(bstrCert)
            bstrCert := pin.Value
        }

        result := ComCall(109, this, "ptr", bstrCert, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves a client ID request attribute. The client ID request attribute indicates the source of the certificate request. This property was first defined in the ICEnroll4 interface. (Put)
     * @param {Integer} lClientId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-put_clientid
     */
    put_ClientId(lClientId) {
        result := ComCall(110, this, "int", lClientId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or retrieves a client ID request attribute. The client ID request attribute indicates the source of the certificate request. This property was first defined in the ICEnroll4 interface. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-get_clientid
     */
    get_ClientId() {
        result := ComCall(111, this, "int*", &plClientId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plClientId
    }

    /**
     * Adds a BLOB property to a certificate.
     * @param {Integer} lPropertyId The identifier of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> property to add to the certificate.
     * @param {Integer} lReserved This parameter is reserved and must be zero.
     * @param {BSTR} bstrProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-addblobpropertytocertificate
     */
    addBlobPropertyToCertificate(lPropertyId, lReserved, bstrProperty) {
        if(bstrProperty is String) {
            pin := BSTR.Alloc(bstrProperty)
            bstrProperty := pin.Value
        }

        result := ComCall(112, this, "int", lPropertyId, "int", lReserved, "ptr", bstrProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resets the properties of a BLOB.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-resetblobproperties
     */
    resetBlobProperties() {
        result := ComCall(113, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the subject key ID extension is added to the certificate request that is generated. (Put)
     * @param {BOOL} fInclude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-put_includesubjectkeyid
     */
    put_IncludeSubjectKeyID(fInclude) {
        result := ComCall(114, this, "int", fInclude, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the subject key ID extension is added to the certificate request that is generated. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/xenroll/nf-xenroll-icenroll4-get_includesubjectkeyid
     */
    get_IncludeSubjectKeyID() {
        result := ComCall(115, this, "int*", &pfInclude := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfInclude
    }
}
