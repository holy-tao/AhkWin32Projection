#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct AVISAVECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is AVISAVECALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {BOOL} 
     */
    Call(param0) {
        result := DllCall(this.value, Int32, param0, BOOL)
        return result
    }

    /**
     * A AVISAVECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends AVISAVECALLBACK {
        /**
         * Creates a AVISAVECALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(Int32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
