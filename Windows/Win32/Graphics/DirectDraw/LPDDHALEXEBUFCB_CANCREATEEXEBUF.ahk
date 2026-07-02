#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_CANCREATESURFACEDATA.ahk" { DDHAL_CANCREATESURFACEDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHALEXEBUFCB_CANCREATEEXEBUF {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHALEXEBUFCB_CANCREATEEXEBUF) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_CANCREATESURFACEDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_CANCREATESURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHALEXEBUFCB_CANCREATEEXEBUF that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHALEXEBUFCB_CANCREATEEXEBUF {
        /**
         * Creates a LPDDHALEXEBUFCB_CANCREATEEXEBUF pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_CANCREATESURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_CANCREATESURFACEDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
