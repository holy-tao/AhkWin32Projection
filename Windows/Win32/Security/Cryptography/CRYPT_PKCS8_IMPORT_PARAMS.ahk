#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * Contains a PKCS
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_pkcs8_import_params
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_PKCS8_IMPORT_PARAMS {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DIGEST_BLOB</a> structure that contains the PKCS #8 data.
     */
    PrivateKey : CRYPT_INTEGER_BLOB

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pcrypt_resolve_hcryptprov_func">PCRYPT_RESOLVE_HCRYPTPROV_FUNC</a> pointer  that points to data used by a user-defined function that retrieves a handle to a CSP.
     */
    pResolvehCryptProvFunc : IntPtr

    /**
     * An  <b>LPVOID</b>  value that identifies the function used to retrieve the CSP provider handle.
     */
    pVoidResolveFunc : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nc-wincrypt-pcrypt_decrypt_private_key_func">PCRYPT_DECRYPT_PRIVATE_KEY_FUNC</a> pointer that points to  a callback function used to decrypt the private key.
     */
    pDecryptPrivateKeyFunc : IntPtr

    /**
     * An <b>LPVOID</b> value that provides data used for encryption, such as key, initialization vector, and password.
     */
    pVoidDecryptFunc : IntPtr

}
