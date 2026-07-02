#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDD_DESTROYDRIVERDATA.ahk" { PDD_DESTROYDRIVERDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_DESTROYDRIVER {
    value : IntPtr

    __value {
        set {
            if (value is PDD_DESTROYDRIVER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PDD_DESTROYDRIVERDATA} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, PDD_DESTROYDRIVERDATA, param0, UInt32)
        return result
    }

    /**
     * A PDD_DESTROYDRIVER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_DESTROYDRIVER {
        /**
         * Creates a PDD_DESTROYDRIVER pointer that invokes the given AHK function when called.
         * @param {Func(PDD_DESTROYDRIVERDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PDD_DESTROYDRIVERDATA, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
