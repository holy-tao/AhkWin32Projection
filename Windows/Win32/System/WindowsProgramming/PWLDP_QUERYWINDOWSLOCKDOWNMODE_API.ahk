#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WLDP_WINDOWS_LOCKDOWN_MODE.ahk" { WLDP_WINDOWS_LOCKDOWN_MODE }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PWLDP_QUERYWINDOWSLOCKDOWNMODE_API {
    value : IntPtr

    __value {
        set {
            if (value is PWLDP_QUERYWINDOWSLOCKDOWNMODE_API) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {WLDP_WINDOWS_LOCKDOWN_MODE} 
     */
    Call() {
        result := DllCall(this.value, "int*", &lockdownMode := 0, "HRESULT")
        return lockdownMode
    }

    /**
     * A PWLDP_QUERYWINDOWSLOCKDOWNMODE_API that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWLDP_QUERYWINDOWSLOCKDOWNMODE_API {
        /**
         * Creates a PWLDP_QUERYWINDOWSLOCKDOWNMODE_API pointer that invokes the given AHK function when called.
         * @param {Func() => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
