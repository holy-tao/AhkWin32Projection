#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_pkcs8_import_params
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_PKCS8_IMPORT_PARAMS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DIGEST_BLOB</a> structure that contains the PKCS #8 data.
     * @type {CRYPT_INTEGER_BLOB}
     */
    PrivateKey{
        get {
            if(!this.HasProp("__PrivateKey"))
                this.__PrivateKey := CRYPT_INTEGER_BLOB(0, this)
            return this.__PrivateKey
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pcrypt_resolve_hcryptprov_func">PCRYPT_RESOLVE_HCRYPTPROV_FUNC</a> pointer  that points to data used by a user-defined function that retrieves a handle to a CSP.
     * @type {Pointer<PCRYPT_RESOLVE_HCRYPTPROV_FUNC>}
     */
    pResolvehCryptProvFunc {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * An  <b>LPVOID</b>  value that identifies the function used to retrieve the CSP provider handle.
     * @type {Pointer<Void>}
     */
    pVoidResolveFunc {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pcrypt_decrypt_private_key_func">PCRYPT_DECRYPT_PRIVATE_KEY_FUNC</a> pointer that points to  a callback function used to decrypt the private key.
     * @type {Pointer<PCRYPT_DECRYPT_PRIVATE_KEY_FUNC>}
     */
    pDecryptPrivateKeyFunc {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * An <b>LPVOID</b> value that provides data used for encryption, such as key, initialization vector, and password.
     * @type {Pointer<Void>}
     */
    pVoidDecryptFunc {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
