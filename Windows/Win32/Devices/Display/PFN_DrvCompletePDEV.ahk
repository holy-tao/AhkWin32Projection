#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import ".\HDEV.ahk" { HDEV }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvCompletePDEV {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvCompletePDEV) {
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
     * @param {HDEV} param1 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1) {
        DllCall(this.value, DHPDEV, param0, HDEV, param1)
    }

    /**
     * A PFN_DrvCompletePDEV that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvCompletePDEV {
        /**
         * Creates a PFN_DrvCompletePDEV pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, HDEV) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, HDEV, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
