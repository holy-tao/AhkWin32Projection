#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_SYNCVIDEOPORTDATA.ahk" { DDHAL_SYNCVIDEOPORTDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALKERNELCB_SYNCVIDEOPORT {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALKERNELCB_SYNCVIDEOPORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_SYNCVIDEOPORTDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_SYNCVIDEOPORTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALKERNELCB_SYNCVIDEOPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALKERNELCB_SYNCVIDEOPORT {
        /**
         * Creates a LPDDHALKERNELCB_SYNCVIDEOPORT pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_SYNCVIDEOPORTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_SYNCVIDEOPORTDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
