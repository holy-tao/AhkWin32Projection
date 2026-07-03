#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Frees the memory for buffers allocated by the Security Configuration tool set when it calls PFSCE_QUERY_INFO.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/nc-scesvc-pfsce_free_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct PFSCE_FREE_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PFSCE_FREE_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvServiceInfo Specifies a pointer to the buffer allocated by the Security Configuration tool set.
     * @returns {Integer} If the function succeeds, it returns SCESTATUS_SUCCESS. Otherwise, an error code is returned. This can be the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCESTATUS_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters passed into the function was not valid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(pvServiceInfo) {
        pvServiceInfoMarshal := pvServiceInfo is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvServiceInfoMarshal, pvServiceInfo, UInt32)
        return result
    }

    /**
     * A PFSCE_FREE_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFSCE_FREE_INFO {
        /**
         * Creates a PFSCE_FREE_INFO pointer that invokes the given AHK function when called.
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
