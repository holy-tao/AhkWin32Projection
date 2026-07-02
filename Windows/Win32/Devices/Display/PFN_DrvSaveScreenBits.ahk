#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvSaveScreenBits {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvSaveScreenBits) {
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
     * @param {Pointer} param2 
     * @param {Pointer<RECTL>} param3 
     * @returns {Pointer} 
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, UInt32, param1, IntPtr, param2, RECTL.Ptr, param3, IntPtr)
        return result
    }

    /**
     * A PFN_DrvSaveScreenBits that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvSaveScreenBits {
        /**
         * Creates a PFN_DrvSaveScreenBits pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, UInt32, IntPtr, RECTL) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, UInt32, IntPtr, RECTL.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
