#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_WAKE_DEPTH.ahk" { DEVICE_WAKE_DEPTH }
#Import "..\..\..\Win32\System\Power\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct GET_IDLE_WAKE_INFO {
    value : IntPtr

    __value {
        set {
            if (value is GET_IDLE_WAKE_INFO) {
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
     * @param {SYSTEM_POWER_STATE} SystemPowerState 
     * @param {Pointer<DEVICE_WAKE_DEPTH>} DeepestWakeableDstate 
     * @returns {NTSTATUS} 
     */
    Call(_Context, SystemPowerState, DeepestWakeableDstate) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        DeepestWakeableDstateMarshal := DeepestWakeableDstate is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, SYSTEM_POWER_STATE, SystemPowerState, DeepestWakeableDstateMarshal, DeepestWakeableDstate, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A GET_IDLE_WAKE_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GET_IDLE_WAKE_INFO {
        /**
         * Creates a GET_IDLE_WAKE_INFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", SYSTEM_POWER_STATE, "int*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", SYSTEM_POWER_STATE, "int*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
