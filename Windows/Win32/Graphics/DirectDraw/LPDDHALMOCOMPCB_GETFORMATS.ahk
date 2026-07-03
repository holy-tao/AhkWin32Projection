#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_GETMOCOMPFORMATSDATA.ahk" { DDHAL_GETMOCOMPFORMATSDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALMOCOMPCB_GETFORMATS {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALMOCOMPCB_GETFORMATS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_GETMOCOMPFORMATSDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_GETMOCOMPFORMATSDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALMOCOMPCB_GETFORMATS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALMOCOMPCB_GETFORMATS {
        /**
         * Creates a LPDDHALMOCOMPCB_GETFORMATS pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_GETMOCOMPFORMATSDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_GETMOCOMPFORMATSDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
