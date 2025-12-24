#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents information used to sign a certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509signatureinformation
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509SignatureInformation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509SignatureInformation
     * @type {Guid}
     */
    static IID => Guid("{728ab33c-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HashAlgorithm", "put_HashAlgorithm", "get_PublicKeyAlgorithm", "put_PublicKeyAlgorithm", "get_Parameters", "put_Parameters", "get_AlternateSignatureAlgorithm", "put_AlternateSignatureAlgorithm", "get_AlternateSignatureAlgorithmSet", "get_NullSigned", "put_NullSigned", "GetSignatureAlgorithm", "SetDefaultValues"]

    /**
     * @type {IObjectId} 
     */
    HashAlgorithm {
        get => this.get_HashAlgorithm()
        set => this.put_HashAlgorithm(value)
    }

    /**
     * @type {IObjectId} 
     */
    PublicKeyAlgorithm {
        get => this.get_PublicKeyAlgorithm()
        set => this.put_PublicKeyAlgorithm(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AlternateSignatureAlgorithm {
        get => this.get_AlternateSignatureAlgorithm()
        set => this.put_AlternateSignatureAlgorithm(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AlternateSignatureAlgorithmSet {
        get => this.get_AlternateSignatureAlgorithmSet()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    NullSigned {
        get => this.get_NullSigned()
        set => this.put_NullSigned(value)
    }

    /**
     * Specifies and retrieves an object identifier (OID) for the hashing algorithm used in the GetSignatureAlgorithm method.
     * @remarks
     * 
     * You must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-getsignaturealgorithm">GetSignatureAlgorithm</a> method. You must also set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_publickeyalgorithm">PublicKeyAlgorithm</a> property unless you are retrieving a signature algorithm for a null-signed certificate request.  You can also set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_nullsigned">NullSigned</a>, <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_alternatesignaturealgorithm">AlternateSignatureAlgorithm</a>,  and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_parameters">Parameters</a> properties.
     * 
     * The <b>HashAlgorithm</b> property validates whether the OID you specify represents a hashing algorithm. If the OID is valid, the property also clears the signature property cache.
     * 
     * 
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-get_hashalgorithm
     */
    get_HashAlgorithm() {
        result := ComCall(7, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Specifies and retrieves an object identifier (OID) for the hashing algorithm used in the GetSignatureAlgorithm method.
     * @remarks
     * 
     * You must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-getsignaturealgorithm">GetSignatureAlgorithm</a> method. You must also set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_publickeyalgorithm">PublicKeyAlgorithm</a> property unless you are retrieving a signature algorithm for a null-signed certificate request.  You can also set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_nullsigned">NullSigned</a>, <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_alternatesignaturealgorithm">AlternateSignatureAlgorithm</a>,  and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_parameters">Parameters</a> properties.
     * 
     * The <b>HashAlgorithm</b> property validates whether the OID you specify represents a hashing algorithm. If the OID is valid, the property also clears the signature property cache.
     * 
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-put_hashalgorithm
     */
    put_HashAlgorithm(pValue) {
        result := ComCall(8, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves an object identifier (OID) for the public key algorithm used in the GetSignatureAlgorithm method.
     * @remarks
     * 
     * Unless you are retrieving a signature algorithm for a null-signed certificate request, you must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-getsignaturealgorithm">GetSignatureAlgorithm</a> method. You must also set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_hashalgorithm">HashAlgorithm</a> property. You can also set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_alternatesignaturealgorithm">AlternateSignatureAlgorithm</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_nullsigned">NullSigned</a>   properties.
     * 
     * The <b>PublicKeyAlgorithm</b> property validates whether the OID you specify represents a public key algorithm. If the OID is valid, the property also clears the signature property cache.
     * 
     * 
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-get_publickeyalgorithm
     */
    get_PublicKeyAlgorithm() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Specifies and retrieves an object identifier (OID) for the public key algorithm used in the GetSignatureAlgorithm method.
     * @remarks
     * 
     * Unless you are retrieving a signature algorithm for a null-signed certificate request, you must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-getsignaturealgorithm">GetSignatureAlgorithm</a> method. You must also set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_hashalgorithm">HashAlgorithm</a> property. You can also set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_alternatesignaturealgorithm">AlternateSignatureAlgorithm</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_nullsigned">NullSigned</a>   properties.
     * 
     * The <b>PublicKeyAlgorithm</b> property validates whether the OID you specify represents a public key algorithm. If the OID is valid, the property also clears the signature property cache.
     * 
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-put_publickeyalgorithm
     */
    put_PublicKeyAlgorithm(pValue) {
        result := ComCall(10, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a byte array that contains the parameters associated with the signature algorithm.
     * @remarks
     * 
     * The AlgorithmIdentifier ASN.1 object that is used in various fields of an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.509</a> version 3 certificate contains an algorithm <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) and optional parameters.
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * AlgorithmIdentifier  ::=  SEQUENCE  
     * {
     *    algorithm               OBJECT IDENTIFIER,
     *    parameters              ANY DEFINED BY algorithm OPTIONAL  
     * }
     * </code></pre>
     *  The format and content of the parameters differs by algorithm. The Certificate Enrollment Control generates parameter information as required. Parameter values generated for various algorithms are discussed in the following sections.
     * 
     * <b>PKCS #1 version 1.5 signature algorithms:  </b><p class="note"> The following OIDs must have a <b>NULL</b> parameter value. <ul>
     * <li>XCN_OID_RSA_MD2RSA (1.2.840.113549.1.1.2)</li>
     * <li>XCN_OID_RSA_MD5RSA (1.2.840.113549.1.1.4)</li>
     * <li>XCN_OID_RSA_SHA1RSA (1.2.840.113549.1.1.5)</li>
     * <li>XCN_OID_RSA_SHA256RSA (1.2.840.113549.1.1.11)</li>
     * <li>XCN_OID_RSA_SHA384RSA (1.2.840.113549.1.1.12)</li>
     * <li>XCN_OID_RSA_SHA512RSA (1.2.840.113549.1.1.13)</li>
     * </ul>
     * 
     * 
     * <p class="note">The ASN.1 <b>NULL</b> value is represented by two bytes. The tag number is 0x05 and the value associated with the tag, representing the parameter length, is 0x00. This is shown by the following  certificate example.
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * ...
     * Public Key Algorithm:
     *     Algorithm ObjectId: 1.2.840.113549.1.1.1 RSA (RSA_SIGN)
     *     Algorithm Parameters:
     *     05 00
     * ...
     * </code></pre>
     * 
     * 
     * <b>RSASSA-PSS signatures:  </b><p class="note">The RSASSA-PSS (RSA Signature Scheme with Appendix - Probabilistic Signature Scheme), XCN_OID_RSA_SSA_PSS (1.2.840.113549.1.1.10), generates the following parameter information. A signature scheme with appendix consists of signature generation and signature verification operations. Verification of the signature requires the original certificate request on which the signature was generated. For more information, see the PKCS #1 v2.1 cryptography standard from RSA laboratories.
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * RSASSA-PSS-params ::= SEQUENCE 
     * {
     *    hashAlgorithm     [0] HashAlgorithm DEFAULT sha1,
     *    maskGenAlgorithm  [1] MaskGenAlgorithm DEFAULT mgf1SHA1,
     *    saltLength        [2] INTEGER DEFAULT 20,
     *    trailerField      [3] TrailerField DEFAULT trailerFieldBC
     * }
     * 
     * </code></pre>
     * 
     * 
     * <b>ECDSA-SHA1 signature algorithms:  </b>When the XCN_OID_ECDSA_SHA1 (1.2.840.10045.4.1) is used to create a signature, the parameters contains the OID of the hash algorithm. The following OIDs are supported:<ul>
     * <li>XCN_OID_ECDSA_SHA256 (1.2.840.10045.4.3.2)</li>
     * <li>XCN_OID_ECDSA_SHA384 (1.2.840.10045.4.3.3)</li>
     * <li>XCN_OID_ECDSA_SHA512 (1.2.840.10045.4.3.4)</li>
     * </ul>
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-get_parameters
     */
    get_Parameters(Encoding) {
        pValue := BSTR()
        result := ComCall(11, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a byte array that contains the parameters associated with the signature algorithm.
     * @remarks
     * 
     * The AlgorithmIdentifier ASN.1 object that is used in various fields of an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.509</a> version 3 certificate contains an algorithm <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) and optional parameters.
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * AlgorithmIdentifier  ::=  SEQUENCE  
     * {
     *    algorithm               OBJECT IDENTIFIER,
     *    parameters              ANY DEFINED BY algorithm OPTIONAL  
     * }
     * </code></pre>
     *  The format and content of the parameters differs by algorithm. The Certificate Enrollment Control generates parameter information as required. Parameter values generated for various algorithms are discussed in the following sections.
     * 
     * <b>PKCS #1 version 1.5 signature algorithms:  </b><p class="note"> The following OIDs must have a <b>NULL</b> parameter value. <ul>
     * <li>XCN_OID_RSA_MD2RSA (1.2.840.113549.1.1.2)</li>
     * <li>XCN_OID_RSA_MD5RSA (1.2.840.113549.1.1.4)</li>
     * <li>XCN_OID_RSA_SHA1RSA (1.2.840.113549.1.1.5)</li>
     * <li>XCN_OID_RSA_SHA256RSA (1.2.840.113549.1.1.11)</li>
     * <li>XCN_OID_RSA_SHA384RSA (1.2.840.113549.1.1.12)</li>
     * <li>XCN_OID_RSA_SHA512RSA (1.2.840.113549.1.1.13)</li>
     * </ul>
     * 
     * 
     * <p class="note">The ASN.1 <b>NULL</b> value is represented by two bytes. The tag number is 0x05 and the value associated with the tag, representing the parameter length, is 0x00. This is shown by the following  certificate example.
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * ...
     * Public Key Algorithm:
     *     Algorithm ObjectId: 1.2.840.113549.1.1.1 RSA (RSA_SIGN)
     *     Algorithm Parameters:
     *     05 00
     * ...
     * </code></pre>
     * 
     * 
     * <b>RSASSA-PSS signatures:  </b><p class="note">The RSASSA-PSS (RSA Signature Scheme with Appendix - Probabilistic Signature Scheme), XCN_OID_RSA_SSA_PSS (1.2.840.113549.1.1.10), generates the following parameter information. A signature scheme with appendix consists of signature generation and signature verification operations. Verification of the signature requires the original certificate request on which the signature was generated. For more information, see the PKCS #1 v2.1 cryptography standard from RSA laboratories.
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * RSASSA-PSS-params ::= SEQUENCE 
     * {
     *    hashAlgorithm     [0] HashAlgorithm DEFAULT sha1,
     *    maskGenAlgorithm  [1] MaskGenAlgorithm DEFAULT mgf1SHA1,
     *    saltLength        [2] INTEGER DEFAULT 20,
     *    trailerField      [3] TrailerField DEFAULT trailerFieldBC
     * }
     * 
     * </code></pre>
     * 
     * 
     * <b>ECDSA-SHA1 signature algorithms:  </b>When the XCN_OID_ECDSA_SHA1 (1.2.840.10045.4.1) is used to create a signature, the parameters contains the OID of the hash algorithm. The following OIDs are supported:<ul>
     * <li>XCN_OID_ECDSA_SHA256 (1.2.840.10045.4.3.2)</li>
     * <li>XCN_OID_ECDSA_SHA384 (1.2.840.10045.4.3.3)</li>
     * <li>XCN_OID_ECDSA_SHA512 (1.2.840.10045.4.3.4)</li>
     * </ul>
     * 
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-put_parameters
     */
    put_Parameters(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(12, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves a Boolean value that specifies whether the GetSignatureAlgorithm method should retrieve a discrete or combined algorithm object identifier (OID) for a PKCS
     * @remarks
     * 
     * PKCS #7 and CMC certificate requests always use a discrete signature algorithm OID and a separate hashing algorithm OID. Only PKCS #10 certificate requests use combined algorithm OIDs. You can set the <b>AlternateSignatureAlgorithm</b> property to retrieve a discrete signature algorithm OID from the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-getsignaturealgorithm">GetSignatureAlgorithm</a> method for a PKCS #10 request. If you set this property, the hashing algorithm OID can be retrieved from the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_parameters">Parameters</a> property, and the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_alternatesignaturealgorithmset">AlternateSignatureAlgorithmSet</a> property is also set. For examples of discrete and combined OIDs, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-get_alternatesignaturealgorithm
     */
    get_AlternateSignatureAlgorithm() {
        result := ComCall(13, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a Boolean value that specifies whether the GetSignatureAlgorithm method should retrieve a discrete or combined algorithm object identifier (OID) for a PKCS
     * @remarks
     * 
     * PKCS #7 and CMC certificate requests always use a discrete signature algorithm OID and a separate hashing algorithm OID. Only PKCS #10 certificate requests use combined algorithm OIDs. You can set the <b>AlternateSignatureAlgorithm</b> property to retrieve a discrete signature algorithm OID from the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-getsignaturealgorithm">GetSignatureAlgorithm</a> method for a PKCS #10 request. If you set this property, the hashing algorithm OID can be retrieved from the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_parameters">Parameters</a> property, and the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_alternatesignaturealgorithmset">AlternateSignatureAlgorithmSet</a> property is also set. For examples of discrete and combined OIDs, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a>
     * 
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-put_alternatesignaturealgorithm
     */
    put_AlternateSignatureAlgorithm(Value) {
        result := ComCall(14, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves a Boolean value that specifies whether the AlternateSignatureAlgorithm property has been explicitly set by a caller.
     * @remarks
     * 
     * The <b>AlternateSignatureAlgorithmSet</b> property is used by a CMC certificate request object. If the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-get_alternatesignaturealgorithm">AlternateSignatureAlgorithm</a> property is explicitly set on a signer certificate, and the same property is set on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestcmc">IX509CertificateRequestCmc</a> object, the CMC request will not override the property value on the signer certificate.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-get_alternatesignaturealgorithmset
     */
    get_AlternateSignatureAlgorithmSet() {
        result := ComCall(15, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a Boolean value that indicates whether the certificate request is null-signed.
     * @remarks
     * 
     * A null-signed certificate request is not really signed. That is, the request can be digested by using a digest algorithm such as SHA-1, but it is not encrypted with a public key algorithm such as RSA. You must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-getsignaturealgorithm">GetSignatureAlgorithm</a> method.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-get_nullsigned
     */
    get_NullSigned() {
        result := ComCall(16, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a Boolean value that indicates whether the certificate request is null-signed.
     * @remarks
     * 
     * A null-signed certificate request is not really signed. That is, the request can be digested by using a digest algorithm such as SHA-1, but it is not encrypted with a public key algorithm such as RSA. You must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509signatureinformation-getsignaturealgorithm">GetSignatureAlgorithm</a> method.
     * 
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-put_nullsigned
     */
    put_NullSigned(Value) {
        result := ComCall(17, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves the signing algorithm object identifier (OID).
     * @param {VARIANT_BOOL} Pkcs7Signature A <b>VARIANT_BOOL</b> variable that specifies whether the algorithm will be used to sign a PKCS #7 or CMC certificate request.
     * @param {VARIANT_BOOL} SignatureKey A <b>VARIANT_BOOL</b> variable that specifies whether an algorithm that is only used for signing is preferred when an algorithm OID is associated with more than one purpose. For example, XCN_OID_RSA_RSA (1.2.840.113549.1.1.1) can be used for both signing and key exchange.
     * @returns {IObjectId} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents the algorithm OID.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-getsignaturealgorithm
     */
    GetSignatureAlgorithm(Pkcs7Signature, SignatureKey) {
        result := ComCall(18, this, "short", Pkcs7Signature, "short", SignatureKey, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Specifies a default hashing algorithm used to create a digest of the certificate request prior to signing.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>CERTSRV_E_PROPERTY_EMPTY</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The hashing algorithm  OID could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509signatureinformation-setdefaultvalues
     */
    SetDefaultValues() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
