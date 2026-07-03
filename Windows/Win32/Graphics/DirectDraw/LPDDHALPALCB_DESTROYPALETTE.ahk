#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_DESTROYPALETTEDATA.ahk" { DDHAL_DESTROYPALETTEDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALPALCB_DESTROYPALETTE {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALPALCB_DESTROYPALETTE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_DESTROYPALETTEDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_DESTROYPALETTEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALPALCB_DESTROYPALETTE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALPALCB_DESTROYPALETTE {
        /**
         * Creates a LPDDHALPALCB_DESTROYPALETTE pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_DESTROYPALETTEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_DESTROYPALETTEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
