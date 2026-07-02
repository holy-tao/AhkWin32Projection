#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WER_RUNTIME_EXCEPTION_INFORMATION.ahk" { WER_RUNTIME_EXCEPTION_INFORMATION }

/**
 * WER can call this function multiple times to get the report parameters that uniquely describe the problem.
 * @remarks
 * You must implement this function in your exception handler DLL.
 * 
 * To generate error reports for application-specific issues, the application must create a short description of the problem using a few basic pieces of information called report parameters. Report parameters include information such as the application name, application version, module name, module version, and error code. The combination of these report parameters describes a unique problem.
 * 
 * WER calls this callback function only if you set the <i>pbOwnershipClaimed</i> parameter of your <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nc-werapi-pfn_wer_runtime_exception_event">OutOfProcessExceptionEventCallback</a> callback function to <b>TRUE</b>. The <i>pdwSignatureCount</i> parameter of <b>OutOfProcessExceptionEventCallback</b> determines the number of times that  WER will call  this callback function.
 * @see https://learn.microsoft.com/windows/win32/api/werapi/nc-werapi-pfn_wer_runtime_exception_event_signature
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct PFN_WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE) {
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
     * @param {Integer} dwIndex The index of the report parameter. Valid values are 0 to 9. The first call to this function must set the index to 0, and each successive call must increment the index value sequentially.
     * @param {PWSTR} pwszName A caller-allocated buffer that you use to specify the parameter name.
     * @param {Pointer<Integer>} pchName The size, in characters, of the <i>pwszName</i> buffer. The size includes the null-terminating character.
     * @param {PWSTR} pwszValue A caller-allocated buffer that you use to specify the parameter value.
     * @param {Pointer<Integer>} pchValue The size, in characters, of the <i>pwszValue</i> buffer. The size includes the null-terminating character.
     * @returns {HRESULT} Return <b>S_OK</b> on success. If you return other failure codes, WER reverts to its default crash reporting behavior.
     */
    Call(pContext, pExceptionInformation, dwIndex, pwszName, pchName, pwszValue, pchValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"
        pchValueMarshal := pchValue is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, pContextMarshal, pContext, WER_RUNTIME_EXCEPTION_INFORMATION.Ptr, pExceptionInformation, UInt32, dwIndex, "ptr", pwszName, pchNameMarshal, pchName, "ptr", pwszValue, pchValueMarshal, pchValue, "HRESULT")
        return result
    }

    /**
     * A PFN_WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE {
        /**
         * Creates a PFN_WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WER_RUNTIME_EXCEPTION_INFORMATION, UInt32, PWSTR, "uint*", PWSTR, "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WER_RUNTIME_EXCEPTION_INFORMATION.Ptr, UInt32, PWSTR, "uint*", PWSTR, "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
