#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvSynchronize {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvSynchronize) {
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
     * @param {Pointer<RECTL>} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1) {
        DllCall(this.value, DHPDEV, param0, RECTL.Ptr, param1)
    }

    /**
     * A PFN_DrvSynchronize that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvSynchronize {
        /**
         * Creates a PFN_DrvSynchronize pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, RECTL) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, RECTL.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
