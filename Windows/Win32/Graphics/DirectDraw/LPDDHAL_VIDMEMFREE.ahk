#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHAL_VIDMEMFREE {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHAL_VIDMEMFREE) {
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
     * @param {Pointer} fpMem 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpDD, heap, fpMem) {
        DllCall(this.value, DDRAWI_DIRECTDRAW_GBL.Ptr, lpDD, Int32, heap, IntPtr, fpMem)
    }

    /**
     * A LPDDHAL_VIDMEMFREE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHAL_VIDMEMFREE {
        /**
         * Creates a LPDDHAL_VIDMEMFREE pointer that invokes the given AHK function when called.
         * @param {Func(DDRAWI_DIRECTDRAW_GBL, Int32, IntPtr) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDRAWI_DIRECTDRAW_GBL.Ptr, Int32, IntPtr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
