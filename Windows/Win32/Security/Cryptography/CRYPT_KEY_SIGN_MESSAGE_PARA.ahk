#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CERT_QUERY_ENCODING_TYPE.ahk
#Include .\NCRYPT_KEY_HANDLE.ahk
#Include .\CERT_KEY_SPEC.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains information about the cryptographic service provider (CSP) and algorithms used to sign a message.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_key_sign_message_para
 * @namespace Windows.Win32.Security.Cryptography
 */
class CRYPT_KEY_SIGN_MESSAGE_PARA extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * The size, in bytes, of this data structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {CERT_QUERY_ENCODING_TYPE}
     */
    dwMsgAndCertEncodingType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    hCryptProv {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {NCRYPT_KEY_HANDLE}
     */
    hNCryptKey {
        get {
            if(!this.HasProp("__hNCryptKey"))
                this.__hNCryptKey := NCRYPT_KEY_HANDLE(8, this)
            return this.__hNCryptKey
        }
    }

    /**
     * @type {CERT_KEY_SPEC}
     */
    dwKeySpec {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm to use to generate the hash of the message. This must be a hash algorithm.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    HashAlgorithm {
        get {
            if(!this.HasProp("__HashAlgorithm"))
                this.__HashAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(24, this)
            return this.__HashAlgorithm
        }
    }

    /**
     * This member is not used and must be set to <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pvHashAuxInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm to use to sign the message. This must be either a public key or a signature algorithm.
     * @type {CRYPT_ALGORITHM_IDENTIFIER}
     */
    PubKeyAlgorithm {
        get {
            if(!this.HasProp("__PubKeyAlgorithm"))
                this.__PubKeyAlgorithm := CRYPT_ALGORITHM_IDENTIFIER(56, this)
            return this.__PubKeyAlgorithm
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 80
    }
}
