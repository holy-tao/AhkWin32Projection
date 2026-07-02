#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_GETVPORTBANDWIDTHDATA.ahk" { DDHAL_GETVPORTBANDWIDTHDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALVPORTCB_GETBANDWIDTH {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALVPORTCB_GETBANDWIDTH) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_GETVPORTBANDWIDTHDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_GETVPORTBANDWIDTHDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALVPORTCB_GETBANDWIDTH that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALVPORTCB_GETBANDWIDTH {
        /**
         * Creates a LPDDHALVPORTCB_GETBANDWIDTH pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_GETVPORTBANDWIDTHDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_GETVPORTBANDWIDTHDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
