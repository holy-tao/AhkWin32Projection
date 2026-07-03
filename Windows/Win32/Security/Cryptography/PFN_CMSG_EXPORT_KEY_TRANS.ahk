#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CMSG_CONTENT_ENCRYPT_INFO.ahk" { CMSG_CONTENT_ENCRYPT_INFO }
#Import ".\CMSG_KEY_TRANS_ENCRYPT_INFO.ahk" { CMSG_KEY_TRANS_ENCRYPT_INFO }
#Import ".\CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO.ahk" { CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO }

/**
 * Encrypts and exports the content encryption key for a key transport recipient of an enveloped message.
 * @remarks
 * The <b>PFN_CMSG_EXPORT_KEY_TRANS</b> function must update the <b>EncryptedKey</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_trans_encrypt_info">CMSG_KEY_TRANS_ENCRYPT_INFO</a> structure pointed to by the <i>pKeyTransEncryptInfo</i> parameter. This function must use the <b>pfnAlloc</b> and <b>pfnFree</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure pointed to by the <i>pContentEncryptInfo</i> parameter to manage memory allocation for the encrypted key.
 * 
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constants for this purpose.
 * 
 * You must define different callback functions for CAPI1 keys and Cryptography API: Next Generation (CNG) keys. Both functions have the same signature but use different OIDs. Which function is called depends on the value of the <b>fCNG</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure pointed to by the <i>pContentEncryptInfo</i> parameter. The following table shows the relationship between the callback function and the value of the <b>fCNG</b> member.
 * 
 * <table>
 * <tr>
 * <th>fCNG value</th>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>FALSE</td>
 * <td>CMSG_OID_EXPORT_KEY_TRANS_FUNC or CMSG_OID_CAPI1_EXPORT_KEY_TRANS_FUNC</td>
 * <td>"CryptMsgDllExportKeyTrans"</td>
 * </tr>
 * <tr>
 * <td>TRUE</td>
 * <td>CMSG_OID_CNG_EXPORT_KEY_TRANS_FUNC</td>
 * <td>"CryptMsgDllCNGExportKeyTrans"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cmsg_export_key_trans
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CMSG_EXPORT_KEY_TRANS {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CMSG_EXPORT_KEY_TRANS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CMSG_CONTENT_ENCRYPT_INFO>} pContentEncryptInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure that contains the content encryption key.
     * @param {Pointer<CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO>} pKeyTransEncodeInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_trans_recipient_encode_info">CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO</a> structure that specifies the recipient public key used to encrypt the content encryption key.
     * @param {Pointer<CMSG_KEY_TRANS_ENCRYPT_INFO>} pKeyTransEncryptInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_key_trans_encrypt_info">CMSG_KEY_TRANS_ENCRYPT_INFO</a> structure that contains the encrypted content encryption key.
     * @param {Integer} dwFlags This value is not used. Set it to zero.
     * @returns {BOOL} If the function succeeds, the return value is nonzero (TRUE).
     * 
     * If the function fails, the return value is zero (FALSE). For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     */
    Call(pContentEncryptInfo, pKeyTransEncodeInfo, pKeyTransEncryptInfo, dwFlags) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, CMSG_CONTENT_ENCRYPT_INFO.Ptr, pContentEncryptInfo, CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO.Ptr, pKeyTransEncodeInfo, CMSG_KEY_TRANS_ENCRYPT_INFO.Ptr, pKeyTransEncryptInfo, UInt32, dwFlags, "ptr", pvReserved, BOOL)
        return result
    }

    /**
     * A PFN_CMSG_EXPORT_KEY_TRANS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CMSG_EXPORT_KEY_TRANS {
        /**
         * Creates a PFN_CMSG_EXPORT_KEY_TRANS pointer that invokes the given AHK function when called.
         * @param {Func(CMSG_CONTENT_ENCRYPT_INFO, CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO, CMSG_KEY_TRANS_ENCRYPT_INFO, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CMSG_CONTENT_ENCRYPT_INFO.Ptr, CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO.Ptr, CMSG_KEY_TRANS_ENCRYPT_INFO.Ptr, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
