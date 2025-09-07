#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CERT_ISSUER_SERIAL_NUMBER.ahk
#Include .\CERT_ID.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_BIT_BLOB.ahk
#Include .\CERT_PUBLIC_KEY_INFO.ahk

/**
 * Contains information used for key agreement algorithms.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_agree_recipient_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_KEY_AGREE_RECIPIENT_INFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A <b>DWORD</b> that indicates the version of the structure. Always set to three.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <b>DWORD</b> that indicates the key identifier to use.
     * @type {Integer}
     */
    dwOriginatorChoice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {CERT_ID}
     */
    OriginatorCertId{
        get {
            if(!this.HasProp("__OriginatorCertId"))
                this.__OriginatorCertId := CERT_ID(this.ptr + 8)
            return this.__OriginatorCertId
        }
    }

    /**
     * @type {CERT_PUBLIC_KEY_INFO}
     */
    OriginatorPublicKeyInfo{
        get {
            if(!this.HasProp("__OriginatorPublicKeyInfo"))
                this.__OriginatorPublicKeyInfo := CERT_PUBLIC_KEY_INFO(this.ptr + 8)
            return this.__OriginatorPublicKeyInfo
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that indicates that a different key is generated each time the same two parties generate a pair of keys. The sender provides the bits of this <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> with some key agreement algorithms. This member can be <b>NULL</b>.
     * @type {CRYPT_INTEGER_BLOB}
     */
    UserKeyingMaterial{
        get {
            if(!this.HasProp("__UserKeyingMaterial"))
                this.__UserKeyingMaterial := CRYPT_INTEGER_BLOB(this.ptr + 32)
            return this.__UserKeyingMaterial
        }
    }

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> that identifies the key-encryption algorithm and any associated parameters used to encrypt the content encryption key.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    KeyEncryptionAlgorithm{
        get {
            if(!this.HasProp("__KeyEncryptionAlgorithm"))
                this.__KeyEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(this.ptr + 48)
            return this.__KeyEncryptionAlgorithm
        }
    }

    /**
     * The number of elements in the <b>rgpRecipientEncryptedKeys</b> array.
     * @type {Integer}
     */
    cRecipientEncryptedKeys {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The address of an array of <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_recipient_encrypted_key_info">CMSG_RECIPIENT_ENCRYPTED_KEY_INFO</a> structures that contains information about the key recipients. The <b>cRecipientEncryptedKeys</b> member contains the number of elements in this array.
     * @type {Pointer<CMSG_RECIPIENT_ENCRYPTED_KEY_INFO>}
     */
    rgpRecipientEncryptedKeys {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
