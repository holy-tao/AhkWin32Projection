#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHAL_VIDMEMALLOC {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHAL_VIDMEMALLOC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDRAWI_DIRECTDRAW_GBL>} lpDD 
     * @param {Integer} heap 
     * @param {Integer} dwWidth 
     * @param {Integer} dwHeight 
     * @returns {Pointer} 
     */
    Call(lpDD, heap, dwWidth, dwHeight) {
        result := DllCall(this.value, DDRAWI_DIRECTDRAW_GBL.Ptr, lpDD, Int32, heap, UInt32, dwWidth, UInt32, dwHeight, IntPtr)
        return result
    }

    /**
     * A LPDDHAL_VIDMEMALLOC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHAL_VIDMEMALLOC {
        /**
         * Creates a LPDDHAL_VIDMEMALLOC pointer that invokes the given AHK function when called.
         * @param {Func(DDRAWI_DIRECTDRAW_GBL, Int32, UInt32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDRAWI_DIRECTDRAW_GBL.Ptr, Int32, UInt32, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
