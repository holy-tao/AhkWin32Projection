#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PTM_DEVICE_QUERY_GRANULARITY {
    value : IntPtr

    __value {
        set {
            if (value is PTM_DEVICE_QUERY_GRANULARITY) {
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
     * @param {Pointer<Integer>} Granularity 
     * @returns {NTSTATUS} 
     */
    Call(_Context, Granularity) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        GranularityMarshal := Granularity is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, GranularityMarshal, Granularity, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PTM_DEVICE_QUERY_GRANULARITY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTM_DEVICE_QUERY_GRANULARITY {
        /**
         * Creates a PTM_DEVICE_QUERY_GRANULARITY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "char*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "char*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
