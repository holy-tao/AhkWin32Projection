#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_UPDATEOVERLAYDATA.ahk" { DDHAL_UPDATEOVERLAYDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALSURFCB_UPDATEOVERLAY {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALSURFCB_UPDATEOVERLAY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_UPDATEOVERLAYDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_UPDATEOVERLAYDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALSURFCB_UPDATEOVERLAY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALSURFCB_UPDATEOVERLAY {
        /**
         * Creates a LPDDHALSURFCB_UPDATEOVERLAY pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_UPDATEOVERLAYDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_UPDATEOVERLAYDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
