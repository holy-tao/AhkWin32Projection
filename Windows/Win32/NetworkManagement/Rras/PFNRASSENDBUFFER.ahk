#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The custom-scripting DLL calls the RasSendBuffer function to send data to the server over the specified port.
 * @remarks
 * The custom-scripting DLL calls 
 * <i>RasSendBuffer</i> through a function pointer. The function pointer is passed to the custom-scripting DLL as a parameter when RAS calls the DLL's implementation of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-pfnrassendbuffer
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PFNRASSENDBUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PFNRASSENDBUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hPort Handle to the port on which to send the data in the buffer. This handle should be the handle passed in by RAS as the first parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a> function.
     * @param {Pointer<Integer>} pBuffer Pointer to a buffer of data to send over the port specified by the <i>hPort</i> parameter. Obtain this buffer using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasgetbuffer">RasGetBuffer</a> function.
     * @param {Integer} dwSize Specifies the size of the data in the buffer pointed to by the <i>pBuffer</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value can be one of the following error codes.
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
    Call(hPort, pBuffer, dwSize) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, HANDLE, hPort, pBufferMarshal, pBuffer, UInt32, dwSize, UInt32)
        return result
    }

    /**
     * A PFNRASSENDBUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNRASSENDBUFFER {
        /**
         * Creates a PFNRASSENDBUFFER pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "char*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "char*", UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
