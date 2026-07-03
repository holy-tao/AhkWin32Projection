#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_SYNCSURFACEDATA.ahk" { DDHAL_SYNCSURFACEDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALKERNELCB_SYNCSURFACE {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALKERNELCB_SYNCSURFACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_SYNCSURFACEDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_SYNCSURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALKERNELCB_SYNCSURFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALKERNELCB_SYNCSURFACE {
        /**
         * Creates a LPDDHALKERNELCB_SYNCSURFACE pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_SYNCSURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_SYNCSURFACEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
