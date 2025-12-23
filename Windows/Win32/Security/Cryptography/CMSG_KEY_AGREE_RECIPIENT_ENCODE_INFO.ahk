#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\HCRYPTPROV_LEGACY.ahk

/**
 * Contains information about a message recipient that is using key agreement key management.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_agree_recipient_encode_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO extends Win32Struct
{
    static sizeof => 128

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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used for encryption.
     * 
     * For ECC recipients, the <b>pszObjId</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure should be set to szOID_DH_SINGLE_PASS_STDDH_SHA1_KDF with the <b>dwKeyChoice</b> member of this <b>CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO</b> structure set to CMSG_KEY_AGREE_EPHEMERAL_KEY_CHOICE.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    KeyEncryptionAlgorithm{
        get {
            if(!this.HasProp("__KeyEncryptionAlgorithm"))
                this.__KeyEncryptionAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(8, this)
            return this.__KeyEncryptionAlgorithm
        }
    }

    /**
     * This member is not currently used. It must be set to <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pvKeyEncryptionAuxInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used for key wrapping.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    KeyWrapAlgorithm{
        get {
            if(!this.HasProp("__KeyWrapAlgorithm"))
                this.__KeyWrapAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(40, this)
            return this.__KeyWrapAlgorithm
        }
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_rc2_aux_info">CMSG_RC2_AUX_INFO</a> structure that specifies the key wrapping bit length. This member is only used if the <b>KeyWrapAlgorithm</b> member specifies an RC2 algorithm. If <b>KeyWrapAlgorithm</b> specifies an algorithm other than an RC2 algorithm, this member is not used and must be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pvKeyWrapAuxInfo {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * This member is not used and should be set to <b>NULL</b>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) obtained by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a> function. This member is optional and can be <b>NULL</b>.This member's data type is <b>HCRYPTPROV</b>.
     * @type {HCRYPTPROV_LEGACY}
     */
    hCryptProv{
        get {
            if(!this.HasProp("__hCryptProv"))
                this.__hCryptProv := HCRYPTPROV_LEGACY(72, this)
            return this.__hCryptProv
        }
    }

    /**
     * This member is not currently used.
     * @type {Integer}
     */
    dwKeySpec {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * 
     * @type {Integer}
     */
    dwKeyChoice {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Pointer<CRYPT_ALGORITHM_IDENTIFIER>}
     */
    pEphemeralAlgorithm {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<CERT_ID>}
     */
    pSenderId {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains user keying material (UKM) provided by the sender to ensure that a different key is generated each time the same two parties generate a pair-wise key. This member is optional and all members should be set to zero if not used.
     * @type {CRYPT_INTEGER_BLOB}
     */
    UserKeyingMaterial{
        get {
            if(!this.HasProp("__UserKeyingMaterial"))
                this.__UserKeyingMaterial := CRYPT_INTEGER_BLOB(96, this)
            return this.__UserKeyingMaterial
        }
    }

    /**
     * The number of elements in the <b>rgpRecipientEncryptedKeys</b> array.
     * @type {Integer}
     */
    cRecipientEncryptedKeys {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * An array of  <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_recipient_encrypted_key_encode_info">CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO</a> structures, one for each recipient to receive this key agreement key. The <b>cRecipientEncryptedKeys</b> member contains the number of elements in this structure.
     * @type {Pointer<Pointer<CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO>>}
     */
    rgpRecipientEncryptedKeys {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 128
    }
}
