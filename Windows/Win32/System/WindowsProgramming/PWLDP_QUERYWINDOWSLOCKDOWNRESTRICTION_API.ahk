#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLDP_WINDOWS_LOCKDOWN_RESTRICTION.ahk" { WLDP_WINDOWS_LOCKDOWN_RESTRICTION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {WLDP_WINDOWS_LOCKDOWN_RESTRICTION} 
     */
    Call() {
        result := DllCall(this.value, "int*", &LockdownRestriction := 0, "HRESULT")
        return LockdownRestriction
    }

    /**
     * A PWLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_API {
        /**
         * Creates a PWLDP_QUERYWINDOWSLOCKDOWNRESTRICTION_API pointer that invokes the given AHK function when called.
         * @param {Func() => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
