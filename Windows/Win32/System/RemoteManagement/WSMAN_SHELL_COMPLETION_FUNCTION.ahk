#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_COMMAND_HANDLE.ahk" { WSMAN_COMMAND_HANDLE }
#Import ".\WSMAN_ERROR.ahk" { WSMAN_ERROR }
#Import ".\WSMAN_OPERATION_HANDLE.ahk" { WSMAN_OPERATION_HANDLE }
#Import ".\WSMAN_RESPONSE_DATA.ahk" { WSMAN_RESPONSE_DATA }
#Import ".\WSMAN_SHELL_HANDLE.ahk" { WSMAN_SHELL_HANDLE }

/**
 * The callback function that is called for shell operations, which result in a remote request.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/nc-wsman-wsman_shell_completion_function
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_SHELL_COMPLETION_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is WSMAN_SHELL_COMPLETION_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} operationContext Represents user-defined context passed to the WinRM (WinRM) Client Shell 
     *       application programming interface (API) .
     * @param {Integer} flags Specifies one or more flags from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ne-wsman-wsmancallbackflags">WSManCallbackFlags</a> enumeration.
     * @param {Pointer<WSMAN_ERROR>} _error Defines the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_error">WSMAN_ERROR</a> structure, which is 
     *       valid in the callback only.
     * @param {WSMAN_SHELL_HANDLE} _shell Specifies the shell handle  associated with the user context.  The shell handle  must be closed by calling 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseshell">WSManCloseShell</a> method.
     * @param {WSMAN_COMMAND_HANDLE} command Specifies the command handle associated with the user context. The command handle must be closed by calling 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanclosecommand">WSManCloseCommand</a> API method.
     * @param {WSMAN_OPERATION_HANDLE} operationHandle Defines the operation handle associated with the user context. The operation handle is valid only for 
     *       callbacks that are associated with 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanreceiveshelloutput">WSManReceiveShellOutput</a>, 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmansendshellinput">WSManSendShellInput</a>, and 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmansignalshell">WSManSignalShell</a> calls. This handle must be closed 
     *       by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancloseoperation">WSManCloseOperation</a> 
     *       method.
     * @param {Pointer<WSMAN_RESPONSE_DATA>} data Defines the output data from the command or shell as a result of a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanreceiveshelloutput">WSManReceiveShellOutput</a> call. For more 
     *       information about the output data, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_receive_data_result">WSMAN_RECEIVE_DATA_RESULT</a> structure.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(operationContext, flags, _error, _shell, command, operationHandle, data) {
        operationContextMarshal := operationContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, operationContextMarshal, operationContext, UInt32, flags, WSMAN_ERROR.Ptr, _error, WSMAN_SHELL_HANDLE, _shell, WSMAN_COMMAND_HANDLE, command, WSMAN_OPERATION_HANDLE, operationHandle, WSMAN_RESPONSE_DATA.Ptr, data)
    }

    /**
     * A WSMAN_SHELL_COMPLETION_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WSMAN_SHELL_COMPLETION_FUNCTION {
        /**
         * Creates a WSMAN_SHELL_COMPLETION_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, WSMAN_ERROR, WSMAN_SHELL_HANDLE, WSMAN_COMMAND_HANDLE, WSMAN_OPERATION_HANDLE, WSMAN_RESPONSE_DATA) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, WSMAN_ERROR.Ptr, WSMAN_SHELL_HANDLE, WSMAN_COMMAND_HANDLE, WSMAN_OPERATION_HANDLE, WSMAN_RESPONSE_DATA.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
