#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_GETVPORTOUTPUTFORMATDATA.ahk" { DDHAL_GETVPORTOUTPUTFORMATDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALVPORTCB_GETOUTPUTFORMATS {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALVPORTCB_GETOUTPUTFORMATS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_GETVPORTOUTPUTFORMATDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_GETVPORTOUTPUTFORMATDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALVPORTCB_GETOUTPUTFORMATS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALVPORTCB_GETOUTPUTFORMATS {
        /**
         * Creates a LPDDHALVPORTCB_GETOUTPUTFORMATS pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_GETVPORTOUTPUTFORMATDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_GETVPORTOUTPUTFORMATDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
