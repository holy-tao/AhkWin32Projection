#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PERBANDINFO.ahk" { PERBANDINFO }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQueryPerBandInfo {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQueryPerBandInfo) {
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
     * @param {Pointer<PERBANDINFO>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, PERBANDINFO.Ptr, param1, BOOL)
        return result
    }

    /**
     * A PFN_DrvQueryPerBandInfo that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQueryPerBandInfo {
        /**
         * Creates a PFN_DrvQueryPerBandInfo pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, PERBANDINFO) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, PERBANDINFO.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
