#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_ADDATTACHEDSURFACEDATA.ahk" { DDHAL_ADDATTACHEDSURFACEDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALSURFCB_ADDATTACHEDSURFACE {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALSURFCB_ADDATTACHEDSURFACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_ADDATTACHEDSURFACEDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_ADDATTACHEDSURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALSURFCB_ADDATTACHEDSURFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALSURFCB_ADDATTACHEDSURFACE {
        /**
         * Creates a LPDDHALSURFCB_ADDATTACHEDSURFACE pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_ADDATTACHEDSURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_ADDATTACHEDSURFACEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
