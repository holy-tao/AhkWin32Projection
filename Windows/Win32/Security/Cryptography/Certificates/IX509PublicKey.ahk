#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a public key in a public/private key pair.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509publickey
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509PublicKey extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509PublicKey
     * @type {Guid}
     */
    static IID => Guid("{728ab30b-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "InitializeFromEncodedPublicKeyInfo", "get_Algorithm", "get_Length", "get_EncodedKey", "get_EncodedParameters", "ComputeKeyIdentifier"]

    /**
     * @type {IObjectId} 
     */
    Algorithm {
        get => this.get_Algorithm()
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Initializes the object from a public key algorithm object identifier (OID) and from byte arrays that contain a public key and the associated parameters, if any.
     * @param {IObjectId} pObjectId Pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents the algorithm OID.
     * @param {BSTR} strEncodedKey A <b>BSTR</b> variable that contains the public key.
     * @param {BSTR} strEncodedParameters A <b>BSTR</b> variable that contains the parameters associated with the public key. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509publickey-get_encodedparameters">EncodedParameters</a> property.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding applied to the  arguments specified in the <i>strEncodedKey</i> and <i>strEncodedParameters</i> parameters. The default value is XCN_CRYPT_STRING_BASE64.
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
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509publickey-initialize
     */
    Initialize(pObjectId, strEncodedKey, strEncodedParameters, Encoding) {
        strEncodedKey := strEncodedKey is String ? BSTR.Alloc(strEncodedKey).Value : strEncodedKey
        strEncodedParameters := strEncodedParameters is String ? BSTR.Alloc(strEncodedParameters).Value : strEncodedParameters

        result := ComCall(7, this, "ptr", pObjectId, "ptr", strEncodedKey, "ptr", strEncodedParameters, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * Initializes the object from a byte array that contains a public key.
     * @param {BSTR} strEncodedPublicKeyInfo A <b>BSTR</b> variable that contains the key.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the key contained in the <i>strEncodedPublicKeyInfo</i> parameter. The default value is XCN_CRYPT_STRING_BASE64.
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
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509publickey-initializefromencodedpublickeyinfo
     */
    InitializeFromEncodedPublicKeyInfo(strEncodedPublicKeyInfo, Encoding) {
        strEncodedPublicKeyInfo := strEncodedPublicKeyInfo is String ? BSTR.Alloc(strEncodedPublicKeyInfo).Value : strEncodedPublicKeyInfo

        result := ComCall(8, this, "ptr", strEncodedPublicKeyInfo, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * Retrieves an object identifier (OID) for the public key algorithm.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509publickey-initializefromencodedpublickeyinfo">InitializeFromEncodedPublicKeyInfo</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509publickey-initialize">Initialize</a> method to initialize the public key object before calling this property.
     * 
     * 
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509publickey-get_algorithm
     */
    get_Algorithm() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Retrieves the length of the public key.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509publickey-initializefromencodedpublickeyinfo">InitializeFromEncodedPublicKeyInfo</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509publickey-initialize">Initialize</a> method to initialize the public key object before calling this property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509publickey-get_length
     */
    get_Length() {
        result := ComCall(10, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a byte array that contains the public key.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509publickey-initializefromencodedpublickeyinfo">InitializeFromEncodedPublicKeyInfo</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509publickey-initialize">Initialize</a> method to initialize the public key object before calling this property.
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509publickey-get_encodedkey
     */
    get_EncodedKey(Encoding) {
        pValue := BSTR()
        result := ComCall(11, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a byte array that contains the parameters associated with the public key algorithm.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509publickey-initializefromencodedpublickeyinfo">InitializeFromEncodedPublicKeyInfo</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509publickey-initialize">Initialize</a> method to initialize the public key object before calling this property.
     * 
     * The AlgorithmIdentifier <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) object that is referenced by the SubjectPublicKeyInfo object in an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.509</a> version 3 certificate contains an algorithm <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) and optional parameters.
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * SubjectPublicKeyInfo  ::=  SEQUENCE
     * {
     *    algorithm            AlgorithmIdentifier,
     *    subjectPublicKey     BIT STRING  
     * }
     * 
     * AlgorithmIdentifier  ::=  SEQUENCE  
     * {
     *    algorithm            OBJECT IDENTIFIER,
     *    parameters           ANY DEFINED BY algorithm OPTIONAL  
     * }
     * </code></pre>
     *  The format and content of the parameters differs by algorithm. The <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/certificate-enrollment-control">Certificate Enrollment Control</a> generates parameter values for various algorithms as required. For more information, see the following sections:<ul>
     * <li><b>RSA Public Key Algorithm</b></li>
     * <li><b>Key Transport Using RSA-OAEP</b></li>
     * <li><b>Key Agreement Using ECDH</b></li>
     * <li><b>Content Encryption Using AES</b></li>
     * </ul>
     * 
     * 
     * <h3><a id="rsa_public_key_algorithm_cpp"></a><a id="RSA_PUBLIC_KEY_ALGORITHM_CPP"></a>RSA Public Key Algorithm</h3>
     *  RSA is often used to encrypt a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> and send it to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) for archival. The XCN_OID_RSA_RSA (1.2.840.113549.1.1.1) algorithm OID must have a <b>NULL</b> parameter value. The ASN.1 <b>NULL</b> value is represented by two bytes. The tag number is 0x05 and the value associated with the tag is 0x00. This is shown by the following  certificate example.
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * ...
     * Public Key Algorithm:
     *     Algorithm ObjectId: 1.2.840.113549.1.1.1 RSA (RSA_KEYX)
     *     Algorithm Parameters:
     *     05 00
     * ...
     * </code></pre>
     * <h3><a id="key_transport_using_rsa-oaep"></a><a id="KEY_TRANSPORT_USING_RSA-OAEP"></a>Key Transport Using RSA-OAEP</h3>
     * The RSA-OAEP algorithm, XCN_OID_RSAES_OAEP (1.2.840.113549.1.1.7), is also supported for key transport. The parameters field has the following syntax.
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * RSAES-OAEP-params  ::=  SEQUENCE  
     * {
     *    hashFunc    [0] AlgorithmIdentifier DEFAULT sha1OID,
     *    maskGenFunc [1] AlgorithmIdentifier DEFAULT mgf1SHA1OID,
     *    pSourceFunc [2] AlgorithmIdentifier DEFAULT pSpecifiedEmptyOID
     * }
     * </code></pre>
     * <h3><a id="key_agreement_using_ecdh"></a><a id="KEY_AGREEMENT_USING_ECDH"></a>Key Agreement Using ECDH</h3>
     * The single pass Elliptic Curve Diffie-Hellman algorithm, XCN_OID_DH_SINGLE_PASS_STDDH_SHA1_KDF (1.3.133.16.840.63.0.2), is supported for key agreement. Key agreement uses two levels of encryption:<ul>
     * <li>The message is encrypted by using a content encryption key (CEK) and a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">symmetric encryption</a> algorithm.</li>
     * <li>The CEK is encrypted (wrapped) by using a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">symmetric key</a> encryption key (KEK).</li>
     * </ul>The KEK is computed from a shared secret number that is computed from the private key of one party and the public key of the other party. The parameters field contains the OID of the  KEK algorithm used to wrap or encrypt the CEK. The following wrap algorithms are supported:<ul>
     * <li>XCN_OID_RSA_SMIMEalgCMS3DESwrap (1.2.840.113549.1.9.16.3.)</li>
     * <li>XCN_OID_RSA_SMIMEalgCMSRC2wrap (1.2.840.113549.1.9.16.3.7)</li>
     * <li>XCN_OID_NIST_AES128_WRAP (2.16.840.1.101.3.4.1.5)</li>
     * <li>XCN_OID_NIST_AES192_WRAP (2.16.840.1.101.3.4.1.25)</li>
     * <li>XCN_OID_NIST_AES256_WRAP (2.16.840.1.101.3.4.1.45)</li>
     * </ul>
     * 
     * 
     * <h3><a id="content_encryption_using_aes"></a><a id="CONTENT_ENCRYPTION_USING_AES"></a>Content Encryption Using AES</h3>
     * The Advanced Encryption Standard (AES) is used to encrypt content. The following algorithms are supported:<ul>
     * <li>XCN_OID_NIST_AES128_CBC        (2.16.840.1.101.3.4.1.2)</li>
     * <li>XCN_OID_NIST_AES192_CBC        (2.16.840.1.101.3.4.1.22)</li>
     * <li>XCN_OID_NIST_AES256_CBC        (2.16.840.1.101.3.4.1.42)</li>
     * </ul>The parameters field contains a random initialization vector, AES-IV.
     * 
     * <pre class="syntax" xml:space="preserve"><code>
     * AES-IV ::= OCTET STRING (SIZE(16))
     * </code></pre>
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509publickey-get_encodedparameters
     */
    get_EncodedParameters(Encoding) {
        pValue := BSTR()
        result := ComCall(12, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Creates an identifier from a 160-bit SHA-1 hash of the public key.
     * @param {Integer} Algorithm A value of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-keyidentifierhashalgorithm">KeyIdentifierHashAlgorithm</a> enumeration that specifies what hash algorithm to use to create the key identifier.
     * 
     * If this value is SKIHashDefault or SKIHashSha1, the identifier is created by hashing only the byte array that contains the key and excluding the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) tag, length, and unused bits fields.
     * 
     * If this value is SKIHashCapiSha1, the identifier is created by hashing the DER-encoded byte array that contains the tag, length,  number of unused bits, and the public key.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode-encoding to be applied to the hash contained in the <i>pValue</i> parameter. The default value is XCN_CRYPT_STRING_BASE64.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the key identifier.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509publickey-computekeyidentifier
     */
    ComputeKeyIdentifier(Algorithm, Encoding) {
        pValue := BSTR()
        result := ComCall(13, this, "int", Algorithm, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }
}
