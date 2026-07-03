#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_FLIPDATA.ahk" { DDHAL_FLIPDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALSURFCB_FLIP {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALSURFCB_FLIP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_FLIPDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_FLIPDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALSURFCB_FLIP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALSURFCB_FLIP {
        /**
         * Creates a LPDDHALSURFCB_FLIP pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_FLIPDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_FLIPDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
