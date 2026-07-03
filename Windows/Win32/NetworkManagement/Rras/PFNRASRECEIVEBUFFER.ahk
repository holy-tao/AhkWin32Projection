#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The custom-scripting DLL calls the RasReceiveBuffer function to inform RAS that it is ready to receive data from the server over the specified port.
 * @remarks
 * <i>RasReceiveBuffer</i> is an asynchronous function. 
 * <i>RasReceiveBuffer</i> returns immediately even if the data is not yet available. The custom-scripting DLL must wait on the event object specified by the <i>hEvent</i> parameter. When the data is available, RAS signals this event. The custom-scripting DLL should then call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasretrievebuffer">RasRetrieveBuffer</a> function to obtain the data. The custom-scripting DLL may pass the same buffer pointer in 
 * <b>RasRetrieveBuffer</b> that it passed in <b>RasReceiveBuffer</b>.
 * 
 * RAS also signals the event object if, for some reason, the port is disconnected before the data is posted. In this case, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasretrievebuffer">RasRetrieveBuffer</a> returns an error defined in Raserror.h, that indicates the cause of the failure.
 * 
 * The custom-scripting DLL calls 
 * <i>RasReceiveBuffer</i> through a function pointer. The function pointer is passed to the custom-scripting DLL as a parameter when RAS calls the DLL's implementation of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-pfnrasreceivebuffer
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PFNRASRECEIVEBUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PFNRASRECEIVEBUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hPort Handle to the port on which to receive the data. This handle should be the handle passed in by RAS as the first parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a> function.
     * @param {Pointer<Integer>} pBuffer Pointer to a buffer to receive the data from the port specified by the <i>hPort</i> parameter. Obtain this buffer using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasgetbuffer">RasGetBuffer</a> function.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> variable that receives the size of the data returned in the buffer pointed to by the <i>pBuffer</i> parameter.
     * @param {Integer} dwTimeOut 
     * @param {HANDLE} hEvent Handle to an event object that RAS will signal when the received data is available.
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
    Call(hPort, pBuffer, pdwSize, dwTimeOut, hEvent) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, hPort, pBufferMarshal, pBuffer, pdwSizeMarshal, pdwSize, UInt32, dwTimeOut, HANDLE, hEvent, UInt32)
        return result
    }

    /**
     * A PFNRASRECEIVEBUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNRASRECEIVEBUFFER {
        /**
         * Creates a PFNRASRECEIVEBUFFER pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "char*", "uint*", UInt32, HANDLE) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "char*", "uint*", UInt32, HANDLE, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
