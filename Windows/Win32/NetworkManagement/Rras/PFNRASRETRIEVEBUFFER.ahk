#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The custom-scripting DLL calls the RasRetrieveBuffer function to obtain data received from the RAS server over the specified port.
 * @remarks
 * The 
 * <i>RasRetrieveBuffer</i> function is synchronous. When it returns, the buffer pointed to by the <i>pBuffer</i> parameter contains the data received over the specified port. The custom-scripting DLL should call 
 * <i>RasRetrieveBuffer</i> only after RAS has signaled the event object that the DLL passed in the call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasreceivebuffer">RasReceiveBuffer</a>.
 * 
 * The custom-scripting DLL calls 
 * <i>RasRetrieveBuffer</i> through a function pointer. The function pointer is passed to the custom-scripting DLL as a parameter when RAS calls the DLL's implementation of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-pfnrasretrievebuffer
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PFNRASRETRIEVEBUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PFNRASRETRIEVEBUFFER) {
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasgetbuffer">RasGetBuffer</a> function. The value of this parameter may be the same as the pointer to the buffer passed into the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-pfnrasreceivebuffer">RasReceiveBuffer</a> function.
     * @param {Pointer<Integer>} pdwSize Pointer to a <b>DWORD</b> variable that receives the size of the data returned in the buffer pointed to by the <i>pBuffer</i> parameter.
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
     *  
     * 
     * RAS signals the event object if the port gets disconnected for some reason before the data is posted. In this case, 
     * <i>RasRetrieveBuffer</i> returns an error defined in Raserror.h, that indicates the cause of the failure.
     */
    Call(hPort, pBuffer, pdwSize) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, hPort, pBufferMarshal, pBuffer, pdwSizeMarshal, pdwSize, UInt32)
        return result
    }

    /**
     * A PFNRASRETRIEVEBUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNRASRETRIEVEBUFFER {
        /**
         * Creates a PFNRASRETRIEVEBUFFER pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "char*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "char*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
