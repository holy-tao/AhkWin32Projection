#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DDRAWI_DIRECTDRAW_GBL.ahk" { DDRAWI_DIRECTDRAW_GBL }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHEL_INIT {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHEL_INIT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDRAWI_DIRECTDRAW_GBL>} param0 
     * @param {BOOL} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, DDRAWI_DIRECTDRAW_GBL.Ptr, param0, BOOL, param1, BOOL)
        return result
    }

    /**
     * A LPDDHEL_INIT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHEL_INIT {
        /**
         * Creates a LPDDHEL_INIT pointer that invokes the given AHK function when called.
         * @param {Func(DDRAWI_DIRECTDRAW_GBL, BOOL) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDRAWI_DIRECTDRAW_GBL.Ptr, BOOL, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
