#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvRenderHint {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvRenderHint) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DHPDEV} _dhpdev 
     * @param {Integer} NotifyCode 
     * @param {Pointer} Length 
     * @param {Integer} Data 
     * @returns {Integer} 
     */
    Call(_dhpdev, NotifyCode, Length, Data) {
        result := DllCall(this.value, DHPDEV, _dhpdev, UInt32, NotifyCode, IntPtr, Length, IntPtr, Data, Int32)
        return result
    }

    /**
     * A PFN_DrvRenderHint that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvRenderHint {
        /**
         * Creates a PFN_DrvRenderHint pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, UInt32, IntPtr, IntPtr) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, UInt32, IntPtr, IntPtr, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
