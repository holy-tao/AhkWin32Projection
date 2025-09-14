#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains information about an object identifier (OID).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_oid_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_OID_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The OID associated with this OID information.
     * @type {Pointer<PSTR>}
     */
    pszOID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The display name associated with an OID.
     * @type {Pointer<PWSTR>}
     */
    pwszName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The group identifier value associated with this OID information. 
     * 
     * 
     * 
     * 
     * This member can be one of the following <b>dwGroupId</b> group identifiers.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_ENCRYPT_ALG_OID_GROUP_ID"></a><a id="crypt_encrypt_alg_oid_group_id"></a><dl>
     * <dt><b>CRYPT_ENCRYPT_ALG_OID_GROUP_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Encryption algorithms
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_ENHKEY_USAGE_OID_GROUP_ID"></a><a id="crypt_enhkey_usage_oid_group_id"></a><dl>
     * <dt><b>CRYPT_ENHKEY_USAGE_OID_GROUP_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enhanced key usages
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_EXT_OR_ATTR_OID_GROUP_ID"></a><a id="crypt_ext_or_attr_oid_group_id"></a><dl>
     * <dt><b>CRYPT_EXT_OR_ATTR_OID_GROUP_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Extensions or attributes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_HASH_ALG_OID_GROUP_ID"></a><a id="crypt_hash_alg_oid_group_id"></a><dl>
     * <dt><b>CRYPT_HASH_ALG_OID_GROUP_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hash algorithms
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_POLICY_OID_GROUP_ID"></a><a id="crypt_policy_oid_group_id"></a><dl>
     * <dt><b>CRYPT_POLICY_OID_GROUP_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Policies
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_PUBKEY_ALG_OID_GROUP_ID"></a><a id="crypt_pubkey_alg_oid_group_id"></a><dl>
     * <dt><b>CRYPT_PUBKEY_ALG_OID_GROUP_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Public key algorithms
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_RDN_ATTR_OID_GROUP_ID"></a><a id="crypt_rdn_attr_oid_group_id"></a><dl>
     * <dt><b>CRYPT_RDN_ATTR_OID_GROUP_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RDN attributes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_SIGN_ALG_OID_GROUP_ID"></a><a id="crypt_sign_alg_oid_group_id"></a><dl>
     * <dt><b>CRYPT_SIGN_ALG_OID_GROUP_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Signature algorithms
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwGroupId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwValue {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Algid {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Extra information used to find or register OID information. This member applies for the following values of <b>dwGroupId</b>: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>CRYPT_PUBKEY_ALG_OID_GROUP_ID</li>
     * <li>CRYPT_SIGN_ALG_OID_GROUP_ID</li>
     * <li>CRYPT_RDN_ATTR_OID_GROUP_ID</li>
     * </ul>
     * The OIDs in the CRYPT_ENCRYPT_ALG_OID_GROUP_ID OID group have a bit length set for the AES algorithms in the DWORD[0] member of the ExtraInfo member.
     * 
     * The OIDs in the CRYPT_PUBKEY_ALG_OID_GROUP_ID group have a flag set in the DWORD[0] member of the ExtraInfo member.
     * 
     * The OIDs in the ECC curve name public keys, for example, szOID_ECC_CURVE_P256 ("1.2.840.10045.3.1.7"), have a flag set in the DWORD[0] member, a BCRYPT_ECCKEY_BLOB dwMagic field value set in the DWORD[1] member, and a bit length where the BCRYPT_ECCKEY_BLOB cbKey value equals dwBitLength / 8 + ((dwBitLength % 8) ? 1 : 0) set in the DWORD[2] member of the ExtraInfo member.
     * 
     * The OIDs in the CRYPT_SIGN_ALG_OID_GROUP_ID group have a public key algorithm identifier set in the DWORD[0] member,  a flag set in the DWORD[1] member, and an optional provider type set in the DWORD[2] member of the ExtraInfo member.
     * 
     * The OIDs in the CRYPT_RDN_ATTR_OID_GROUP_ID group have a null-terminated list of acceptable RDN attribute value types set in an array of <b>DWORD</b> values in the ExtraInfo member. An omitted list implies an array of values where the first value in the array is  CERT_RDN_PRINTABLE_STRING, the second value in the array is CERT_RDN_UNICODE_STRING, and the third value in the array is zero.
     * 
     * 
     * The following values are used for the flags in the <b>ExtraInfo</b> member.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_OID_INHIBIT_SIGNATURE_FORMAT_FLAG"></a><a id="crypt_oid_inhibit_signature_format_flag"></a><dl>
     * <dt><b>CRYPT_OID_INHIBIT_SIGNATURE_FORMAT_FLAG</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is no longer used.
     * 
     * Stop the reformatting of the signature before the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptverifysignaturea">CryptVerifySignature</a> function is called or after the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptsignhasha">CryptSignHash</a> function is called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_OID_NO_NULL_ALGORITHM_PARA_FLAG"></a><a id="crypt_oid_no_null_algorithm_para_flag"></a><dl>
     * <dt><b>CRYPT_OID_NO_NULL_ALGORITHM_PARA_FLAG</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Omit <b>NULL</b> parameters when encoding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_OID_PUBKEY_ENCRYPT_ONLY_FLAG"></a><a id="crypt_oid_pubkey_encrypt_only_flag"></a><dl>
     * <dt><b>CRYPT_OID_PUBKEY_ENCRYPT_ONLY_FLAG</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The public key is only used for encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_OID_PUBKEY_SIGN_ONLY_FLAG"></a><a id="crypt_oid_pubkey_sign_only_flag"></a><dl>
     * <dt><b>CRYPT_OID_PUBKEY_SIGN_ONLY_FLAG</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The public key is only used for signatures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPT_OID_USE_PUBKEY_PARA_FOR_PKCS7_FLAG"></a><a id="crypt_oid_use_pubkey_para_for_pkcs7_flag"></a><dl>
     * <dt><b>CRYPT_OID_USE_PUBKEY_PARA_FOR_PKCS7_FLAG</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is no longer used.
     * 
     * Include the parameters of the public key algorithm in the <i>digestEncryptionAlgorithm</i> parameters for the PKCS #7 message.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {CRYPT_INTEGER_BLOB}
     */
    ExtraInfo{
        get {
            if(!this.HasProp("__ExtraInfo"))
                this.__ExtraInfo := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__ExtraInfo
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}
