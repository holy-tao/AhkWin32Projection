#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPNOTIFYCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is SPNOTIFYCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_wParam, _lParam) {
        DllCall(this.value, WPARAM, _wParam, LPARAM, _lParam)
    }

    /**
     * A SPNOTIFYCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SPNOTIFYCALLBACK {
        /**
         * Creates a SPNOTIFYCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(WPARAM, LPARAM) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WPARAM, LPARAM, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
