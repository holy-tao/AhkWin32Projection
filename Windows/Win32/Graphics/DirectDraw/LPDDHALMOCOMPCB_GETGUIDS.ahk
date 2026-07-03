#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_GETMOCOMPGUIDSDATA.ahk" { DDHAL_GETMOCOMPGUIDSDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALMOCOMPCB_GETGUIDS {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALMOCOMPCB_GETGUIDS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_GETMOCOMPGUIDSDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_GETMOCOMPGUIDSDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALMOCOMPCB_GETGUIDS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALMOCOMPCB_GETGUIDS {
        /**
         * Creates a LPDDHALMOCOMPCB_GETGUIDS pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_GETMOCOMPGUIDSDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_GETMOCOMPGUIDSDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
