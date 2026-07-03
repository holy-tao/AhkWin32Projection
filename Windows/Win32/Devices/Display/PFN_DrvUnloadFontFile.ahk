#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvUnloadFontFile {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvUnloadFontFile) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 
     * @returns {BOOL} 
     */
    Call(param0) {
        result := DllCall(this.value, IntPtr, param0, BOOL)
        return result
    }

    /**
     * A PFN_DrvUnloadFontFile that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvUnloadFontFile {
        /**
         * Creates a PFN_DrvUnloadFontFile pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
