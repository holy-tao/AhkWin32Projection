#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct D3COLD_REQUEST_CORE_POWER_RAIL {
    value : IntPtr

    __value {
        set {
            if (value is D3COLD_REQUEST_CORE_POWER_RAIL) {
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
     * @param {BOOLEAN} CorePowerRailNeeded 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_Context, CorePowerRailNeeded) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, _ContextMarshal, _Context, BOOLEAN, CorePowerRailNeeded)
    }

    /**
     * A D3COLD_REQUEST_CORE_POWER_RAIL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends D3COLD_REQUEST_CORE_POWER_RAIL {
        /**
         * Creates a D3COLD_REQUEST_CORE_POWER_RAIL pointer that invokes the given AHK function when called.
         * @param {Func("ptr", BOOLEAN) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOLEAN, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
