#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PTM_DEVICE_ENABLE {
    value : IntPtr

    __value {
        set {
            if (value is PTM_DEVICE_ENABLE) {
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
     * @returns {NTSTATUS} 
     */
    Call(_Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PTM_DEVICE_ENABLE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTM_DEVICE_ENABLE {
        /**
         * Creates a PTM_DEVICE_ENABLE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
