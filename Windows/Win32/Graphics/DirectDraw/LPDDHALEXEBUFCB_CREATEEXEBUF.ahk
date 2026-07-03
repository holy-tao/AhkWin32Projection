#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_CREATESURFACEDATA.ahk" { DDHAL_CREATESURFACEDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALEXEBUFCB_CREATEEXEBUF {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALEXEBUFCB_CREATEEXEBUF) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_CREATESURFACEDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_CREATESURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALEXEBUFCB_CREATEEXEBUF that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALEXEBUFCB_CREATEEXEBUF {
        /**
         * Creates a LPDDHALEXEBUFCB_CREATEEXEBUF pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_CREATESURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_CREATESURFACEDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
