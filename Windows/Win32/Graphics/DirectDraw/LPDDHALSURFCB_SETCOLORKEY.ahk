#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_SETCOLORKEYDATA.ahk" { DDHAL_SETCOLORKEYDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALSURFCB_SETCOLORKEY {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALSURFCB_SETCOLORKEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_SETCOLORKEYDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_SETCOLORKEYDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALSURFCB_SETCOLORKEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALSURFCB_SETCOLORKEY {
        /**
         * Creates a LPDDHALSURFCB_SETCOLORKEY pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_SETCOLORKEYDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_SETCOLORKEYDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
