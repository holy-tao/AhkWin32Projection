#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_DESTROYVPORTDATA.ahk" { DDHAL_DESTROYVPORTDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALVPORTCB_DESTROYVPORT {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALVPORTCB_DESTROYVPORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_DESTROYVPORTDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_DESTROYVPORTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALVPORTCB_DESTROYVPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALVPORTCB_DESTROYVPORT {
        /**
         * Creates a LPDDHALVPORTCB_DESTROYVPORT pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_DESTROYVPORTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_DESTROYVPORTDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
