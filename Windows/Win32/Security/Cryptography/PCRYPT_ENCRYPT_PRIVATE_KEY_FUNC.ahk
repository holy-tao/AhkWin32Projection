#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }

/**
 * Encrypts the private key and returns the encrypted contents in the pbEncryptedKey parameter.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pcrypt_encrypt_private_key_func
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_ALGORITHM_IDENTIFIER>} pAlgorithm A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure to receive the algorithm used to encrypt the PrivateKeyInfo ASN.1 type found in the PKCS #8 standard.
     * @param {Pointer<CRYPT_INTEGER_BLOB>} pClearTextPrivateKey A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">plaintext</a> private key to be encrypted.
     * @param {Integer} pbEncryptedKey A pointer to a <b>BYTE</b> buffer to receive the encrypted <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key BLOB</a>. If this parameter is <b>NULL</b>, <i>pcbEncryptedKey</i> will return the size, in bytes, of memory needed to contain the encrypted key on a subsequent call to this function.
     * @param {Pointer<Integer>} pcbEncryptedKey A pointer to a <b>DWORD</b>  variable that contains the size, in  bytes, of the <i>pbEncryptedKey</i> buffer. If pbEncryptedKey is  <b>NULL</b>, then <i>pcbEncryptedKey</i>  is
     * set to the size, in bytes,  required to encrypt the
     * key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/retrieving-data-of-unknown-length">Retrieving Data of Unknown Length</a>.
     * @param {Pointer<Void>} pVoidEncryptFunc An  <b>LPVOID</b> variable that contains data used for encryption, such as key, initialization vector, and password.
     * @returns {BOOL} If the function succeeds, the function returns nonzero (<b>TRUE</b>).
     * 
     * 
     * If the function fails, it returns zero (<b>FALSE</b>).
     */
    Call(pAlgorithm, pClearTextPrivateKey, pbEncryptedKey, pcbEncryptedKey, pVoidEncryptFunc) {
        pcbEncryptedKeyMarshal := pcbEncryptedKey is VarRef ? "uint*" : "ptr"
        pVoidEncryptFuncMarshal := pVoidEncryptFunc is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CRYPT_ALGORITHM_IDENTIFIER.Ptr, pAlgorithm, CRYPT_INTEGER_BLOB.Ptr, pClearTextPrivateKey, IntPtr, pbEncryptedKey, pcbEncryptedKeyMarshal, pcbEncryptedKey, pVoidEncryptFuncMarshal, pVoidEncryptFunc, BOOL)
        return result
    }

    /**
     * A PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC {
        /**
         * Creates a PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_ALGORITHM_IDENTIFIER, CRYPT_INTEGER_BLOB, IntPtr, "uint*", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_ALGORITHM_IDENTIFIER.Ptr, CRYPT_INTEGER_BLOB.Ptr, IntPtr, "uint*", "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
