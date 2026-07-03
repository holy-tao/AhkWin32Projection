#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvSetPixelFormat {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvSetPixelFormat) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SURFOBJ>} param0 
     * @param {Integer} param1 
     * @param {HWND} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, Int32, param1, HWND, param2, BOOL)
        return result
    }

    /**
     * A PFN_DrvSetPixelFormat that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvSetPixelFormat {
        /**
         * Creates a PFN_DrvSetPixelFormat pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, Int32, HWND) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, Int32, HWND, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
