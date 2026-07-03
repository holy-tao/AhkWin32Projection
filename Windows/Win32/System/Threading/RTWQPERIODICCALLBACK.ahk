#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct RTWQPERIODICCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is RTWQPERIODICCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IUnknown} _context 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(_context) {
        DllCall(this.value, "ptr", _context)
    }

    /**
     * A RTWQPERIODICCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTWQPERIODICCALLBACK {
        /**
         * Creates a RTWQPERIODICCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
