#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CMSG_CNG_CONTENT_DECRYPT_INFO.ahk" { CMSG_CNG_CONTENT_DECRYPT_INFO }
#Import ".\CMSG_CTRL_KEY_AGREE_DECRYPT_PARA.ahk" { CMSG_CTRL_KEY_AGREE_DECRYPT_PARA }

/**
 * Decrypts a content encryption key (CEK) that is intended for a key agreement recipient.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgcontrol">CryptMsgControl</a> function calls this function for the following operations specified by the <i>dwCtrlType</i> parameter:
 * 
 * <b>CMSG_CTRL_KEY_AGREE_DECRYPT</b>
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constant for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CMSG_OID_CNG_IMPORT_KEY_AGREE_FUNC</td>
 * <td>"CryptMsgDllCNGImportKeyAgree"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cmsg_cng_import_key_agree
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CMSG_CNG_IMPORT_KEY_AGREE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CMSG_CNG_IMPORT_KEY_AGREE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CMSG_CNG_CONTENT_DECRYPT_INFO>} pCNGContentDecryptInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_cng_content_decrypt_info">CMSG_CNG_CONTENT_DECRYPT_INFO</a> structure to be updated with the decrypted CEK bytes. This parameter contains the key used to decrypt the CEK.
     * The following <i>pKeyTransDecryptPara</i> parameter contains the 	CEK bytes to be decrypted.
     * @param {Pointer<CMSG_CTRL_KEY_AGREE_DECRYPT_PARA>} pKeyAgreeDecryptPara A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_ctrl_key_trans_decrypt_para">CMSG_CTRL_KEY_AGREE_DECRYPT_PARA</a> structure that contains the key agreement information passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptmsgcontrol">CryptMsgControl</a> function in the <b>CMSG_CTRL_KEY_AGREE_DECRYPT</b> case.
     * 
     * The
     * <b>EncryptedKey</b> member of the <b>pKeyAgree</b> member contains the CEK bytes to be decrypted. Because a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_ctrl_key_trans_decrypt_para">CMSG_CTRL_KEY_AGREE_DECRYPT_PARA</a> structure might contain an <b>HCRYPTPROV</b> choice, its <b>hNCryptKey</b> member must not be used to decrypt <b>EncryptedKey</b>. Instead, you must use the <b>hNCryptKey</b> member specified in the <i>pCNGContentDecryptInfo</i> parameter.
     * 
     * 
     * This function must not update members of the  <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_ctrl_key_trans_decrypt_para">CMSG_CTRL_KEY_AGREE_DECRYPT_PARA</a> structure.
     * @param {Integer} dwFlags This parameter is reserved. Set it to zero.
     * @returns {BOOL} If the function succeeds, the return value is nonzero (<b>TRUE</b>).
     * 
     * If the function fails, the return value is zero (<b>FALSE</b>). For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * 
     * 
     * If this callback function does not support the key encryption algorithm, it must return <b>FALSE</b> and call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> with ERROR_NOT_SUPPORTED.
     */
    Call(pCNGContentDecryptInfo, pKeyAgreeDecryptPara, dwFlags) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, CMSG_CNG_CONTENT_DECRYPT_INFO.Ptr, pCNGContentDecryptInfo, CMSG_CTRL_KEY_AGREE_DECRYPT_PARA.Ptr, pKeyAgreeDecryptPara, UInt32, dwFlags, "ptr", pvReserved, BOOL)
        return result
    }

    /**
     * A PFN_CMSG_CNG_IMPORT_KEY_AGREE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CMSG_CNG_IMPORT_KEY_AGREE {
        /**
         * Creates a PFN_CMSG_CNG_IMPORT_KEY_AGREE pointer that invokes the given AHK function when called.
         * @param {Func(CMSG_CNG_CONTENT_DECRYPT_INFO, CMSG_CTRL_KEY_AGREE_DECRYPT_PARA, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CMSG_CNG_CONTENT_DECRYPT_INFO.Ptr, CMSG_CTRL_KEY_AGREE_DECRYPT_PARA.Ptr, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
