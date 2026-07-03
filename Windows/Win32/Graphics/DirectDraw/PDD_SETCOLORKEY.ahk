#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DRVSETCOLORKEYDATA.ahk" { DD_DRVSETCOLORKEYDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SETCOLORKEY {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SETCOLORKEY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_DRVSETCOLORKEYDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DD_DRVSETCOLORKEYDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SETCOLORKEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SETCOLORKEY {
        /**
         * Creates a PDD_SETCOLORKEY pointer that invokes the given AHK function when called.
         * @param {Func(DD_DRVSETCOLORKEYDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_DRVSETCOLORKEYDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
