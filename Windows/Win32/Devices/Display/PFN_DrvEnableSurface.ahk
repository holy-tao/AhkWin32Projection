#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import ".\HSURF.ahk" { HSURF }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvEnableSurface {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvEnableSurface) {
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
     * @returns {HSURF} 
     */
    Call(param0) {
        result := DllCall(this.value, DHPDEV, param0, HSURF)
        return result
    }

    /**
     * A PFN_DrvEnableSurface that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvEnableSurface {
        /**
         * Creates a PFN_DrvEnableSurface pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV) => HSURF} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, HSURF])
        }

        __Delete() => CallbackFree(this.value)
    }
}
