#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_GETHEAPALIGNMENTDATA.ahk" { DDHAL_GETHEAPALIGNMENTDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHAL_GETHEAPALIGNMENT {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHAL_GETHEAPALIGNMENT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_GETHEAPALIGNMENTDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_GETHEAPALIGNMENTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHAL_GETHEAPALIGNMENT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHAL_GETHEAPALIGNMENT {
        /**
         * Creates a LPDDHAL_GETHEAPALIGNMENT pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_GETHEAPALIGNMENTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_GETHEAPALIGNMENTDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
