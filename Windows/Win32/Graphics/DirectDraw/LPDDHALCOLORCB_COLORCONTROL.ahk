#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_COLORCONTROLDATA.ahk" { DDHAL_COLORCONTROLDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALCOLORCB_COLORCONTROL {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALCOLORCB_COLORCONTROL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_COLORCONTROLDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_COLORCONTROLDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALCOLORCB_COLORCONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALCOLORCB_COLORCONTROL {
        /**
         * Creates a LPDDHALCOLORCB_COLORCONTROL pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_COLORCONTROLDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_COLORCONTROLDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
