#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FONTOBJ.ahk" { FONTOBJ }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvDestroyFont {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvDestroyFont) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FONTOBJ>} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0) {
        DllCall(this.value, FONTOBJ.Ptr, param0)
    }

    /**
     * A PFN_DrvDestroyFont that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvDestroyFont {
        /**
         * Creates a PFN_DrvDestroyFont pointer that invokes the given AHK function when called.
         * @param {Func(FONTOBJ) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FONTOBJ.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
