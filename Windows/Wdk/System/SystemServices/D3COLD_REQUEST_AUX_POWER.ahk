#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct D3COLD_REQUEST_AUX_POWER {
    value : IntPtr

    __value {
        set {
            if (value is D3COLD_REQUEST_AUX_POWER) {
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
     * @param {Integer} AuxPowerInMilliWatts 
     * @param {Pointer<Integer>} RetryInSeconds 
     * @returns {NTSTATUS} 
     */
    Call(_Context, AuxPowerInMilliWatts, RetryInSeconds) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        RetryInSecondsMarshal := RetryInSeconds is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, AuxPowerInMilliWatts, RetryInSecondsMarshal, RetryInSeconds, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A D3COLD_REQUEST_AUX_POWER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends D3COLD_REQUEST_AUX_POWER {
        /**
         * Creates a D3COLD_REQUEST_AUX_POWER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
