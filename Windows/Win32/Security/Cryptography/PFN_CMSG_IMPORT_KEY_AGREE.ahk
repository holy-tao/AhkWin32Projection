#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CMSG_CTRL_KEY_AGREE_DECRYPT_PARA.ahk" { CMSG_CTRL_KEY_AGREE_DECRYPT_PARA }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }

/**
 * Imports a content encryption key for a key transport recipient of an enveloped message. (PFN_CMSG_IMPORT_KEY_AGREE)
 * @remarks
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constants for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CMSG_OID_IMPORT_KEY_AGREE_FUNC or CMSG_OID_CAPI1_IMPORT_KEY_AGREE_FUNC</td>
 * <td>"CryptMsgDllImportKeyAgree"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cmsg_import_key_agree
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CMSG_IMPORT_KEY_AGREE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CMSG_IMPORT_KEY_AGREE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CRYPT_ALGORITHM_IDENTIFIER>} pContentEncryptionAlgorithm A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> structure that specifies the algorithm used to encrypt the message contents and any associated parameters.
     * @param {Pointer<CMSG_CTRL_KEY_AGREE_DECRYPT_PARA>} pKeyAgreeDecryptPara A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_ctrl_key_agree_decrypt_para">CMSG_CTRL_KEY_AGREE_DECRYPT_PARA</a> structure that contains information about the key agreement recipient.
     * @param {Integer} dwFlags This value is not used. Set it to zero.
     * @param {Pointer<Pointer>} phContentEncryptKey The address of a handle to the content encryption key returned by this function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero (<b>TRUE</b>).
     * 
     * If the function fails, the return value is zero (<b>FALSE</b>). For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * 
     * 
     * If this callback function does not support the key encryption algorithm, it must return <b>FALSE</b> and call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> with <b>E_NOTIMPL</b>.
     */
    Call(pContentEncryptionAlgorithm, pKeyAgreeDecryptPara, dwFlags, phContentEncryptKey) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        phContentEncryptKeyMarshal := phContentEncryptKey is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, CRYPT_ALGORITHM_IDENTIFIER.Ptr, pContentEncryptionAlgorithm, CMSG_CTRL_KEY_AGREE_DECRYPT_PARA.Ptr, pKeyAgreeDecryptPara, UInt32, dwFlags, "ptr", pvReserved, phContentEncryptKeyMarshal, phContentEncryptKey, BOOL)
        return result
    }

    /**
     * A PFN_CMSG_IMPORT_KEY_AGREE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CMSG_IMPORT_KEY_AGREE {
        /**
         * Creates a PFN_CMSG_IMPORT_KEY_AGREE pointer that invokes the given AHK function when called.
         * @param {Func(CRYPT_ALGORITHM_IDENTIFIER, CMSG_CTRL_KEY_AGREE_DECRYPT_PARA, UInt32, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CRYPT_ALGORITHM_IDENTIFIER.Ptr, CMSG_CTRL_KEY_AGREE_DECRYPT_PARA.Ptr, UInt32, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
