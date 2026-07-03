#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_FLIPTOGDISURFACEDATA.ahk" { DDHAL_FLIPTOGDISURFACEDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHAL_FLIPTOGDISURFACE {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHAL_FLIPTOGDISURFACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_FLIPTOGDISURFACEDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_FLIPTOGDISURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHAL_FLIPTOGDISURFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHAL_FLIPTOGDISURFACE {
        /**
         * Creates a LPDDHAL_FLIPTOGDISURFACE pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_FLIPTOGDISURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_FLIPTOGDISURFACEDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
