#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }

/**
 * Decrypts the private key and returns the decrypted key in the pbClearTextKey parameter.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pcrypt_decrypt_private_key_func
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PCRYPT_DECRYPT_PRIVATE_KEY_FUNC {
    value : IntPtr

    __value {
        set {
            if (value is PCRYPT_DECRYPT_PRIVATE_KEY_FUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {CRYPT_ALGORITHM_IDENTIFIER} Algorithm A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that identifies the algorithm used to encrypt the PrivateKeyInfo ASN.1 type found in the PKCS #8 standard.
     * @param {CRYPT_INTEGER_BLOB} EncryptedPrivateKey A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a>  value that identifies the encrypted private key  <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a>.
     * @param {Integer} pbClearTextKey A pointer to a <b>BYTE</b> buffer to receive the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">plaintext</a>. This parameter can be <b>NULL</b>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/retrieving-data-of-unknown-length">Retrieving Data of Unknown Length</a>.
     * @param {Pointer<Integer>} pcbClearTextKey A pointer to a  <b>DWORD</b>  value that identifies the size, in  bytes, of the <i>pbClearTextKey</i> buffer. If the size is zero, then <i>pcbClearTextKey</i> should be                  filled with the size, in bytes, required to decrypt the
     * key, and <i>pbClearTextKey</i> should be ignored.
     * @param {Pointer<Void>} pVoidDecryptFunc An <b>LPVOID</b>  value that provides data used in decryption, such as key, initialization vector, and password.
     * @returns {BOOL} If the function succeeds, the function returns nonzero (<b>TRUE</b>).
     * 
     * If the function fails, it returns zero (<b>FALSE</b>).
     */
    Call(Algorithm, EncryptedPrivateKey, pbClearTextKey, pcbClearTextKey, pVoidDecryptFunc) {
        pcbClearTextKeyMarshal := pcbClearTextKey is VarRef ? "uint*" : "ptr"
        pVoidDecryptFuncMarshal := pVoidDecryptFunc is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, CRYPT_ALGORITHM_IDENTIFIER, Algorithm, CRYPT_INTEGER_BLOB, EncryptedPrivateKey, IntPtr, pbClearTextKey, pcbClearTextKeyMarshal, pcbClearTextKey, pVoidDecryptFuncMarshal, pVoidDecryptFunc, BOOL)
        return result
    }

    /**
     * A PCRYPT_DECRYPT_PRIVATE_KEY_FUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCRYPT_DECRYPT_PRIVATE_KEY_FUNC {
        /**
         * Creates a PCRYPT_DECRYPT_PRIVATE_KEY_FUNC pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_ALGORITHM_IDENTIFIER, CRYPT_INTEGER_BLOB, IntPtr, "uint*", "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_ALGORITHM_IDENTIFIER, CRYPT_INTEGER_BLOB, IntPtr, "uint*", "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
