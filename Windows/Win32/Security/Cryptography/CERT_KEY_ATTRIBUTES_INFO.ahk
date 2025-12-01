#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * The CERT_KEY_ATTRIBUTES_INFO structure contains optional additional information about the public key being certified.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_key_attributes_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_KEY_ATTRIBUTES_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure with a unique identifier of a key.
     * @type {CRYPT_INTEGER_BLOB}
     */
    KeyId{
        get {
            if(!this.HasProp("__KeyId"))
                this.__KeyId := CRYPT_INTEGER_BLOB(0, this)
            return this.__KeyId
        }
    }

    /**
     * <b>CRYPT_BIT_BLOB</b> with it <b>pbData</b> member indicating the intended purpose of the key. For a list of usage bit values, see the <b>RestrictedKeyUsage</b> member of 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_key_usage_restriction_info">CERT_KEY_USAGE_RESTRICTION_INFO</a> structure. 
     * 
     * 
     * 
     * 
     * This member can be used to find the correct key or certificate of a user who has multiple keys or certificates. Its indication of usage is advisory field, only, and does not imply that usage of the key is restricted to the purpose indicated. The list of intended uses is not necessarily all-inclusive, and the field can be omitted. If a key is to be restricted to a particular use a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_key_usage_restriction_info">CERT_KEY_USAGE_RESTRICTION_INFO</a> extension must be used.
     * @type {CRYPT_BIT_BLOB}
     */
    IntendedKeyUsage{
        get {
            if(!this.HasProp("__IntendedKeyUsage"))
                this.__IntendedKeyUsage := CRYPT_BIT_BLOB(16, this)
            return this.__IntendedKeyUsage
        }
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_private_key_validity">CERT_PRIVATE_KEY_VALIDITY</a> structure that indicates the period of use of the private key corresponding to the certified public key. This member is optional and can be set to <b>NULL</b>.
     * @type {Pointer<CERT_PRIVATE_KEY_VALIDITY>}
     */
    pPrivateKeyUsagePeriod {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
