#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WER_RUNTIME_EXCEPTION_INFORMATION.ahk" { WER_RUNTIME_EXCEPTION_INFORMATION }

/**
 * WER calls this function to let you customize the debugger launch options and launch string.
 * @remarks
 * You must implement this function in your exception handler DLL.
 * 
 * WER uses this function to determine which debugger to launch and  whether to launch the debugger automatically or ask the user before launching the debugger. Specifying a custom debugger will override the default launch string (the AeDebug registry key contains the default launch string).
 * 
 * WER calls this callback function only if you set the <i>pbOwnershipClaimed</i> parameter of your <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nc-werapi-pfn_wer_runtime_exception_event">OutOfProcessExceptionEventCallback</a> callback function to <b>TRUE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/werapi/nc-werapi-pfn_wer_runtime_exception_debugger_launch
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct PFN_WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pContext A pointer to arbitrary context information that you specified when you called the <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nf-werapi-werregisterruntimeexceptionmodule">WerRegisterRuntimeExceptionModule</a> function to register the exception handler.
     * @param {Pointer<WER_RUNTIME_EXCEPTION_INFORMATION>} pExceptionInformation A <a href="https://docs.microsoft.com/windows/desktop/api/werapi/ns-werapi-wer_runtime_exception_information">WER_RUNTIME_EXCEPTION_INFORMATION</a> structure that contains the exception information.
     * @param {Pointer<BOOL>} pbIsCustomDebugger Set to <b>TRUE</b> if the custom debugger specified in the <i>pwszDebuggerLaunch</i> parameter is used to debug the crash; otherwise, set to <b>FALSE</b> to use the default debugger. If you set this parameter to  <b>FALSE</b>, do not set the <i>pwszDebuggerLaunch</i> parameter.
     * @param {PWSTR} pwszDebuggerLaunch A caller-allocated buffer that you use to specify the debugger launch string used to launch the debugger. The launch string must include the full path to the debugger and any arguments. If an argument includes multiple words, use quotes to delimit the argument. The debugger string should adhere to the same protocol as the default AeDebug debugger string (see <a href="https://docs.microsoft.com/windows/desktop/Debug/configuring-automatic-debugging">Configuring Automatic Debugging</a>). The string must contain two formatting specifiers: %ld for the crashing process ID, and %ld for the handle to an event object to be signaled after the custom debugger has attached to the target (for a description of these specifiers, see <a href="https://msdn.microsoft.com/library/cc266343.aspx">Enabling Postmortem Debugging</a>). However, custom debuggers can choose to ignore these parameters.
     * @param {Pointer<Integer>} pchDebuggerLaunch The size, in characters, of the <i>pwszDebuggerLaunch</i> buffer.
     * @param {Pointer<BOOL>} pbIsDebuggerAutolaunch Set to <b>TRUE</b> if you want WER to silently launch the debugger; otherwise, <b>FALSE</b> if you want WER to ask the user before launching the debugger.
     * @returns {HRESULT} Return <b>S_OK</b>, even if no customer debugger is to be used. If you return other failure codes, WER reverts to its default crash reporting behavior.
     */
    Call(pContext, pExceptionInformation, pbIsCustomDebugger, pwszDebuggerLaunch, pchDebuggerLaunch, pbIsDebuggerAutolaunch) {
        pwszDebuggerLaunch := pwszDebuggerLaunch is String ? StrPtr(pwszDebuggerLaunch) : pwszDebuggerLaunch

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        pbIsCustomDebuggerMarshal := pbIsCustomDebugger is VarRef ? "int*" : "ptr"
        pchDebuggerLaunchMarshal := pchDebuggerLaunch is VarRef ? "uint*" : "ptr"
        pbIsDebuggerAutolaunchMarshal := pbIsDebuggerAutolaunch is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, pContextMarshal, pContext, WER_RUNTIME_EXCEPTION_INFORMATION.Ptr, pExceptionInformation, pbIsCustomDebuggerMarshal, pbIsCustomDebugger, "ptr", pwszDebuggerLaunch, pchDebuggerLaunchMarshal, pchDebuggerLaunch, pbIsDebuggerAutolaunchMarshal, pbIsDebuggerAutolaunch, "HRESULT")
        return result
    }

    /**
     * A PFN_WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH {
        /**
         * Creates a PFN_WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WER_RUNTIME_EXCEPTION_INFORMATION, BOOL, PWSTR, "uint*", BOOL) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WER_RUNTIME_EXCEPTION_INFORMATION.Ptr, BOOL.Ptr, PWSTR, "uint*", BOOL.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
