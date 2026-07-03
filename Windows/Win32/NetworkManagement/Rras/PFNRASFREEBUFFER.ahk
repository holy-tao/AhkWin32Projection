#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The custom-scripting DLL calls RasFreeBuffer to release a memory buffer that was allocated by a previous call to RasGetBuffer.
 * @remarks
 * The custom-scripting DLL calls 
 * <i>RasFreeBuffer</i> through a function pointer. The function pointer is passed to the custom-scripting DLL as a parameter when RAS calls the DLL's implementation of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-pfnrasfreebuffer
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PFNRASFREEBUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PFNRASFREEBUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} pBufer 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUFFER_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer to the buffer passed in the <i>pBuffer</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PORT_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle specified by the <i>hPort</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(pBufer) {
        pBuferMarshal := pBufer is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, pBuferMarshal, pBufer, UInt32)
        return result
    }

    /**
     * A PFNRASFREEBUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNRASFREEBUFFER {
        /**
         * Creates a PFNRASFREEBUFFER pointer that invokes the given AHK function when called.
         * @param {Func("char*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
