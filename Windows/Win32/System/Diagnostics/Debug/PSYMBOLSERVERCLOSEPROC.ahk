#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PSYMBOLSERVERCLOSEPROC {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOLSERVERCLOSEPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {BOOL} 
     */
    Call() {
        result := DllCall(this.value, BOOL)
        return result
    }

    /**
     * A PSYMBOLSERVERCLOSEPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOLSERVERCLOSEPROC {
        /**
         * Creates a PSYMBOLSERVERCLOSEPROC pointer that invokes the given AHK function when called.
         * @param {Func() => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
