#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CMSG_MAIL_LIST_ENCRYPT_INFO.ahk" { CMSG_MAIL_LIST_ENCRYPT_INFO }
#Import ".\CMSG_CONTENT_ENCRYPT_INFO.ahk" { CMSG_CONTENT_ENCRYPT_INFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO.ahk" { CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO }

/**
 * Encrypts and exports the content encryption key for a mailing list recipient of an enveloped message.
 * @remarks
 * The <b>PFN_CMSG_EXPORT_MAIL_LIST</b> function must update the  <b>EncryptedKey</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_mail_list_encrypt_info">CMSG_MAIL_LIST_ENCRYPT_INFO</a> structure pointed to by the <i>pMailListEncryptInfo</i> parameter. This function must use the <b>pfnAlloc</b> and <b>pfnFree</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure pointed to by the <i>pContentEncryptInfo</i> parameter to manage memory for any values that it updates.
 * 
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constants for this purpose.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>CMSG_OID_EXPORT_MAIL_LIST_FUNC or CMSG_OID_CAPI1_EXPORT_MAIL_LIST_FUNC</td>
 * <td>"CryptMsgDllExportMailList"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cmsg_export_mail_list
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CMSG_EXPORT_MAIL_LIST {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CMSG_EXPORT_MAIL_LIST) {
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
     * @param {Pointer<CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO>} pMailListEncodeInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_mail_list_recipient_encode_info">CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO</a> structure that specifies the key used to encrypt the content encryption key.
     * @param {Pointer<CMSG_MAIL_LIST_ENCRYPT_INFO>} pMailListEncryptInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_mail_list_encrypt_info">CMSG_MAIL_LIST_ENCRYPT_INFO</a> structure that contains the encrypted content encryption key.
     * @param {Integer} dwFlags This value is not used. Set it to zero.
     * @returns {BOOL} If the function succeeds, the return value is nonzero (<b>TRUE</b>).
     * 
     * If the function fails, the return value is zero (<b>FALSE</b>). For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     */
    Call(pContentEncryptInfo, pMailListEncodeInfo, pMailListEncryptInfo, dwFlags) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, CMSG_CONTENT_ENCRYPT_INFO.Ptr, pContentEncryptInfo, CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO.Ptr, pMailListEncodeInfo, CMSG_MAIL_LIST_ENCRYPT_INFO.Ptr, pMailListEncryptInfo, UInt32, dwFlags, "ptr", pvReserved, BOOL)
        return result
    }

    /**
     * A PFN_CMSG_EXPORT_MAIL_LIST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CMSG_EXPORT_MAIL_LIST {
        /**
         * Creates a PFN_CMSG_EXPORT_MAIL_LIST pointer that invokes the given AHK function when called.
         * @param {Func(CMSG_CONTENT_ENCRYPT_INFO, CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO, CMSG_MAIL_LIST_ENCRYPT_INFO, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CMSG_CONTENT_ENCRYPT_INFO.Ptr, CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO.Ptr, CMSG_MAIL_LIST_ENCRYPT_INFO.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
