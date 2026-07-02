#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\Foundation\PESILO.ahk" { PESILO }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SILO_MONITOR_CREATE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is SILO_MONITOR_CREATE_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PESILO} Silo 
     * @returns {NTSTATUS} 
     */
    Call(Silo) {
        result := DllCall(this.value, PESILO, Silo, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SILO_MONITOR_CREATE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SILO_MONITOR_CREATE_CALLBACK {
        /**
         * Creates a SILO_MONITOR_CREATE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PESILO) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PESILO, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
