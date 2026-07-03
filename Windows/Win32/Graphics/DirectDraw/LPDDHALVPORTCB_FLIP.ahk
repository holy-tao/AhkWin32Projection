#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_FLIPVPORTDATA.ahk" { DDHAL_FLIPVPORTDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALVPORTCB_FLIP {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALVPORTCB_FLIP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_FLIPVPORTDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_FLIPVPORTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALVPORTCB_FLIP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALVPORTCB_FLIP {
        /**
         * Creates a LPDDHALVPORTCB_FLIP pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_FLIPVPORTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_FLIPVPORTDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
