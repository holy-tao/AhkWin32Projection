#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CMSG_CONTENT_ENCRYPT_INFO.ahk" { CMSG_CONTENT_ENCRYPT_INFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Generates the symmetric key used to encrypt content for an enveloped message.
 * @remarks
 * You can use <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptography-functions">OID Support Functions</a> to deploy this callback function. Wincrypt.h defines the following constants for this purpose.
 * 
 * You must define different callback functions for CAPI1 keys and Cryptography API: Next Generation (CNG) keys. Both functions have the same signature but use different <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifiers</a> (OIDs). Which function is called depends on the value of the  <b>fCNG</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure pointed to by the  <i>pContentEncryptInfo</i> parameter. The following table shows the relationship between the callback function and the value of the <b>fCNG</b> member.
 * 
 * <table>
 * <tr>
 * <th>fCNG value</th>
 * <th>Constant</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td><b>FALSE</b></td>
 * <td>CMSG_OID_GEN_CONTENT_ENCRYPT_KEY_FUNC or CMSG_OID_CAPI1_GEN_CONTENT_ENCRYPT_KEY_FUNC </td>
 * <td>"CryptMsgDllGenContentEncryptKey"</td>
 * </tr>
 * <tr>
 * <td><b>TRUE</b></td>
 * <td>CMSG_OID_CNG_GEN_CONTENT_ENCRYPT_KEY_FUNC</td>
 * <td>"CryptMsgDllCNGGenContentEncryptKey"</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/nc-wincrypt-pfn_cmsg_gen_content_encrypt_key
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CMSG_GEN_CONTENT_ENCRYPT_KEY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CMSG_GEN_CONTENT_ENCRYPT_KEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CMSG_CONTENT_ENCRYPT_INFO>} pContentEncryptInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_content_encrypt_info">CMSG_CONTENT_ENCRYPT_INFO</a> structure that contains the key.
     * @param {Integer} dwFlags This value is not used. Set it to zero.
     * @returns {BOOL} If the function succeeds, the return value is nonzero (<b>TRUE</b>).
     * 
     * If the function fails, the return value is zero (<b>FALSE</b>). For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     */
    Call(pContentEncryptInfo, dwFlags) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, CMSG_CONTENT_ENCRYPT_INFO.Ptr, pContentEncryptInfo, UInt32, dwFlags, "ptr", pvReserved, BOOL)
        return result
    }

    /**
     * A PFN_CMSG_GEN_CONTENT_ENCRYPT_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CMSG_GEN_CONTENT_ENCRYPT_KEY {
        /**
         * Creates a PFN_CMSG_GEN_CONTENT_ENCRYPT_KEY pointer that invokes the given AHK function when called.
         * @param {Func(CMSG_CONTENT_ENCRYPT_INFO, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CMSG_CONTENT_ENCRYPT_INFO.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
