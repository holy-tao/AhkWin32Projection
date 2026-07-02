#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WER_RUNTIME_EXCEPTION_INFORMATION.ahk" { WER_RUNTIME_EXCEPTION_INFORMATION }

/**
 * WER calls this function to determine whether the exception handler is claiming the crash.
 * @remarks
 * You must implement this function in your exception handler DLL.
 * @see https://learn.microsoft.com/windows/win32/api/werapi/nc-werapi-pfn_wer_runtime_exception_event
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct PFN_WER_RUNTIME_EXCEPTION_EVENT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WER_RUNTIME_EXCEPTION_EVENT) {
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
     * @param {Pointer<WER_RUNTIME_EXCEPTION_INFORMATION>} pExceptionInformation A <a href="https://docs.microsoft.com/windows/desktop/api/werapi/ns-werapi-wer_runtime_exception_information">WER_RUNTIME_EXCEPTION_INFORMATION</a> structure that contains the exception information. Use the information to determine whether you want to claim the crash.
     * @param {Pointer<BOOL>} pbOwnershipClaimed Set to <b>TRUE</b> if the exception handler is claiming this crash; otherwise, <b>FALSE</b>. If you set this parameter to <b>FALSE</b>, do not set the rest of the out parameters.
     * @param {PWSTR} pwszEventName A caller-allocated buffer that you use to specify the event name used to identify this crash.
     * @param {Pointer<Integer>} pchSize The size, in characters, of the <i>pwszEventName</i> buffer. The buffer is limited to MAX_PATH characters. The size includes the null-terminating character.
     * @param {Pointer<Integer>} pdwSignatureCount The number of report parameters that you will provide. The valid range of values is one to 10. If you specify a value greater than 10, WER will ignore the value and collect only the first 10 parameters. If you specify zero, the reporting process will be indeterminate.
     * 
     * This value determines the number of times that WER calls your <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nc-werapi-pfn_wer_runtime_exception_event_signature">OutOfProcessExceptionEventSignatureCallback</a> function.
     * @returns {HRESULT} Return <b>S_OK</b>, even if the exception handler is not claiming this crash. If you return other failure codes, WER reverts to its default crash reporting behavior if no other handlers are registered.
     */
    Call(pContext, pExceptionInformation, pbOwnershipClaimed, pwszEventName, pchSize, pdwSignatureCount) {
        pwszEventName := pwszEventName is String ? StrPtr(pwszEventName) : pwszEventName

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        pbOwnershipClaimedMarshal := pbOwnershipClaimed is VarRef ? "int*" : "ptr"
        pchSizeMarshal := pchSize is VarRef ? "uint*" : "ptr"
        pdwSignatureCountMarshal := pdwSignatureCount is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, pContextMarshal, pContext, WER_RUNTIME_EXCEPTION_INFORMATION.Ptr, pExceptionInformation, pbOwnershipClaimedMarshal, pbOwnershipClaimed, "ptr", pwszEventName, pchSizeMarshal, pchSize, pdwSignatureCountMarshal, pdwSignatureCount, "HRESULT")
        return result
    }

    /**
     * A PFN_WER_RUNTIME_EXCEPTION_EVENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WER_RUNTIME_EXCEPTION_EVENT {
        /**
         * Creates a PFN_WER_RUNTIME_EXCEPTION_EVENT pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WER_RUNTIME_EXCEPTION_INFORMATION, BOOL, PWSTR, "uint*", "uint*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WER_RUNTIME_EXCEPTION_INFORMATION.Ptr, BOOL.Ptr, PWSTR, "uint*", "uint*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
