#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PKMESSAGE_SERVICE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PKMESSAGE_SERVICE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {BOOLEAN} 
     */
    Call() {
        result := DllCall(this.value, BOOLEAN)
        return result
    }

    /**
     * A PKMESSAGE_SERVICE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PKMESSAGE_SERVICE_ROUTINE {
        /**
         * Creates a PKMESSAGE_SERVICE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func() => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
