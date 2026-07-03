#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines a callback function that can receive debugging messages from the WDS client.
 * @see https://learn.microsoft.com/windows/win32/api/wdsclientapi/nc-wdsclientapi-pfn_wdsclitracefunction
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PFN_WdsCliTraceFunction {
    value : IntPtr

    __value {
        set {
            if (value is PFN_WdsCliTraceFunction) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pwszFormat A pointer to a null-terminated string value that contains a formatted string.
     * @param {Pointer<Integer>} Params A list of parameters used by the formatted string.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(pwszFormat, Params) {
        pwszFormat := pwszFormat is String ? StrPtr(pwszFormat) : pwszFormat

        ParamsMarshal := Params is VarRef ? "char*" : "ptr"

        DllCall(this.value, "ptr", pwszFormat, ParamsMarshal, Params)
    }

    /**
     * A PFN_WdsCliTraceFunction that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_WdsCliTraceFunction {
        /**
         * Creates a PFN_WdsCliTraceFunction pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "char*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "char*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
