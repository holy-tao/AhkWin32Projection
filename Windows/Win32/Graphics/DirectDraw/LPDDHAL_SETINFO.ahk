#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DDHALINFO.ahk" { DDHALINFO }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHAL_SETINFO {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHAL_SETINFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHALINFO>} lpDDHalInfo 
     * @param {BOOL} reset 
     * @returns {BOOL} 
     */
    Call(lpDDHalInfo, reset) {
        result := DllCall(this.value, DDHALINFO.Ptr, lpDDHalInfo, BOOL, reset, BOOL)
        return result
    }

    /**
     * A LPDDHAL_SETINFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHAL_SETINFO {
        /**
         * Creates a LPDDHAL_SETINFO pointer that invokes the given AHK function when called.
         * @param {Func(DDHALINFO, BOOL) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHALINFO.Ptr, BOOL, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
