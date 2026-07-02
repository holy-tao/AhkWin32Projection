#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_GETMOCOMPCOMPBUFFDATA.ahk" { DDHAL_GETMOCOMPCOMPBUFFDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALMOCOMPCB_GETCOMPBUFFINFO {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALMOCOMPCB_GETCOMPBUFFINFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_GETMOCOMPCOMPBUFFDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_GETMOCOMPCOMPBUFFDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALMOCOMPCB_GETCOMPBUFFINFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALMOCOMPCB_GETCOMPBUFFINFO {
        /**
         * Creates a LPDDHALMOCOMPCB_GETCOMPBUFFINFO pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_GETMOCOMPCOMPBUFFDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_GETMOCOMPCOMPBUFFDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
