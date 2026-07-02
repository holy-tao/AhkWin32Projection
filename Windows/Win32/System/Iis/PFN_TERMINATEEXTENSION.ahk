#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct PFN_TERMINATEEXTENSION {
    value : IntPtr

    __value {
        set {
            if (value is PFN_TERMINATEEXTENSION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {BOOL} 
     */
    Call(dwFlags) {
        result := DllCall(this.value, UInt32, dwFlags, BOOL)
        return result
    }

    /**
     * A PFN_TERMINATEEXTENSION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_TERMINATEEXTENSION {
        /**
         * Creates a PFN_TERMINATEEXTENSION pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
