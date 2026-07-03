#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SETCLIPLISTDATA.ahk" { DD_SETCLIPLISTDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_SETCLIPLIST {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_SETCLIPLIST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_SETCLIPLISTDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DD_SETCLIPLISTDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_SETCLIPLIST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_SETCLIPLIST {
        /**
         * Creates a PDD_SURFCB_SETCLIPLIST pointer that invokes the given AHK function when called.
         * @param {Func(DD_SETCLIPLISTDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_SETCLIPLISTDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
