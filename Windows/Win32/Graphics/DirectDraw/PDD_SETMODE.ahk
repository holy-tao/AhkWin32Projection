#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDD_SETMODEDATA.ahk" { PDD_SETMODEDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SETMODE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SETMODE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PDD_SETMODEDATA} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, PDD_SETMODEDATA, param0, UInt32)
        return result
    }

    /**
     * A PDD_SETMODE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SETMODE {
        /**
         * Creates a PDD_SETMODE pointer that invokes the given AHK function when called.
         * @param {Func(PDD_SETMODEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PDD_SETMODEDATA, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
