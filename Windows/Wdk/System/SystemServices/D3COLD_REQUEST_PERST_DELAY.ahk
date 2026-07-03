#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct D3COLD_REQUEST_PERST_DELAY {
    value : IntPtr

    __value {
        set {
            if (value is D3COLD_REQUEST_PERST_DELAY) {
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
     * @param {Integer} DelayInMicroSeconds 
     * @returns {NTSTATUS} 
     */
    Call(_Context, DelayInMicroSeconds) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, UInt32, DelayInMicroSeconds, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A D3COLD_REQUEST_PERST_DELAY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends D3COLD_REQUEST_PERST_DELAY {
        /**
         * Creates a D3COLD_REQUEST_PERST_DELAY pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
