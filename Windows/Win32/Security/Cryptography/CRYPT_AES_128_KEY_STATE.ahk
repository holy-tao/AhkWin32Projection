#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the 128-bit symmetric key information for an Advanced Encryption Standard (AES) cipher.
 * @remarks
 * The <b>CRYPT_AES_128_KEY_STATE</b> structure is used by the <a href="https://docs.microsoft.com/previous-versions/aa379853(v=vs.85)">CPImportKey</a> and <a href="https://docs.microsoft.com/previous-versions/aa378203(v=vs.85)">CPExportKey</a> functions when the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key BLOB</a> was created by using the <i>dwBlobType</i>  parameter set to the <b>KEYSTATEBLOB</b> value.
  * 
  *    The Microsoft AES Cryptographic Provider only supports this structure in the context of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Secure Sockets Layer protocol</a> (SSL), where the caller specified <b>PROV_DH_SCHANNEL</b> as the value for the <i>dwProvType</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_aes_128_key_state
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_AES_128_KEY_STATE extends Win32Struct
{
    static sizeof => 400

    static packingSize => 1

    /**
     * An array of hexadecimal values that specify a 128-bit <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cipher</a> key.
     * @type {Array<Byte>}
     */
    Key{
        get {
            if(!this.HasProp("__KeyProxyArray"))
                this.__KeyProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__KeyProxyArray
        }
    }

    /**
     * An array of hexadecimal values that specify an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">initialization vector</a> (IV) for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cipher</a>.
     * @type {Array<Byte>}
     */
    IV{
        get {
            if(!this.HasProp("__IVProxyArray"))
                this.__IVProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__IVProxyArray
        }
    }

    /**
     * An array of hexadecimal values that specify an 11-round encryption key schedule.
     * @type {Array<Byte>}
     */
    EncryptionState{
        get {
            if(!this.HasProp("__EncryptionStateProxyArray"))
                this.__EncryptionStateProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__EncryptionStateProxyArray
        }
    }

    /**
     * An array of hexadecimal values that specify an 11-round decryption key schedule.
     * @type {Array<Byte>}
     */
    DecryptionState{
        get {
            if(!this.HasProp("__DecryptionStateProxyArray"))
                this.__DecryptionStateProxyArray := Win32FixedArray(this.ptr + 208, 1, Primitive, "char")
            return this.__DecryptionStateProxyArray
        }
    }

    /**
     * An array of hexadecimal values that specify the feedback vector for a stage in the encryption or decryption process.
     * @type {Array<Byte>}
     */
    Feedback{
        get {
            if(!this.HasProp("__FeedbackProxyArray"))
                this.__FeedbackProxyArray := Win32FixedArray(this.ptr + 384, 1, Primitive, "char")
            return this.__FeedbackProxyArray
        }
    }
}
