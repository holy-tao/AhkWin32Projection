#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains predefined object identifiers for external properties that can be associated with a certificate in the certificate store.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-certenroll_propertyid
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CERTENROLL_PROPERTYID{

    /**
     * No property is identified.
     * @type {Integer (Int32)}
     */
    static XCN_PROPERTYID_NONE => 0

    /**
     * Data type: <b>HCRYPTPROV</b>
     * 
     * The handle of the private key associated with the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_KEY_PROV_HANDLE_PROP_ID => 1

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_key_prov_info">CRYPT_KEY_PROV_INFO</a> structure.
     * 
     * The structure contains information about a CSP key container or a Cryptography API: Next Generation (CNG) key. This is used to acquire a handle to the private key. We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertykeyprovinfo">ICertPropertyKeyProvInfo</a> interface to initialize and retrieve this property.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_KEY_PROV_INFO_PROP_ID => 2

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains a SHA-1 hash value of the certificate. We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertysha1hash">ICertPropertySHA1Hash</a> interface to initialize and retrieve this property.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SHA1_HASH_PROP_ID => 3

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains an MD5 hash value of the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_MD5_HASH_PROP_ID => 4

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains a hash of the certificate created by using the default hashing algorithm. The default algorithm is currently SHA-1.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_HASH_PROP_ID => 3

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_key_context">CERT_KEY_CONTEXT</a> structure.
     * 
     * The structure contains the information necessary to retrieve a key, including the CSP or key service provider (KSP) handle and a value that indicates whether the key is used for signing or encryption.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_KEY_CONTEXT_PROP_ID => 5

    /**
     * Data type: pointer to a <b>DWORD</b>.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_KEY_SPEC_PROP_ID => 6

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_IE30_RESERVED_PROP_ID => 7

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_PUBKEY_HASH_RESERVED_PROP_ID => 8

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains a DER-encoded <b>EnhancedKeyUsage</b> extension in a <b>CERT_ENHKEY_USAGE</b> structure. You can encode the structure by using the CryptoAPI <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptencodeobject">CryptEncodeObject</a> function and setting the <i>lpszStructType</i> parameter to <b>X509_ENHANCED_KEY_USAGE</b>.
     * 
     * <pre class="syntax" xml:space="preserve"><code>typedef struct _CTL_USAGE 
     * {
     *     DWORD               cUsageIdentifier;
     *     LPSTR               *rgpszUsageIdentifier; 
     * } 
     * CTL_USAGE, *PCTL_USAGE, CERT_ENHKEY_USAGE, *PCERT_ENHKEY_USAGE;</code></pre>
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ENHKEY_USAGE_PROP_ID => 9

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains a DER-encoded certificate trust list (CTL) usage identifier in a <b>CTL_USAGE</b> structure. You can encode the structure by using the CryptoAPI <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptencodeobject">CryptEncodeObject</a> function and setting the <i>lpszStructType</i> parameter to <b>X509_ENHANCED_KEY_USAGE</b>.
     * 
     * <pre class="syntax" xml:space="preserve"><code>typedef struct _CTL_USAGE 
     * {
     *     DWORD               cUsageIdentifier;
     *     LPSTR               *rgpszUsageIdentifier; 
     * } 
     * CTL_USAGE;</code></pre>
     * @type {Integer (Int32)}
     */
    static XCN_CERT_CTL_USAGE_PROP_ID => 9

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains a DER-encoded <b>AlternativeNames</b> extension in a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_info">CERT_ALT_NAME_INFO</a> structure. You can encode the structure by using the CryptoAPI <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptencodeobject">CryptEncodeObject</a> function and setting the <i>lpszStructType</i> parameter to <b>X509_ALTERNATE_NAME</b>.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NEXT_UPDATE_LOCATION_PROP_ID => 10

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member contains a pointer to a null-terminated Unicode string that contains the display name for the certificate. We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyfriendlyname">ICertPropertyFriendlyName</a> interface to initialize and retrieve this property.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_FRIENDLY_NAME_PROP_ID => 11

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member contains a pointer to a null-terminated Unicode string that contains the name of the private key file.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_PVK_FILE_PROP_ID => 12

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member contains a pointer to a null-terminated Unicode string that contains a description of the certificate. We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertydescription">ICertPropertyDescription</a> interface to initialize and retrieve this property.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_DESCRIPTION_PROP_ID => 13

    /**
     * Data type: pointer to a <b>DWORD</b>.
     * 
     * The <b>DWORD</b> can contain a value that is a bitwise-<b>OR</b> combination of the following flags:<ul>
     * <li>CERT_ACCESS_STATE_WRITE_PERSIST_FLAG (0x1)</li>
     * <li>CERT_ACCESS_STATE_SYSTEM_STORE_FLAG  (0x2)</li>
     * <li>CERT_ACCESS_STATE_LM_SYSTEM_STORE_FLAG (0x4)</li>
     * <li>CERT_ACCESS_STATE_GP_SYSTEM_STORE_FLAG (0x8)</li>
     * </ul>This is a read-only property and cannot be associated with an existing certificate by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-setvalueoncertificate">SetValueOnCertificate</a> method. You can retrieve it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-get_rawdata">RawData</a> property after initializing the property value by using the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertproperty-initializefromcertificate">InitializeFromCertificate</a> method.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ACCESS_STATE_PROP_ID => 14

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains a hash of the certificate signature.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SIGNATURE_HASH_PROP_ID => 15

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SMART_CARD_DATA_PROP_ID => 16

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_EFS_PROP_ID => 17

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_FORTEZZA_DATA_PROP_ID => 18

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that identifies whether a certificate is archived. A certificate is typically archived when it has been replaced by a newer certificate. Subsequent enumeration of the certificate store usually skips the archived certificates. To indicate that the certificate is not archived, you can set <i>pbData</i> to <b>NULL</b> and <i>cbData</i> to zero (0). To indicate that the certificate is archived, you can set <i>pbData</i> to something other than <b>NULL</b> such as the address of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure. We recommend, however, that you use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyarchived">ICertPropertyArchived</a> interface to set this property.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ARCHIVED_PROP_ID => 19

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains the hash of the certificate subject public key. Typically, this is a 20-byte SHA-1 hash. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionsubjectkeyidentifier">IX509ExtensionSubjectKeyIdentifier</a> interface.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_KEY_IDENTIFIER_PROP_ID => 20

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member contains a pointer to a null-terminated Unicode string that contains the name or object identifier used for auto-enrollment. We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyautoenroll">ICertPropertyAutoEnroll</a> interface to initialize and retrieve this property.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_AUTO_ENROLL_PROP_ID => 21

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to the DER-encoded public key algorithm parameters. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509publickey-get_encodedparameters">EncodedParameters</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509publickey">IX509PublicKey</a> interface.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_PUBKEY_ALG_PARA_PROP_ID => 22

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains a DER-encoded <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cross_cert_dist_points_info">CROSS_CERT_DIST_POINTS_INFO</a> structure. You can encode the structure by using the CryptoAPI <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptencodeobject">CryptEncodeObject</a> function and setting the <i>lpszStructType</i> parameter to <b>X509_CROSS_CERT_DIST_POINTS</b>.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_CROSS_CERT_DIST_POINTS_PROP_ID => 23

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains an MD5 hash of the public key associated with the private key used to sign the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ISSUER_PUBLIC_KEY_MD5_HASH_PROP_ID => 24

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains an MD5 hash of the public key contained in the certificate.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SUBJECT_PUBLIC_KEY_MD5_HASH_PROP_ID => 25

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains the following information (in the order listed) about a pending request. Each Unicode string is null-terminated, and the length includes the terminating null character.<ul>
     * <li>Request ID length (4 bytes)</li>
     * <li>Request ID string</li>
     * <li>CA DNS name string length (4 bytes)</li>
     * <li>CA DNS name string</li>
     * <li>CA name string length (4 bytes)</li>
     * <li>CA name string</li>
     * <li>Display name length (4 bytes)</li>
     * <li>Display name string</li>
     * </ul>We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyenrollment">ICertPropertyEnrollment</a> interface to initialize and retrieve this property.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ENROLLMENT_PROP_ID => 26

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>  structure.
     * 
     * The structure contains the time that the certificate was added to the certificate store.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_DATE_STAMP_PROP_ID => 27

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains an MD5 hash of the CA signing certificate serial number.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID => 28

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains an MD5 hash of the subject name.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SUBJECT_NAME_MD5_HASH_PROP_ID => 29

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a null-terminated Unicode string that contains information about an error.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_EXTENDED_ERROR_INFO_PROP_ID => 30

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains a SHA-1 hash of the certificate that is being renewed. We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyrenewal">ICertPropertyRenewal</a> interface to initialize and retrieve this property.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_RENEWAL_PROP_ID => 64

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains a hash of the archived private key. We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyarchivedkeyhash">ICertPropertyArchivedKeyHash</a> interface to initialize and retrieve this property value.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ARCHIVED_KEY_HASH_PROP_ID => 65

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_AUTO_ENROLL_RETRY_PROP_ID => 66

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_AIA_URL_RETRIEVED_PROP_ID => 67

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_AUTHORITY_INFO_ACCESS_PROP_ID => 68

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a byte array that contains a <b>VARIANT_BOOL</b> followed by a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure. To specify that the certificate is not backed up, set the first <c>sizeof(VARIANT_BOOL)</code> bytes in the array to zero (0). Otherwise, specify a value that is not zero. To specify the time at which the certificate was backed up, set the next <code>sizeof(FILETIME)</c> bytes to the date and time. We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertybackedup">ICertPropertyBackedUp</a> interface to set this property value. This property is not currently used.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_BACKED_UP_PROP_ID => 69

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_OCSP_RESPONSE_PROP_ID => 70

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a null-terminated Unicode string that contains the name of the computer that originated an auto-enrollment certificate request. We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyrequestoriginator">ICertPropertyRequestOriginator</a> interface to initialize and retrieve this property.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_REQUEST_ORIGINATOR_PROP_ID => 71

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SOURCE_LOCATION_PROP_ID => 72

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SOURCE_URL_PROP_ID => 73

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NEW_KEY_PROP_ID => 74

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_OCSP_CACHE_PREFIX_PROP_ID => 75

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SMART_CARD_ROOT_INFO_PROP_ID => 76

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NO_AUTO_EXPIRE_CHECK_PROP_ID => 77

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NCRYPT_KEY_HANDLE_PROP_ID => 78

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_HCRYPTPROV_OR_NCRYPT_KEY_HANDLE_PROP_ID => 79

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SUBJECT_INFO_ACCESS_PROP_ID => 80

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_CA_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID => 81

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_CA_DISABLE_CRL_PROP_ID => 82

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ROOT_PROGRAM_CERT_POLICIES_PROP_ID => 83

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ROOT_PROGRAM_NAME_CONSTRAINTS_PROP_ID => 84

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SUBJECT_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID => 85

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SUBJECT_DISABLE_CRL_PROP_ID => 86

    /**
     * Contains information about a certificate enrollment policy (CEP) server and a certificate enrollment server (CES). This includes:
     * 
     * <ul>
     * <li>The CEP authentication method.</li>
     * <li>The CES authentication method.</li>
     * <li>The CEP URL.</li>
     * <li>The CES URL</li>
     * <li>The CEP ID.</li>
     * <li>The request ID string.</li>
     * </ul>
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyenrollmentpolicyserver">ICertPropertyEnrollmentPolicyServer</a>.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_CEP_PROP_ID => 87

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SIGN_HASH_CNG_ALG_PROP_ID => 89

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SCARD_PIN_ID_PROP_ID => 90

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SCARD_PIN_INFO_PROP_ID => 91

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SUBJECT_PUB_KEY_BIT_LENGTH_PROP_ID => 92

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_PUB_KEY_CNG_ALG_BIT_LENGTH_PROP_ID => 93

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ISSUER_PUB_KEY_BIT_LENGTH_PROP_ID => 94

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ISSUER_CHAIN_SIGN_HASH_CNG_ALG_PROP_ID => 95

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ISSUER_CHAIN_PUB_KEY_CNG_ALG_BIT_LENGTH_PROP_ID => 96

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NO_EXPIRE_NOTIFICATION_PROP_ID => 97

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_AUTH_ROOT_SHA256_HASH_PROP_ID => 98

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NCRYPT_KEY_HANDLE_TRANSFER_PROP_ID => 99

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_HCRYPTPROV_TRANSFER_PROP_ID => 100

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SMART_CARD_READER_PROP_ID => 101

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SEND_AS_TRUSTED_ISSUER_PROP_ID => 102

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_KEY_REPAIR_ATTEMPTED_PROP_ID => 103

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_DISALLOWED_FILETIME_PROP_ID => 104

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ROOT_PROGRAM_CHAIN_POLICIES_PROP_ID => 105

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SMART_CARD_READER_NON_REMOVABLE_PROP_ID => 106

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SHA256_HASH_PROP_ID => 107

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SCEP_SERVER_CERTS_PROP_ID => 108

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SCEP_RA_SIGNATURE_CERT_PROP_ID => 109

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SCEP_RA_ENCRYPTION_CERT_PROP_ID => 110

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SCEP_CA_CERT_PROP_ID => 111

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SCEP_SIGNER_CERT_PROP_ID => 112

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SCEP_NONCE_PROP_ID => 113

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SCEP_ENCRYPT_HASH_CNG_ALG_PROP_ID => 114

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SCEP_FLAGS_PROP_ID => 115

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SCEP_GUID_PROP_ID => 116

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SERIALIZABLE_KEY_CONTEXT_PROP_ID => 117

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ISOLATED_KEY_PROP_ID => 118

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_SERIAL_CHAIN_PROP_ID => 119

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_KEY_CLASSIFICATION_PROP_ID => 120

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_DISALLOWED_ENHKEY_USAGE_PROP_ID => 122

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NONCOMPLIANT_ROOT_URL_PROP_ID => 123

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_PIN_SHA256_HASH_PROP_ID => 124

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_CLR_DELETE_KEY_PROP_ID => 125

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_NOT_BEFORE_FILETIME_PROP_ID => 126

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_CERT_NOT_BEFORE_ENHKEY_USAGE_PROP_ID => 127

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_FIRST_RESERVED_PROP_ID => 130

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_LAST_RESERVED_PROP_ID => 32767

    /**
     * The minimum number for a user-defined property ID.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_FIRST_USER_PROP_ID => 32768

    /**
     * The maximum number for a user-defined property ID.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_LAST_USER_PROP_ID => 65535

    /**
     * Data type: pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_INTEGER_BLOB</a> structure.
     * 
     * The <i>pbData</i> structure member points to a null-terminated Unicode string that contains the localized name of the certificate store.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_STORE_LOCALIZED_NAME_PROP_ID => 4096
}
