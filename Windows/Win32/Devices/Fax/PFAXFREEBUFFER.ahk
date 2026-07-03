#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FaxFreeBuffer function releases resources associated with a buffer allocated previously as the result of a function call by a fax client application.
 * @remarks
 * When the resources allocated for a buffer are no longer needed, the calling application must free the resources. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-freeing-fax-resources">Freeing Fax Resources</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winfax/nc-winfax-pfaxfreebuffer
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXFREEBUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PFAXFREEBUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Buffer Type: <b>LPVOID</b>
     * 
     * Pointer to a buffer allocated on a previous call to one of the functions named in the following See Also section.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Buffer) {
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _BufferMarshal, _Buffer)
    }

    /**
     * A PFAXFREEBUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXFREEBUFFER {
        /**
         * Creates a PFAXFREEBUFFER pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
