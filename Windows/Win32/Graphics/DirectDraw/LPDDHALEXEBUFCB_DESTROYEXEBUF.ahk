#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_DESTROYSURFACEDATA.ahk" { DDHAL_DESTROYSURFACEDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALEXEBUFCB_DESTROYEXEBUF {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALEXEBUFCB_DESTROYEXEBUF) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_DESTROYSURFACEDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_DESTROYSURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALEXEBUFCB_DESTROYEXEBUF that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALEXEBUFCB_DESTROYEXEBUF {
        /**
         * Creates a LPDDHALEXEBUFCB_DESTROYEXEBUF pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_DESTROYSURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_DESTROYSURFACEDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
