#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_SETEXCLUSIVEMODEDATA.ahk" { DDHAL_SETEXCLUSIVEMODEDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHAL_SETEXCLUSIVEMODE {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHAL_SETEXCLUSIVEMODE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_SETEXCLUSIVEMODEDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_SETEXCLUSIVEMODEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHAL_SETEXCLUSIVEMODE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHAL_SETEXCLUSIVEMODE {
        /**
         * Creates a LPDDHAL_SETEXCLUSIVEMODE pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_SETEXCLUSIVEMODEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_SETEXCLUSIVEMODEDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
