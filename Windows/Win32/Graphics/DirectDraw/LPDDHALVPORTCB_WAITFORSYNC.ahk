#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_WAITFORVPORTSYNCDATA.ahk" { DDHAL_WAITFORVPORTSYNCDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALVPORTCB_WAITFORSYNC {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALVPORTCB_WAITFORSYNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_WAITFORVPORTSYNCDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_WAITFORVPORTSYNCDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALVPORTCB_WAITFORSYNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALVPORTCB_WAITFORSYNC {
        /**
         * Creates a LPDDHALVPORTCB_WAITFORSYNC pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_WAITFORVPORTSYNCDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_WAITFORVPORTSYNCDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
