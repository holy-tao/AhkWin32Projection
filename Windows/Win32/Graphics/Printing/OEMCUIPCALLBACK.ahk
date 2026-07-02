#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OEMCUIPPARAM.ahk" { OEMCUIPPARAM }
#Import ".\CPSUICBPARAM.ahk" { CPSUICBPARAM }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OEMCUIPCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is OEMCUIPCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CPSUICBPARAM>} param0 
     * @param {Pointer<OEMCUIPPARAM>} param1 
     * @returns {Integer} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, CPSUICBPARAM.Ptr, param0, OEMCUIPPARAM.Ptr, param1, Int32)
        return result
    }

    /**
     * A OEMCUIPCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends OEMCUIPCALLBACK {
        /**
         * Creates a OEMCUIPCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(CPSUICBPARAM, OEMCUIPPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CPSUICBPARAM.Ptr, OEMCUIPPARAM.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
