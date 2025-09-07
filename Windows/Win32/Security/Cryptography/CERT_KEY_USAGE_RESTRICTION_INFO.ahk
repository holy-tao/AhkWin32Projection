#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * The CERT_KEY_USAGE_RESTRICTION_INFO structure contains restrictions imposed on the usage of a certificate's public key. This includes purposes for use of the key and policies under which the key can be used.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_key_usage_restriction_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_KEY_USAGE_RESTRICTION_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The number of elements in the <b>rgCertPolicyId</b> array.
     * @type {Integer}
     */
    cCertPolicyId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_policy_id">CERT_POLICY_ID</a> structures.
     * @type {Pointer<CERT_POLICY_ID>}
     */
    rgCertPolicyId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

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
     * @type {CRYPT_BIT_BLOB}
     */
    RestrictedKeyUsage{
        get {
            if(!this.HasProp("__RestrictedKeyUsage"))
                this.__RestrictedKeyUsage := CRYPT_BIT_BLOB(this.ptr + 16)
            return this.__RestrictedKeyUsage
        }
    }
}
