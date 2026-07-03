#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\Win32\System\Diagnostics\Debug\IPMI_OS_SEL_RECORD.ahk" { IPMI_OS_SEL_RECORD }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFN_WHEA_HIGH_IRQL_LOG_SEL_EVENT_HANDLER {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WHEA_HIGH_IRQL_LOG_SEL_EVENT_HANDLER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<IPMI_OS_SEL_RECORD>} OsSelRecord 
     * @returns {NTSTATUS} 
     */
    Call(_Context, OsSelRecord) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, IPMI_OS_SEL_RECORD.Ptr, OsSelRecord, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFN_WHEA_HIGH_IRQL_LOG_SEL_EVENT_HANDLER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WHEA_HIGH_IRQL_LOG_SEL_EVENT_HANDLER {
        /**
         * Creates a PFN_WHEA_HIGH_IRQL_LOG_SEL_EVENT_HANDLER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IPMI_OS_SEL_RECORD) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IPMI_OS_SEL_RECORD.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
