#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The custom-scripting DLL calls RasGetBuffer to allocate memory for sending or receiving data over the port connected to the server.
 * @remarks
 * The maximum buffer size that can be obtained is 1500 bytes.
 * 
 * The custom-scripting DLL calls 
 * <i>RasGetBuffer</i> through a function pointer. The function pointer is passed to the custom-scripting DLL as a parameter when RAS calls the DLL's implementation of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-pfnrasgetbuffer
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PFNRASGETBUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PFNRASGETBUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppBuffer Pointer to a pointer that receives the address of the returned buffer.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> variable that, on input, contains the requested size of the buffer. On output, this variable contains the actual size of the buffer allocated.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is the following error code.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUT_OF_BUFFERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RAS cannot allocate anymore buffer space.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(ppBuffer, pdwSize) {
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, ppBufferMarshal, ppBuffer, pdwSizeMarshal, pdwSize, UInt32)
        return result
    }

    /**
     * A PFNRASGETBUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNRASGETBUFFER {
        /**
         * Creates a PFNRASGETBUFFER pointer that invokes the given AHK function when called.
         * @param {Func("ptr*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
