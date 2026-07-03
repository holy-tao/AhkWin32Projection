#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDD32BITDRIVERINIT {
    value : IntPtr

    __value {
        set {
            if (value is LPDD32BITDRIVERINIT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwContext 
     * @returns {Integer} 
     */
    Call(dwContext) {
        result := DllCall(this.value, UInt32, dwContext, UInt32)
        return result
    }

    /**
     * A LPDD32BITDRIVERINIT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDD32BITDRIVERINIT {
        /**
         * Creates a LPDD32BITDRIVERINIT pointer that invokes the given AHK function when called.
         * @param {Func(UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
