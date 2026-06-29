#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }
#Import ".\CERT_POLICY_ID.ahk" { CERT_POLICY_ID }

/**
 * The CERT_KEY_USAGE_RESTRICTION_INFO structure contains restrictions imposed on the usage of a certificate's public key. This includes purposes for use of the key and policies under which the key can be used.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_key_usage_restriction_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_KEY_USAGE_RESTRICTION_INFO {
    #StructPack 8

    /**
     * The number of elements in the <b>rgCertPolicyId</b> array.
     */
    cCertPolicyId : UInt32

    /**
     * An array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_policy_id">CERT_POLICY_ID</a> structures.
     */
    rgCertPolicyId : CERT_POLICY_ID.Ptr

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> value that includes, as its <b>pbData</b>, a byte that indicates the purposes for which the key can be used. 
     * 
     * 
     * 
     * 
     * If the <b>cbData</b> member is zero, the key has no usage restrictions.
     * 
     * The following are currently defined values for the <b>pbData</b> member of <b>RestrictedKeyUsage</b>. These can be combined using a bitwise-<b>OR</b> operation.
     * 
     * <ul>
     * <li>CERT_DATA_ENCIPHERMENT_KEY_USAGE</li>
     * <li>CERT_DIGITAL_SIGNATURE_KEY_USAGE</li>
     * <li>CERT_KEY_AGREEMENT_KEY_USAGE</li>
     * <li>CERT_KEY_CERT_SIGN_KEY_USAGE</li>
     * <li>CERT_KEY_ENCIPHERMENT_KEY_USAGE</li>
     * <li>CERT_NON_REPUDIATION_KEY_USAGE</li>
     * <li>CERT_OFFLINE_CRL_SIGN_KEY_USAGE</li>
     * </ul>
     */
    RestrictedKeyUsage : CRYPT_BIT_BLOB

}
