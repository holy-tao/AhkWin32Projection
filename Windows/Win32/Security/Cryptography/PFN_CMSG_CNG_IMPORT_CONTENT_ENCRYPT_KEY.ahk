#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CMSG_CNG_CONTENT_DECRYPT_INFO.ahk" { CMSG_CNG_CONTENT_DECRYPT_INFO }

/**
 * Imports an already decrypted content encryption key (CEK).
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgcontrol">CryptMsgControl</a> function calls this function for the following operations specified by its <i>dwCtrlType</i> parameter:<dl>
 * <dd><b>CMSG_CTRL_DECRYPT</b></dd>
 * <dd><b>CMSG_CTRL_KEY_TRANS_DECRYPT</b></dd>
 * <dd><b>CMSG_CTRL_KEY_AGREE_DECRYPT</b></dd>
 * </dl>
 * 
 * 
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constant for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CMSG_OID_CNG_IMPORT_CONTENT_ENCRYPT_KEY_FUNC</td>
 * <td>"CryptMsgDllCNGImportContentEncryptKey"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_content_encrypt_key
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CMSG_CNG_CONTENT_DECRYPT_INFO>} pCNGContentDecryptInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_cng_content_decrypt_info">CMSG_CNG_CONTENT_DECRYPT_INFO</a> structure to be updated with the imported CEK. This structure contains all the relevant information passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgcontrol">CryptMsgControl</a> function.
     * @param {Integer} dwFlags This parameter is reserved. Set it to zero.
     * @returns {BOOL} If the function succeeds, the return value is nonzero (<b>TRUE</b>).
     * 
     * If the function fails, the return value is zero (<b>FALSE</b>). For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * 
     * 
     * If this callback function does not support the key encryption algorithm, it must return <b>FALSE</b> and call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> with ERROR_NOT_SUPPORTED.
     */
    Call(pCNGContentDecryptInfo, dwFlags) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, CMSG_CNG_CONTENT_DECRYPT_INFO.Ptr, pCNGContentDecryptInfo, UInt32, dwFlags, "ptr", pvReserved, BOOL)
        return result
    }

    /**
     * A PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY {
        /**
         * Creates a PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY pointer that invokes the given AHK function when called.
         * @param {Func(CMSG_CNG_CONTENT_DECRYPT_INFO, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CMSG_CNG_CONTENT_DECRYPT_INFO.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
