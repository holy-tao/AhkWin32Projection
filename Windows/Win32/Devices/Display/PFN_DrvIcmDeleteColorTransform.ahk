#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvIcmDeleteColorTransform {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvIcmDeleteColorTransform) {
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
     * @param {HANDLE} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, DHPDEV, param0, HANDLE, param1, BOOL)
        return result
    }

    /**
     * A PFN_DrvIcmDeleteColorTransform that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvIcmDeleteColorTransform {
        /**
         * Creates a PFN_DrvIcmDeleteColorTransform pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, HANDLE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, HANDLE, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
