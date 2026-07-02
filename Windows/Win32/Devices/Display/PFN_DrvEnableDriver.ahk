#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DRVENABLEDATA.ahk" { DRVENABLEDATA }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvEnableDriver {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvEnableDriver) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer<DRVENABLEDATA>} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, UInt32, param0, UInt32, param1, DRVENABLEDATA.Ptr, param2, BOOL)
        return result
    }

    /**
     * A PFN_DrvEnableDriver that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvEnableDriver {
        /**
         * Creates a PFN_DrvEnableDriver pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, DRVENABLEDATA) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, DRVENABLEDATA.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
