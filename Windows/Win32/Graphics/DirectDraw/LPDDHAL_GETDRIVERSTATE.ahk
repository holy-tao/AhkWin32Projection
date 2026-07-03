#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_GETDRIVERSTATEDATA.ahk" { DDHAL_GETDRIVERSTATEDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHAL_GETDRIVERSTATE {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHAL_GETDRIVERSTATE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_GETDRIVERSTATEDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_GETDRIVERSTATEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHAL_GETDRIVERSTATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHAL_GETDRIVERSTATE {
        /**
         * Creates a LPDDHAL_GETDRIVERSTATE pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_GETDRIVERSTATEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_GETDRIVERSTATEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
