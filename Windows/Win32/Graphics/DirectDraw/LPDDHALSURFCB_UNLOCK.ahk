#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_UNLOCKDATA.ahk" { DDHAL_UNLOCKDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALSURFCB_UNLOCK {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALSURFCB_UNLOCK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_UNLOCKDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_UNLOCKDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALSURFCB_UNLOCK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALSURFCB_UNLOCK {
        /**
         * Creates a LPDDHALSURFCB_UNLOCK pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_UNLOCKDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_UNLOCKDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
