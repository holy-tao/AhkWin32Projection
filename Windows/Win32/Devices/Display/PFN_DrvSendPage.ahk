#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SURFOBJ.ahk" { SURFOBJ }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvSendPage {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvSendPage) {
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
     * @returns {BOOL} 
     */
    Call(param0) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, BOOL)
        return result
    }

    /**
     * A PFN_DrvSendPage that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvSendPage {
        /**
         * Creates a PFN_DrvSendPage pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
