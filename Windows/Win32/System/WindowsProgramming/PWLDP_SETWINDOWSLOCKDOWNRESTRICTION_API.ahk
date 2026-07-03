#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WLDP_WINDOWS_LOCKDOWN_RESTRICTION.ahk" { WLDP_WINDOWS_LOCKDOWN_RESTRICTION }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_SETWINDOWSLOCKDOWNRESTRICTION_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_SETWINDOWSLOCKDOWNRESTRICTION_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {WLDP_WINDOWS_LOCKDOWN_RESTRICTION} LockdownRestriction 
     * @returns {HRESULT} 
     */
    Call(LockdownRestriction) {
        result := DllCall(this.value, WLDP_WINDOWS_LOCKDOWN_RESTRICTION, LockdownRestriction, "HRESULT")
        return result
    }

    /**
     * A PWLDP_SETWINDOWSLOCKDOWNRESTRICTION_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_SETWINDOWSLOCKDOWNRESTRICTION_API {
        /**
         * Creates a PWLDP_SETWINDOWSLOCKDOWNRESTRICTION_API pointer that invokes the given AHK function when called.
         * @param {Func(WLDP_WINDOWS_LOCKDOWN_RESTRICTION) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WLDP_WINDOWS_LOCKDOWN_RESTRICTION, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
