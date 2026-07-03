#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_GETBLTSTATUSDATA.ahk" { DDHAL_GETBLTSTATUSDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALSURFCB_GETBLTSTATUS {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALSURFCB_GETBLTSTATUS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_GETBLTSTATUSDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_GETBLTSTATUSDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALSURFCB_GETBLTSTATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALSURFCB_GETBLTSTATUS {
        /**
         * Creates a LPDDHALSURFCB_GETBLTSTATUS pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_GETBLTSTATUSDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_GETBLTSTATUSDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
