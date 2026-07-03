#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvDisableDirectDraw {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvDisableDirectDraw) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DHPDEV} param0 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0) {
        DllCall(this.value, DHPDEV, param0)
    }

    /**
     * A PFN_DrvDisableDirectDraw that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvDisableDirectDraw {
        /**
         * Creates a PFN_DrvDisableDirectDraw pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
