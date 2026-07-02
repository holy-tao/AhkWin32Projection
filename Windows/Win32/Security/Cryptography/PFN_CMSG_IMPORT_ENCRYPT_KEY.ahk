#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CMSG_IMPORT_ENCRYPT_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CMSG_IMPORT_ENCRYPT_KEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} hCryptProv 
     * @param {Integer} dwKeySpec 
     * @param {Pointer<CRYPT_ALGORITHM_IDENTIFIER>} paiEncrypt 
     * @param {Pointer<CRYPT_ALGORITHM_IDENTIFIER>} paiPubKey 
     * @param {Integer} pbEncodedKey 
     * @param {Integer} cbEncodedKey 
     * @param {Pointer<Pointer>} phEncryptKey 
     * @returns {BOOL} 
     */
    Call(hCryptProv, dwKeySpec, paiEncrypt, paiPubKey, pbEncodedKey, cbEncodedKey, phEncryptKey) {
        phEncryptKeyMarshal := phEncryptKey is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IntPtr, hCryptProv, UInt32, dwKeySpec, CRYPT_ALGORITHM_IDENTIFIER.Ptr, paiEncrypt, CRYPT_ALGORITHM_IDENTIFIER.Ptr, paiPubKey, IntPtr, pbEncodedKey, UInt32, cbEncodedKey, phEncryptKeyMarshal, phEncryptKey, BOOL)
        return result
    }

    /**
     * A PFN_CMSG_IMPORT_ENCRYPT_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CMSG_IMPORT_ENCRYPT_KEY {
        /**
         * Creates a PFN_CMSG_IMPORT_ENCRYPT_KEY pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, CRYPT_ALGORITHM_IDENTIFIER, CRYPT_ALGORITHM_IDENTIFIER, IntPtr, UInt32, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, CRYPT_ALGORITHM_IDENTIFIER.Ptr, CRYPT_ALGORITHM_IDENTIFIER.Ptr, IntPtr, UInt32, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
