#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WebDAV client calls the application-defined DavFreeCredCallback callback function to free the credential information that was retrieved by the DavAuthCallback callback function.
 * @remarks
 * The <i>DavFreeCredCallback</i> callback function must be registered by calling the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nf-davclnt-davregisterauthcallback">DavRegisterAuthCallback</a> function.
 * 
 * This callback function should free only the buffer that the <b>pBuffer</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_unp">DAV_CALLBACK_AUTH_UNP</a> or <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_blob">DAV_CALLBACK_AUTH_BLOB</a> structure points to, not the entire structure.
 * @see https://learn.microsoft.com/windows/win32/api/davclnt/nc-davclnt-pfndavauthcallback_freecred
 * @namespace Windows.Win32.NetworkManagement.WebDav
 */
export default struct PFNDAVAUTHCALLBACK_FREECRED {
    value : IntPtr

    __value {
        set {
            if (value is PFNDAVAUTHCALLBACK_FREECRED) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pbuffer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_unp">DAV_CALLBACK_AUTH_UNP</a> or <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/ns-davclnt-dav_callback_auth_blob">DAV_CALLBACK_AUTH_BLOB</a>  structure that was used in the <a href="https://docs.microsoft.com/windows/desktop/api/davclnt/nc-davclnt-pfndavauthcallback">DavAuthCallback</a> callback function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     */
    Call(pbuffer) {
        pbufferMarshal := pbuffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pbufferMarshal, pbuffer, UInt32)
        return result
    }

    /**
     * A PFNDAVAUTHCALLBACK_FREECRED that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNDAVAUTHCALLBACK_FREECRED {
        /**
         * Creates a PFNDAVAUTHCALLBACK_FREECRED pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
